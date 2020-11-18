// RUN: polymer-opt %s -reg2mem -split-input-file | FileCheck %s

// -----

// This is a general test case that covers many different aspects for checking.

func @load_store_dep(%A: memref<?xf32>, %B: memref<?x?xf32>) {
  %c0 = constant 0 : index
  %c1 = constant 1 : index

  %someValue = constant 1.23 : f32

  %NI = dim %A, %c0 : memref<?xf32>
  %NJ = dim %B, %c1 : memref<?x?xf32>

  affine.for %i = 0 to %NI {
    %0 = affine.load %A[%i] : memref<?xf32>
    %1 = mulf %0, %0 : f32
    affine.store %someValue, %A[%i] : memref<?xf32>

    affine.for %j = 0 to %NJ {
      %2 = mulf %1, %0 : f32
      %3 = addf %1, %2 : f32
      %4 = subf %3, %someValue : f32
      affine.store %4, %B[%i, %j] : memref<?x?xf32>
    }

    affine.store %1, %A[%i] : memref<?xf32>
  }

  return 
}

// CHECK: func @load_store_dep(%[[ARG0:.*]]: memref<?xf32>, %[[ARG1:.*]]: memref<?x?xf32>) {
// CHECK-NEXT:   %[[C0:.*]] = constant 0 : index
// CHECK-NEXT:   %[[C1:.*]] = constant 1 : index
// CHECK-NEXT:   %[[CST:.*]] = constant 1.230000e+00 : f32
// CHECK-NEXT:   %[[MEM0:.*]] = alloca() : memref<1xf32>
// CHECK-NEXT:   affine.store %[[CST]], %[[MEM0]][0] : memref<1xf32>
// CHECK-NEXT:   %[[DIM0:.*]] = dim %[[ARG0]], %[[C0]] : memref<?xf32>
// CHECK-NEXT:   %[[DIM1:.*]] = dim %[[ARG1]], %[[C1]] : memref<?x?xf32>
// CHECK-NEXT:   affine.for %[[I:.*]] = 0 to %[[DIM0]] {
// CHECK-NEXT:     %[[VAL0:.*]] = affine.load %[[MEM0]][0] : memref<1xf32>
// CHECK-NEXT:     %[[VAL1:.*]] = affine.load %[[ARG0]][%[[I]]] : memref<?xf32>
// CHECK-NEXT:     %[[MEM1:.*]] = alloca() : memref<1xf32>
// CHECK-NEXT:     affine.store %[[VAL1]], %[[MEM1]][0] : memref<1xf32>
// CHECK-NEXT:     %[[VAL2:.*]] = mulf %[[VAL1]], %[[VAL1]] : f32
// CHECK-NEXT:     %[[MEM2:.*]] = alloca() : memref<1xf32>
// CHECK-NEXT:     affine.store %[[VAL2]], %[[MEM2]][0] : memref<1xf32>
// CHECK-NEXT:     affine.store %[[VAL0]], %[[ARG0]][%[[I]]] : memref<?xf32>
// CHECK-NEXT:     affine.for %[[J:.*]] = 0 to %[[DIM1]] {
// CHECK-DAG:   %[[VAL3:.*]] = affine.load %[[MEM0]][0] : memref<1xf32>
// CHECK-DAG:   %[[VAL4:.*]] = affine.load %[[MEM1]][0] : memref<1xf32>
// CHECK-DAG:   %[[VAL5:.*]] = affine.load %[[MEM2]][0] : memref<1xf32>
// CHECK-NEXT:       %[[VAL6:.*]] = mulf %[[VAL5]], %[[VAL4]] : f32
// CHECK-NEXT:       %[[VAL7:.*]] = addf %[[VAL5]], %[[VAL6]] : f32
// CHECK-NEXT:       %[[VAL8:.*]] = subf %[[VAL7]], %[[VAL3]] : f32
// CHECK-NEXT:       affine.store %[[VAL8]], %[[ARG1]][%[[I]], %[[J]]] : memref<?x?xf32>
// CHECK-NEXT:     }
// CHECK-NEXT:     affine.store %[[VAL2]], %[[ARG0]][%[[I]]] : memref<?xf32>
// CHECK-NEXT:   }
// CHECK-NEXT:   return
// CHECK-NEXT: }

// -----

// No scratchpad memref will be created for load op that are not used by values to be stored.

// CHECK: func @load_no_use(%[[ARG0:.*]]: memref<?xf32>, %[[ARG1:.*]]: memref<?xf32>) {
func @load_no_use(%A: memref<?xf32>, %B: memref<?xf32>) {
  // CHECK: %[[C0:.*]] = constant 0 : index
  %c0 = constant 0 : index
  // CHECK-NEXT: %[[VAL0:.*]] = dim %[[ARG0]], %[[C0]] : memref<?xf32>
  %NI = dim %A, %c0 : memref<?xf32>
  // CHECK-NEXT: %[[VAL1:.*]] = affine.load %[[ARG0]][0] : memref<?xf32>
  %0 = affine.load %A[0] : memref<?xf32>
  // CHECK-NEXT: affine.for %[[ARG2:.*]] = 0 to %[[VAL0]] {
  affine.for %i = 0 to %NI {
    %1 = affine.load %A[%i] : memref<?xf32>
    affine.store %1, %B[%i] : memref<?xf32>
  }

  return
}


// -----

// Should not generate scratchpad for values being used in the same block.

func @load_use_in_same_block(%A: memref<?xf32>, %B: memref<?xf32>) {
  %c0 = constant 0 : index
  %NI = dim %A, %c0 : memref<?xf32>
  affine.for %i = 0 to %NI {
    %0 = affine.load %A[%i] : memref<?xf32>
    affine.store %0, %B[%i] : memref<?xf32>
  }

  return
}

// CHECK: func @load_use_in_same_block(%[[ARG0:.*]]: memref<?xf32>, %[[ARG1:.*]]: memref<?xf32>) {
// CHECK-NEXT: %[[C0:.*]] = constant 0 : index
// CHECK-NEXT: %[[DIM0:.*]] = dim %[[ARG0]], %[[C0]] : memref<?xf32>
// CHECK-NEXT: affine.for %[[I:.*]] = 0 to %[[DIM0]] {
// CHECK-NEXT:   %[[VAL0:.*]] = affine.load %[[ARG0]][%[[I]]] : memref<?xf32>
// CHECK-NEXT:   affine.store %[[VAL0]], %[[ARG1]][%[[I]]] : memref<?xf32>

// -----

// Should generate multiple loads for uses of the same value at different blocks.

func @multi_uses_at_diff_blocks(%A: memref<?xf32>, %B: memref<?x?xf32>, %C: memref<?x?x?xf32>) {
  %c0 = constant 0 : index 
  %c1 = constant 1 : index 
  %c2 = constant 2 : index 

  %NI = dim %C, %c0 : memref<?x?x?xf32>
  %NJ = dim %C, %c1 : memref<?x?x?xf32>
  %NK = dim %C, %c2 : memref<?x?x?xf32>

  affine.for %i = 0 to %NI {
    %0 = affine.load %A[%i] : memref<?xf32>
    affine.for %j = 0 to %NJ {
      affine.store %0, %B[%i, %j] : memref<?x?xf32>
      affine.for %k = 0 to %NK {
        affine.store %0, %C[%i, %j, %k] : memref<?x?x?xf32>
      }
    }
  }

  return
}

// CHECK: func @multi_uses_at_diff_blocks(%[[ARG0:.*]]: memref<?xf32>, %[[ARG1:.*]]: memref<?x?xf32>, %[[ARG2:.*]]: memref<?x?x?xf32>) {
// CHECK-NEXT: %[[C0:.*]] = constant 0 : index
// CHECK-NEXT: %[[C1:.*]] = constant 1 : index
// CHECK-NEXT: %[[C2:.*]] = constant 2 : index
// CHECK-NEXT: %[[DIM0:.*]] = dim %[[ARG2]], %[[C0]] : memref<?x?x?xf32>
// CHECK-NEXT: %[[DIM1:.*]] = dim %[[ARG2]], %[[C1]] : memref<?x?x?xf32>
// CHECK-NEXT: %[[DIM2:.*]] = dim %[[ARG2]], %[[C2]] : memref<?x?x?xf32>
// CHECK-NEXT: affine.for %[[I:.*]] = 0 to %[[DIM0]] {
// CHECK-NEXT:   %[[VAL0:.*]] = affine.load %[[ARG0]][%[[I]]] : memref<?xf32>
// CHECK-NEXT:   %[[MEM0:.*]] = alloca() : memref<1xf32>
// CHECK-NEXT:   affine.store %[[VAL0]], %[[MEM0]][0] : memref<1xf32>
// CHECK-NEXT:   affine.for %[[J:.*]] = 0 to %[[DIM1]] {
// CHECK-NEXT:     %[[VAL1:.*]] = affine.load %[[MEM0]][0] : memref<1xf32>
// CHECK-NEXT:     affine.store %[[VAL1]], %[[ARG1]][%[[I]], %[[J]]] : memref<?x?xf32>
// CHECK-NEXT:     affine.for %[[K:.*]] = 0 to %[[DIM2]] {
// CHECK-NEXT:       %[[VAL2:.*]] = affine.load %[[MEM0]][0] : memref<1xf32>
// CHECK-NEXT:       affine.store %[[VAL2]], %[[ARG2]][%[[I]], %[[J]], %[[K]]] : memref<?x?x?xf32>
// CHECK-NEXT:     }
// CHECK-NEXT:   }
// CHECK-NEXT: }

// ----- 

// Should only generate one load for multiple uses of the same value in the same block.

func @multi_uses_at_same_block(%A: memref<?xf32>, %B: memref<?x?xf32>, %C: memref<?x?xf32>) {
  %c0 = constant 0 : index 
  %c1 = constant 1 : index 

  %NI = dim %C, %c0 : memref<?x?xf32>
  %NJ = dim %C, %c1 : memref<?x?xf32>

  affine.for %i = 0 to %NI {
    %0 = affine.load %A[%i] : memref<?xf32>
    affine.for %j = 0 to %NJ {
      affine.store %0, %B[%i, %j] : memref<?x?xf32>
      affine.store %0, %C[%i, %j] : memref<?x?xf32>
    }
  }

  return
}

// CHECK: func @multi_uses_at_same_block(%[[ARG0:.*]]: memref<?xf32>, %[[ARG1:.*]]: memref<?x?xf32>, %[[ARG2:.*]]: memref<?x?xf32>) {
// CHECK-NEXT: %[[C0:.*]] = constant 0 : index
// CHECK-NEXT: %[[C1:.*]] = constant 1 : index
// CHECK-NEXT: %[[DIM0:.*]] = dim %[[ARG2]], %[[C0]] : memref<?x?xf32>
// CHECK-NEXT: %[[DIM1:.*]] = dim %[[ARG2]], %[[C1]] : memref<?x?xf32>
// CHECK-NEXT: affine.for %[[I:.*]] = 0 to %[[DIM0]] {
// CHECK-NEXT:   %[[VAL0:.*]] = affine.load %[[ARG0]][%[[I]]] : memref<?xf32>
// CHECK-NEXT:   %[[MEM0:.*]] = alloca() : memref<1xf32>
// CHECK-NEXT:   affine.store %[[VAL0]], %[[MEM0]][0] : memref<1xf32>
// CHECK-NEXT:   affine.for %[[J:.*]] = 0 to %[[DIM1]] {
// CHECK-NEXT:     %[[VAL1:.*]] = affine.load %[[MEM0]][0] : memref<1xf32>
// CHECK-NEXT:     affine.store %[[VAL1]], %[[ARG1]][%[[I]], %[[J]]] : memref<?x?xf32>
// CHECK-NEXT:     affine.store %[[VAL1]], %[[ARG2]][%[[I]], %[[J]]] : memref<?x?xf32>
// CHECK-NEXT:   }
// CHECK-NEXT: }


// ----- 

// Should replace uses in conditionals.

func @use_in_conds(%A: memref<?xf32>, %B: memref<?xf32>) {
  %c0 = constant 0 : index 
  %N = dim %A, %c0 : memref<?xf32>
  %M = dim %B, %c0 : memref<?xf32>

  affine.for %i = 0 to %N {
    %0 = affine.load %A[%i] : memref<?xf32>
    affine.if affine_set<(d0)[s0]: (s0 - d0 - 1 >= 0)>(%i)[%M] {
      affine.store %0, %B[%i] : memref<?xf32>
    }
  }

  return
}
