
LDIR=lib
ODIR = obj
SDIR = src
EXTERNAL=external
CPP_ODIR = obj/cpp
CU_ODIR = obj/cpp

CUDA_INSTALL_PATH := /usr/local/cuda
SDK	:= /usr/local/cuda/samples

CUDA  := $(CUDA_INSTALL_PATH)



INC = -Iinc -Iexternal -I$(CUDA)/include -I$(SDK)/common/inc 
LIB = -L$(CUDA)/lib64   -L$(SDK)/lib/linux/x86_64


# IMPORTANT : don't forget the CUDA runtime (-lcudart) !
CUDA_LIBS     := -lcudart -lcusparse -lcublas -lcudadevrt
LIBS :=

CC = gcc
NVCC= nvcc
MEX_EXE=mex
MEX_NVCC=mexcuda
AR = ar

CFLAGS:=-fPIC -g -fno-inline -w -c -O2
NVCC_CFLAGS:=-g -w -m64 -arch=sm_53
LFLAGS := -Wall
MEX_CFLAGS := COMPFLAGS='-fPIC -Wall'




mex:	Lib_cuda.a
	$(MEX_EXE) $(MEX_CFLAGS) $(INC) -L$(ODIR)/ -lmycuda $(SDIR)/mexDemoFunc.cpp $(LIB) $(LIBS) $(CUDA_LIBS)

Lib_cuda.a: cuda    
	${AR} -r $(ODIR)/libmycuda.a $(ODIR)/mex2cuda.o $(ODIR)/mex2cuda_link.o 

cuda: mkdir_o
	$(NVCC) $(NVCC_CFLAGS) $(INC)  $(SDIR)/mex2cuda.cu  -rdc=true -shared -Xcompiler '-fpic' -c -o $(ODIR)/mex2cuda.o
	$(NVCC) -dlink -shared -Xcompiler '-fpic' -o $(ODIR)/mex2cuda_link.o $(ODIR)/mex2cuda.o $(CUDA_LIBS) $(INC) $(NVCC_CFLAGS)
	

$(ODIR)/%.o: $(SDIR)/%.c mkdir_o
	$(CC) -c $(CFLAGS) $(INC) -o $@ $<  

$(ODIR)/%.ou: $(SDIR)/%.cu mkdir_o
	$(NVCC) -c $(CFLAGS) $(INC) -o $@ $<  

mkdir_o:	
	@mkdir -p $(ODIR)
	@mkdir -p $(ODIR)/common	
	
	
	
clean:
	rm -f $(ODIR)/*.o $(ODIR)/*/*.o $(ODIR)/*/*.*.o $(ODIR)/*.*.o $(OUT) $(ODIR)/*/*.a $(ODIR)/*.a
	
	