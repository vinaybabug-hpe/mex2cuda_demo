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
 Description : Matlab function for interacting with mathworks environment.
 ============================================================================
 */

#include <iostream>
#include <numeric>
#include "mex.h"
#include <stdlib.h> /* needed to define exit() */
#include <unistd.h> /* needed to define getpid() */
#include <stdio.h> /* needed for printf() */
#include <sys/types.h>
#include <assert.h>
#include <sys/errno.h>
#include <fcntl.h>

#include "common/wrapperFuncs.h"


/*
 * Host code
 */
void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, mxArray const *prhs[])
{


#define NUM_THREADS		prhs[0]


	int num_cuda_threads = 0;



	num_cuda_threads = mxGetScalar(NUM_THREADS);

	mexPrintf("Number of threads passed is %d \n", num_cuda_threads);

	// Calling cuda wrapper that in turn call gpu device code.
	mex2CudaWrapper();

}




