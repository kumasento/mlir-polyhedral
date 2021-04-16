#include <math.h>
#define ceild(n,d)  (((n)<0) ? -((-(n))/(d)) : ((n)+(d)-1)/(d))
#define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
#define max(x,y)    ((x) > (y)? (x) : (y))
#define min(x,y)    ((x) < (y)? (x) : (y))

// TODO: mlir-clang %s %stdinclude | FileCheck %s
// RUN: clang %s -O3 %stdinclude %polyverify -o %s.exec1 && %s.exec1 &> %s.out1
// RUN: mlir-clang %s %polyverify %stdinclude -emit-llvm | clang -x ir - -O3 -o %s.execm && %s.execm &> %s.out2
// RUN: rm -f %s.exec1 %s.execm
// RUN: diff %s.out1 %s.out2
// RUN: rm -f %s.out1 %s.out2
// RUN: mlir-clang %s %polyexec %stdinclude -emit-llvm | clang -x ir - -O3 -o %s.execm && %s.execm > %s.mlir.time; cat %s.mlir.time | FileCheck %s --check-prefix EXEC
// RUN: clang %s -O3 %polyexec %stdinclude -o %s.exec2 && %s.exec2 > %s.clang.time; cat %s.clang.time | FileCheck %s --check-prefix EXEC
// RUN: rm -f %s.exec2 %s.execm

/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */
/* doitgen.c: this file is part of PolyBench/C */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
#include "doitgen.h"


/* Array initialization. */
static
void init_array(int nr, int nq, int np,
		DATA_TYPE POLYBENCH_3D(A,NR,NQ,NP,nr,nq,np),
		DATA_TYPE POLYBENCH_2D(C4,NP,NP,np,np))
{
  int i, j, k;

  for (i = 0; i < nr; i++)
    for (j = 0; j < nq; j++)
      for (k = 0; k < np; k++)
	A[i][j][k] = (DATA_TYPE) ((i*j + k)%np) / np;
  for (i = 0; i < np; i++)
    for (j = 0; j < np; j++)
      C4[i][j] = (DATA_TYPE) (i*j % np) / np;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int nr, int nq, int np,
		 DATA_TYPE POLYBENCH_3D(A,NR,NQ,NP,nr,nq,np))
{
  int i, j, k;

  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("A");
  for (i = 0; i < nr; i++)
    for (j = 0; j < nq; j++)
      for (k = 0; k < np; k++) {
	if ((i*nq*np+j*np+k) % 20 == 0) fprintf (POLYBENCH_DUMP_TARGET, "\n");
	fprintf (POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, A[i][j][k]);
      }
  POLYBENCH_DUMP_END("A");
  POLYBENCH_DUMP_FINISH;
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_doitgen(int nr, int nq, int np,
		    DATA_TYPE POLYBENCH_3D(A,NR,NQ,NP,nr,nq,np),
		    DATA_TYPE POLYBENCH_2D(C4,NP,NP,np,np),
		    DATA_TYPE POLYBENCH_1D(sum,NP,np),
		    DATA_TYPE POLYBENCH_2D(S,NP,NP,np,np))
{
  int r, q, p, s;

  int t1, t2, t3, t4, t5, t6, t7;
 register int lbv, ubv;
if ((_PB_NP >= 1) && (_PB_NQ >= 1) && (_PB_NR >= 1)) {
  for (t1=0;t1<=_PB_NR-1;t1++) {
    for (t2=0;t2<=_PB_NQ-1;t2++) {
      for (t4=0;t4<=floord(_PB_NP-1,32);t4++) {
        for (t5=0;t5<=floord(_PB_NP-1,32);t5++) {
          for (t6=32*t5;t6<=min(_PB_NP-1,32*t5+31);t6++) {
            for (t7=32*t4;t7<=min(_PB_NP-1,32*t4+31);t7++) {
              S[t6][t7] = A[t1][t2][t6] * C4[t6][t7];;
            }
          }
        }
      }
      for (t4=0;t4<=floord(_PB_NP-1,32);t4++) {
        for (t5=32*t4;t5<=min(_PB_NP-1,32*t4+31);t5++) {
          sum[t5] = SCALAR_VAL(0.0);;
        }
      }
      for (t4=0;t4<=floord(_PB_NP-1,32);t4++) {
        for (t5=0;t5<=floord(_PB_NP-1,32);t5++) {
          for (t6=32*t5;t6<=min(_PB_NP-1,32*t5+31);t6++) {
            for (t7=32*t4;t7<=min(_PB_NP-1,32*t4+31);t7++) {
              sum[t7] += S[t6][t7];;
            }
          }
        }
      }
      for (t4=0;t4<=floord(_PB_NP-1,32);t4++) {
        for (t5=32*t4;t5<=min(_PB_NP-1,32*t4+31);t5++) {
          A[t1][t2][t5] = sum[t5];;
        }
      }
    }
  }
}

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int nr = NR;
  int nq = NQ;
  int np = NP;

  /* Variable declaration/allocation. */
  POLYBENCH_3D_ARRAY_DECL(A,DATA_TYPE,NR,NQ,NP,nr,nq,np);
  POLYBENCH_1D_ARRAY_DECL(sum,DATA_TYPE,NP,np);
  POLYBENCH_2D_ARRAY_DECL(S,DATA_TYPE,NP,NP,np,np);
  POLYBENCH_2D_ARRAY_DECL(C4,DATA_TYPE,NP,NP,np,np);

  /* Initialize array(s). */
  init_array (nr, nq, np,
	      POLYBENCH_ARRAY(A),
	      POLYBENCH_ARRAY(C4));

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  kernel_doitgen (nr, nq, np,
		  POLYBENCH_ARRAY(A),
		  POLYBENCH_ARRAY(C4),
		  POLYBENCH_ARRAY(sum),
		  POLYBENCH_ARRAY(S));

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(nr, nq, np,  POLYBENCH_ARRAY(A)));

  /* Be clean. */
  POLYBENCH_FREE_ARRAY(A);
  POLYBENCH_FREE_ARRAY(sum);
  POLYBENCH_FREE_ARRAY(S);
  POLYBENCH_FREE_ARRAY(C4);

  return 0;
}

// CHECK:   func @kernel_doitgen(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: memref<150x140x160xf64>, %arg4: memref<160x160xf64>, %arg5: memref<160xf64>) {
// CHECK-NEXT:  %cst = constant 0.000000e+00 : f64
// CHECK-NEXT:  %0 = index_cast %arg0 : i32 to index
// CHECK-NEXT:  %1 = index_cast %arg1 : i32 to index
// CHECK-NEXT:  %2 = index_cast %arg2 : i32 to index
// CHECK-NEXT:  affine.for %arg6 = 0 to %0 {
// CHECK-NEXT:    affine.for %arg7 = 0 to %1 {
// CHECK-NEXT:      affine.for %arg8 = 0 to %2 {
// CHECK-NEXT:        affine.store %cst, %arg5[%arg8] : memref<160xf64>
// CHECK-NEXT:        %3 = affine.load %arg5[%arg8] : memref<160xf64>
// CHECK-NEXT:        affine.for %arg9 = 0 to %2 {
// CHECK-NEXT:          %4 = affine.load %arg3[%arg6, %arg7, %arg9] : memref<150x140x160xf64>
// CHECK-NEXT:          %5 = affine.load %arg4[%arg9, %arg8] : memref<160x160xf64>
// CHECK-NEXT:          %6 = mulf %4, %5 : f64
// CHECK-NEXT:          %7 = addf %3, %6 : f64
// CHECK-NEXT:          affine.store %7, %arg5[%arg8] : memref<160xf64>
// CHECK-NEXT:        }
// CHECK-NEXT:      }
// CHECK-NEXT:      affine.for %arg8 = 0 to %2 {
// CHECK-NEXT:        %3 = affine.load %arg5[%arg8] : memref<160xf64>
// CHECK-NEXT:        affine.store %3, %arg3[%arg6, %arg7, %arg8] : memref<150x140x160xf64>
// CHECK-NEXT:      }
// CHECK-NEXT:    }
// CHECK-NEXT:  }
// CHECK-NEXT:  return
// CHECK-NEXT: }

// EXEC: {{[0-9]\.[0-9]+}}
