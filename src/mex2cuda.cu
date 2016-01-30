/*
 ============================================================================
 Name        : ensembleClust_pall_cuda.cu
 Author      : Vinay B Gavirangaswamy
 Version     :
 Copyright   :  This program is free software: you can redistribute it and/or modify
    			it under the terms of the GNU General Public License as published by
    			the Free Software Foundation, either version 3 of the License, or
    			(at your option) any later version.

    			This program is distributed in the hope that it will be useful,
    			but WITHOUT ANY WARRANTY; without even the implied warranty of
    			MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    			GNU General Public License for more details.


    			You should have received a copy of the GNU General Public License
    			along with this program.  If not, see <http://www.gnu.org/licenses/>.
 Description : CUDA related code goes into this file. You can customize it according to project needs. 
 ============================================================================
 */

#include <iostream>
#include <numeric>
#include <stdlib.h>
#include <stdio.h>
#include <cuda_runtime.h>
#include <helper_cuda.h>
#include <helper_functions.h>
#include "common/wrapperFuncs.h"

__global__ void cudaKernel();

/*
 * Wrapper function
 */

void mex2CudaWrapper(){

	printf("Hello World from cuda kernel\n");

	cudaKernel<<<1, 1>>>();

}

/*
 * Host code
 */
__global__ void cudaKernel(){

	int tid = blockIdx.x;



}

/**
 * Check the return value of the CUDA runtime API call and exit
 * the application if the call has failed.
 */
/*static void CheckCudaErrorAux (const char *file, unsigned line, const char *statement, cudaError_t err)
{
	if (err == cudaSuccess)
		return;
	std::cerr << statement<<" returned " << cudaGetErrorString(err) << "("<<err<< ") at "<<file<<":"<<line << std::endl;
	exit (1);
}*/

