#map0 = affine_map<(d0) -> (-d0 + 2500)>
#map1 = affine_map<(d0) -> (d0 - 1)>
#map2 = affine_map<(d0)[s0] -> (-d0 + s0)>
#map3 = affine_map<(d0)[s0] -> (-d0 + s0 - 1)>
#map4 = affine_map<(d0) -> (d0)>
#map5 = affine_map<()[s0] -> ((s0 - 62) floordiv 32 + 1)>
#map6 = affine_map<(d0)[s0] -> (d0 * -32 + s0 - 31)>
#map7 = affine_map<(d0) -> (d0 * 32 + 31)>
#map8 = affine_map<()[s0] -> (0, (s0 - 61) ceildiv 32)>
#map9 = affine_map<()[s0] -> ((s0 - 1) floordiv 16 + 1)>
#map10 = affine_map<(d0)[s0] -> (0, (d0 * 32 - s0 + 1) ceildiv 32)>
#map11 = affine_map<(d0)[s0] -> ((s0 - 1) floordiv 32 + 1, d0 + 1)>
#map12 = affine_map<()[s0] -> (s0 - 1)>
#map13 = affine_map<(d0, d1)[s0] -> (2, d0 * 32 - d1 * 32, d1 * -32 + s0 - 30)>
#map14 = affine_map<(d0, d1)[s0] -> (s0, d0 * 32 - d1 * 32 + 32)>
#map15 = affine_map<(d0, d1)[s0] -> (d0 * 32, -d1 + s0 + 1)>
#map16 = affine_map<(d0)[s0] -> (s0, d0 * 32 + 32)>
#set0 = affine_set<(d0) : (d0 >= 0)>
#set1 = affine_set<(d0) : (-d0 + 2499 >= 0)>
#set2 = affine_set<(d0, d1) : (d0 >= 0, -d1 + 2499 >= 0)>
#set3 = affine_set<(d0, d1) : (d1 - d0 - 1 >= 0)>
#set4 = affine_set<(d0)[s0] : (-d0 + s0 - 1 >= 0)>
#set5 = affine_set<(d0, d1)[s0] : (d0 >= 0, -d1 + s0 - 1 >= 0)>
#set6 = affine_set<()[s0] : (s0 - 62 >= 0)>
#set7 = affine_set<()[s0] : ((s0 + 2) mod 32 == 0)>
#set8 = affine_set<(d0, d1)[s0] : (-d0 + (s0 - 31) floordiv 32 >= 0, -d1 + s0 floordiv 32 - 1 >= 0)>
#set9 = affine_set<(d0, d1)[s0] : (d0 - d1 == 0, d0 - (s0 - 31) ceildiv 32 >= 0)>
#set10 = affine_set<(d0, d1)[s0] : ((-d1 + s0) floordiv 32 - d0 >= 0)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"}  {
  llvm.mlir.global internal constant @str9("%0.6f\0A\00")
  global_memref "private" @polybench_t_end : memref<1xf64>
  llvm.mlir.global internal constant @str8("Error return from gettimeofday: %d\00")
  llvm.func @printf(!llvm.ptr<i8>, ...) -> !llvm.i32
  llvm.func @gettimeofday(!llvm.ptr<struct<"struct.timeval", (i64, i64)>>, !llvm.ptr<struct<"struct.timezone", (i32, i32)>>) -> !llvm.i32
  global_memref "private" @polybench_t_start : memref<1xf64>
  llvm.mlir.global internal constant @str7("==END   DUMP_ARRAYS==\0A\00")
  llvm.mlir.global internal constant @str6("\0Aend   dump: %s\0A\00")
  llvm.mlir.global internal constant @str5("%d \00")
  llvm.mlir.global internal constant @str4("\0A\00")
  llvm.mlir.global internal constant @str3("table\00")
  llvm.mlir.global internal constant @str2("begin dump: %s\00")
  llvm.mlir.global internal constant @str1("==BEGIN DUMP_ARRAYS==\0A\00")
  llvm.mlir.global external @stderr() : !llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>
  llvm.func @fprintf(!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, ...) -> !llvm.i32
  llvm.mlir.global internal constant @str0("\00")
  llvm.func @strcmp(!llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
  func @main(%arg0: i32, %arg1: !llvm.ptr<ptr<i8>>) -> i32 {
    %c2500_i32 = constant 2500 : i32
    %c42_i32 = constant 42 : i32
    %true = constant true
    %false = constant false
    %c0_i32 = constant 0 : i32
    %c4_i32 = constant 4 : i32
    %c1_i32 = constant 1 : i32
    %c2500 = constant 2500 : index
    %c0 = constant 0 : index
    %0 = alloc() : memref<2500xi8>
    %1 = alloc() : memref<2500x2500xi32>
    br ^bb1(%c0_i32 : i32)
  ^bb1(%2: i32):  // 2 preds: ^bb0, ^bb2
    %3 = cmpi "slt", %2, %c2500_i32 : i32
    %4 = index_cast %2 : i32 to index
    cond_br %3, ^bb2, ^bb3(%c0_i32 : i32)
  ^bb2:  // pred: ^bb1
    %5 = addi %2, %c1_i32 : i32
    %6 = remi_signed %5, %c4_i32 : i32
    %7 = trunci %6 : i32 to i8
    store %7, %0[%4] : memref<2500xi8>
    br ^bb1(%5 : i32)
  ^bb3(%8: i32):  // 2 preds: ^bb1, ^bb7
    %9 = cmpi "slt", %8, %c2500_i32 : i32
    %10 = index_cast %8 : i32 to index
    cond_br %9, ^bb5(%c0_i32 : i32), ^bb4
  ^bb4:  // pred: ^bb3
    %11 = get_global_memref @polybench_t_start : memref<1xf64>
    %12 = call @rtclock() : () -> f64
    store %12, %11[%c0] : memref<1xf64>
    affine.for %arg2 = 0 to 2500 {
      affine.for %arg3 = #map0(%arg2) to 2500 {
        %22 = affine.apply #map1(%arg3)
        affine.if #set0(%22) {
          call @S0(%1, %arg2, %arg3, %c2500) : (memref<2500x2500xi32>, index, index, index) -> ()
        }
        %23 = affine.apply #map2(%arg2)[%c2500]
        affine.if #set1(%23) {
          call @S1(%1, %arg2, %arg3, %c2500) : (memref<2500x2500xi32>, index, index, index) -> ()
        }
        affine.if #set2(%22, %23) {
          %24 = affine.apply #map3(%arg2)[%c2500]
          affine.if #set3(%24, %22) {
            call @S2(%1, %arg2, %arg3, %c2500, %0) : (memref<2500x2500xi32>, index, index, index, memref<2500xi8>) -> ()
          } else {
            call @S3(%1, %arg2, %arg3, %c2500) : (memref<2500x2500xi32>, index, index, index) -> ()
          }
        }
        affine.for %arg4 = #map0(%arg2) to #map4(%arg3) {
          call @S4(%1, %arg2, %arg3, %c2500, %arg4) : (memref<2500x2500xi32>, index, index, index, index) -> ()
        }
      }
    }
    %13 = get_global_memref @polybench_t_end : memref<1xf64>
    %14 = call @rtclock() : () -> f64
    store %14, %13[%c0] : memref<1xf64>
    call @polybench_timer_print() : () -> ()
    %15 = cmpi "sgt", %arg0, %c42_i32 : i32
    %16 = scf.if %15 -> (i1) {
      %22 = llvm.load %arg1 : !llvm.ptr<ptr<i8>>
      %23 = llvm.mlir.addressof @str0 : !llvm.ptr<array<1 x i8>>
      %24 = llvm.mlir.constant(0 : index) : !llvm.i64
      %25 = llvm.getelementptr %23[%24, %24] : (!llvm.ptr<array<1 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
      %26 = llvm.call @strcmp(%22, %25) : (!llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
      %27 = llvm.mlir.cast %26 : !llvm.i32 to i32
      %28 = trunci %27 : i32 to i1
      %29 = xor %28, %true : i1
      scf.yield %29 : i1
    } else {
      scf.yield %false : i1
    }
    scf.if %16 {
      call @print_array(%c2500_i32, %1) : (i32, memref<2500x2500xi32>) -> ()
    }
    return %c0_i32 : i32
  ^bb5(%17: i32):  // 2 preds: ^bb3, ^bb6
    %18 = cmpi "slt", %17, %c2500_i32 : i32
    %19 = index_cast %17 : i32 to index
    cond_br %18, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    store %c0_i32, %1[%10, %19] : memref<2500x2500xi32>
    %20 = addi %17, %c1_i32 : i32
    br ^bb5(%20 : i32)
  ^bb7:  // pred: ^bb5
    %21 = addi %8, %c1_i32 : i32
    br ^bb3(%21 : i32)
  }
  func @init_array(%arg0: i32, %arg1: memref<2500xi8>, %arg2: memref<2500x2500xi32>) {
    %c0_i32 = constant 0 : i32
    %c4_i32 = constant 4 : i32
    %c1_i32 = constant 1 : i32
    br ^bb1(%c0_i32 : i32)
  ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb2
    %1 = cmpi "slt", %0, %arg0 : i32
    %2 = index_cast %0 : i32 to index
    cond_br %1, ^bb2, ^bb3(%c0_i32 : i32)
  ^bb2:  // pred: ^bb1
    %3 = addi %0, %c1_i32 : i32
    %4 = remi_signed %3, %c4_i32 : i32
    %5 = trunci %4 : i32 to i8
    store %5, %arg1[%2] : memref<2500xi8>
    br ^bb1(%3 : i32)
  ^bb3(%6: i32):  // 2 preds: ^bb1, ^bb7
    %7 = cmpi "slt", %6, %arg0 : i32
    %8 = index_cast %6 : i32 to index
    cond_br %7, ^bb5(%c0_i32 : i32), ^bb4
  ^bb4:  // pred: ^bb3
    return
  ^bb5(%9: i32):  // 2 preds: ^bb3, ^bb6
    %10 = cmpi "slt", %9, %arg0 : i32
    %11 = index_cast %9 : i32 to index
    cond_br %10, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    store %c0_i32, %arg2[%8, %11] : memref<2500x2500xi32>
    %12 = addi %9, %c1_i32 : i32
    br ^bb5(%12 : i32)
  ^bb7:  // pred: ^bb5
    %13 = addi %6, %c1_i32 : i32
    br ^bb3(%13 : i32)
  }
  func @polybench_timer_start() {
    %c0 = constant 0 : index
    %0 = get_global_memref @polybench_t_start : memref<1xf64>
    %1 = call @rtclock() : () -> f64
    store %1, %0[%c0] : memref<1xf64>
    return
  }
  func @kernel_nussinov(%arg0: i32, %arg1: memref<2500xi8>, %arg2: memref<2500x2500xi32>) {
    %0 = index_cast %arg0 : i32 to index
    affine.for %arg3 = 0 to %0 {
      affine.for %arg4 = #map2(%arg3)[%0] to %0 {
        %1 = affine.apply #map1(%arg4)
        affine.if #set0(%1) {
          call @S0(%arg2, %arg3, %arg4, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
        }
        %2 = affine.apply #map2(%arg3)[%0]
        affine.if #set4(%2)[%0] {
          call @S1(%arg2, %arg3, %arg4, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
        }
        affine.if #set5(%1, %2)[%0] {
          %3 = affine.apply #map3(%arg3)[%0]
          affine.if #set3(%3, %1) {
            call @S2(%arg2, %arg3, %arg4, %0, %arg1) : (memref<2500x2500xi32>, index, index, index, memref<2500xi8>) -> ()
          } else {
            call @S3(%arg2, %arg3, %arg4, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
          }
        }
        affine.for %arg5 = #map2(%arg3)[%0] to #map4(%arg4) {
          call @S4(%arg2, %arg3, %arg4, %0, %arg5) : (memref<2500x2500xi32>, index, index, index, index) -> ()
        }
      }
    }
    return
  }
  func @polybench_timer_stop() {
    %c0 = constant 0 : index
    %0 = get_global_memref @polybench_t_end : memref<1xf64>
    %1 = call @rtclock() : () -> f64
    store %1, %0[%c0] : memref<1xf64>
    return
  }
  func @polybench_timer_print() {
    %c0 = constant 0 : index
    %0 = llvm.mlir.addressof @str9 : !llvm.ptr<array<7 x i8>>
    %1 = llvm.mlir.constant(0 : index) : !llvm.i64
    %2 = llvm.getelementptr %0[%1, %1] : (!llvm.ptr<array<7 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %3 = get_global_memref @polybench_t_end : memref<1xf64>
    %4 = load %3[%c0] : memref<1xf64>
    %5 = get_global_memref @polybench_t_start : memref<1xf64>
    %6 = load %5[%c0] : memref<1xf64>
    %7 = subf %4, %6 : f64
    %8 = llvm.mlir.cast %7 : f64 to !llvm.double
    %9 = llvm.call @printf(%2, %8) : (!llvm.ptr<i8>, !llvm.double) -> !llvm.i32
    return
  }
  func @print_array(%arg0: i32, %arg1: memref<2500x2500xi32>) {
    %c0_i32 = constant 0 : i32
    %c20_i32 = constant 20 : i32
    %c1_i32 = constant 1 : i32
    %0 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %1 = llvm.load %0 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %2 = llvm.mlir.addressof @str1 : !llvm.ptr<array<23 x i8>>
    %3 = llvm.mlir.constant(0 : index) : !llvm.i64
    %4 = llvm.getelementptr %2[%3, %3] : (!llvm.ptr<array<23 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %5 = llvm.call @fprintf(%1, %4) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    %6 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %7 = llvm.load %6 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %8 = llvm.mlir.addressof @str2 : !llvm.ptr<array<15 x i8>>
    %9 = llvm.getelementptr %8[%3, %3] : (!llvm.ptr<array<15 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %10 = llvm.mlir.addressof @str3 : !llvm.ptr<array<6 x i8>>
    %11 = llvm.getelementptr %10[%3, %3] : (!llvm.ptr<array<6 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %12 = llvm.call @fprintf(%7, %9, %11) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
    br ^bb1(%c0_i32, %c0_i32 : i32, i32)
  ^bb1(%13: i32, %14: i32):  // 2 preds: ^bb0, ^bb5
    %15 = cmpi "slt", %13, %arg0 : i32
    %16 = index_cast %13 : i32 to index
    cond_br %15, ^bb3(%13, %14 : i32, i32), ^bb2
  ^bb2:  // pred: ^bb1
    %17 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %18 = llvm.load %17 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %19 = llvm.mlir.addressof @str6 : !llvm.ptr<array<17 x i8>>
    %20 = llvm.getelementptr %19[%3, %3] : (!llvm.ptr<array<17 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %21 = llvm.mlir.addressof @str3 : !llvm.ptr<array<6 x i8>>
    %22 = llvm.getelementptr %21[%3, %3] : (!llvm.ptr<array<6 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %23 = llvm.call @fprintf(%18, %20, %22) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
    %24 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %25 = llvm.load %24 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %26 = llvm.mlir.addressof @str7 : !llvm.ptr<array<23 x i8>>
    %27 = llvm.getelementptr %26[%3, %3] : (!llvm.ptr<array<23 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %28 = llvm.call @fprintf(%25, %27) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    return
  ^bb3(%29: i32, %30: i32):  // 2 preds: ^bb1, ^bb4
    %31 = cmpi "slt", %29, %arg0 : i32
    %32 = index_cast %29 : i32 to index
    cond_br %31, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %33 = remi_signed %30, %c20_i32 : i32
    %34 = cmpi "eq", %33, %c0_i32 : i32
    scf.if %34 {
      %45 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
      %46 = llvm.load %45 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
      %47 = llvm.mlir.addressof @str4 : !llvm.ptr<array<2 x i8>>
      %48 = llvm.getelementptr %47[%3, %3] : (!llvm.ptr<array<2 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
      %49 = llvm.call @fprintf(%46, %48) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    }
    %35 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %36 = llvm.load %35 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %37 = llvm.mlir.addressof @str5 : !llvm.ptr<array<4 x i8>>
    %38 = llvm.getelementptr %37[%3, %3] : (!llvm.ptr<array<4 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %39 = load %arg1[%16, %32] : memref<2500x2500xi32>
    %40 = llvm.mlir.cast %39 : i32 to !llvm.i32
    %41 = llvm.call @fprintf(%36, %38, %40) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", (ptr<struct<"struct._IO_marker">>, ptr<struct<"struct._IO_FILE">>, i32, array<4 x i8>)>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.i32) -> !llvm.i32
    %42 = addi %30, %c1_i32 : i32
    %43 = addi %29, %c1_i32 : i32
    br ^bb3(%43, %42 : i32, i32)
  ^bb5:  // pred: ^bb3
    %44 = addi %13, %c1_i32 : i32
    br ^bb1(%44, %30 : i32, i32)
  }
  func private @free(memref<?xi8>)
  func @polybench_prepare_instruments() {
    return
  }
  func @rtclock() -> f64 {
    %c0_i32 = constant 0 : i32
    %cst = constant 9.9999999999999995E-7 : f64
    %0 = llvm.mlir.constant(1 : index) : !llvm.i64
    %1 = llvm.alloca %0 x !llvm.struct<"struct.timeval", (i64, i64)> : (!llvm.i64) -> !llvm.ptr<struct<"struct.timeval", (i64, i64)>>
    %2 = llvm.mlir.null : !llvm.ptr<struct<"struct.timezone", (i32, i32)>>
    %3 = llvm.call @gettimeofday(%1, %2) : (!llvm.ptr<struct<"struct.timeval", (i64, i64)>>, !llvm.ptr<struct<"struct.timezone", (i32, i32)>>) -> !llvm.i32
    %4 = llvm.mlir.cast %3 : !llvm.i32 to i32
    %5 = llvm.load %1 : !llvm.ptr<struct<"struct.timeval", (i64, i64)>>
    %6 = llvm.extractvalue %5[0] : !llvm.struct<"struct.timeval", (i64, i64)>
    %7 = llvm.mlir.cast %6 : !llvm.i64 to i64
    %8 = llvm.extractvalue %5[1] : !llvm.struct<"struct.timeval", (i64, i64)>
    %9 = llvm.mlir.cast %8 : !llvm.i64 to i64
    %10 = cmpi "ne", %4, %c0_i32 : i32
    scf.if %10 {
      %15 = llvm.mlir.addressof @str8 : !llvm.ptr<array<35 x i8>>
      %16 = llvm.mlir.constant(0 : index) : !llvm.i64
      %17 = llvm.getelementptr %15[%16, %16] : (!llvm.ptr<array<35 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
      %18 = llvm.mlir.cast %4 : i32 to !llvm.i32
      %19 = llvm.call @printf(%17, %18) : (!llvm.ptr<i8>, !llvm.i32) -> !llvm.i32
    }
    %11 = sitofp %7 : i64 to f64
    %12 = sitofp %9 : i64 to f64
    %13 = mulf %12, %cst : f64
    %14 = addf %11, %13 : f64
    return %14 : f64
  }
  func private @S0(%arg0: memref<2500x2500xi32>, %arg1: index, %arg2: index, %arg3: index) attributes {scop.stmt} {
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2 - 1] : memref<2500x2500xi32>
    %2 = cmpi "sge", %0, %1 : i32
    %3 = scf.if %2 -> (i32) {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
      scf.yield %4 : i32
    } else {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2 - 1] : memref<2500x2500xi32>
      scf.yield %4 : i32
    }
    affine.store %3, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    return
  }
  func private @S1(%arg0: memref<2500x2500xi32>, %arg1: index, %arg2: index, %arg3: index) attributes {scop.stmt} {
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2] : memref<2500x2500xi32>
    %2 = cmpi "sge", %0, %1 : i32
    %3 = scf.if %2 -> (i32) {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
      scf.yield %4 : i32
    } else {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2] : memref<2500x2500xi32>
      scf.yield %4 : i32
    }
    affine.store %3, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    return
  }
  func private @S2(%arg0: memref<2500x2500xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<2500xi8>) attributes {scop.stmt} {
    %c3_i32 = constant 3 : i32
    %c1_i32 = constant 1 : i32
    %c0_i32 = constant 0 : i32
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2 - 1] : memref<2500x2500xi32>
    %2 = affine.load %arg4[-%arg1 + symbol(%arg3) - 1] : memref<2500xi8>
    %3 = sexti %2 : i8 to i32
    %4 = affine.load %arg4[%arg2] : memref<2500xi8>
    %5 = sexti %4 : i8 to i32
    %6 = addi %3, %5 : i32
    %7 = cmpi "eq", %6, %c3_i32 : i32
    %8 = select %7, %c1_i32, %c0_i32 : i32
    %9 = addi %1, %8 : i32
    %10 = cmpi "sge", %0, %9 : i32
    %11 = scf.if %10 -> (i32) {
      %12 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
      scf.yield %12 : i32
    } else {
      %12 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2 - 1] : memref<2500x2500xi32>
      %13 = affine.load %arg4[-%arg1 + symbol(%arg3) - 1] : memref<2500xi8>
      %14 = sexti %13 : i8 to i32
      %15 = affine.load %arg4[%arg2] : memref<2500xi8>
      %16 = sexti %15 : i8 to i32
      %17 = addi %14, %16 : i32
      %18 = cmpi "eq", %17, %c3_i32 : i32
      %19 = select %18, %c1_i32, %c0_i32 : i32
      %20 = addi %12, %19 : i32
      scf.yield %20 : i32
    }
    affine.store %11, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    return
  }
  func private @S3(%arg0: memref<2500x2500xi32>, %arg1: index, %arg2: index, %arg3: index) attributes {scop.stmt} {
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2 - 1] : memref<2500x2500xi32>
    %2 = cmpi "sge", %0, %1 : i32
    %3 = scf.if %2 -> (i32) {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
      scf.yield %4 : i32
    } else {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2 - 1] : memref<2500x2500xi32>
      scf.yield %4 : i32
    }
    affine.store %3, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    return
  }
  func private @S4(%arg0: memref<2500x2500xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) attributes {scop.stmt} {
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg4] : memref<2500x2500xi32>
    %2 = affine.load %arg0[%arg4 + 1, %arg2] : memref<2500x2500xi32>
    %3 = addi %1, %2 : i32
    %4 = cmpi "sge", %0, %3 : i32
    %5 = scf.if %4 -> (i32) {
      %6 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
      scf.yield %6 : i32
    } else {
      %6 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg4] : memref<2500x2500xi32>
      %7 = affine.load %arg0[%arg4 + 1, %arg2] : memref<2500x2500xi32>
      %8 = addi %6, %7 : i32
      scf.yield %8 : i32
    }
    affine.store %5, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<2500x2500xi32>
    return
  }
  func @kernel_nussinov_new(%arg0: i32, %arg1: memref<2500xi8>, %arg2: memref<2500x2500xi32>) {
    %c1 = constant 1 : index
    %0 = index_cast %arg0 : i32 to index
    affine.if #set6()[%0] {
      affine.if #set7()[%0] {
        affine.for %arg3 = 0 to #map5()[%0] {
          %1 = affine.apply #map6(%arg3)[%0]
          %2 = affine.apply #map7(%arg3)
          call @S0(%arg2, %1, %2, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
          %3 = affine.apply #map6(%arg3)[%0]
          %4 = affine.apply #map7(%arg3)
          call @S1(%arg2, %3, %4, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
          %5 = affine.apply #map6(%arg3)[%0]
          %6 = affine.apply #map7(%arg3)
          call @S2(%arg2, %5, %6, %0, %arg1) : (memref<2500x2500xi32>, index, index, index, memref<2500xi8>) -> ()
          %7 = affine.apply #map6(%arg3)[%0]
          %8 = affine.apply #map7(%arg3)
          call @S3(%arg2, %7, %8, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
        }
      }
    }
    affine.for %arg3 = max #map8()[%0] to #map9()[%0] {
      affine.for %arg4 = max #map10(%arg3)[%0] to min #map11(%arg3)[%0] {
        affine.if #set8(%arg3, %arg4)[%0] {
          %1 = affine.apply #map6(%arg4)[%0]
          %2 = affine.apply #map7(%arg4)
          call @S0(%arg2, %1, %2, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
          %3 = affine.apply #map6(%arg4)[%0]
          %4 = affine.apply #map7(%arg4)
          call @S1(%arg2, %3, %4, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
          %5 = affine.apply #map6(%arg4)[%0]
          %6 = affine.apply #map7(%arg4)
          call @S2(%arg2, %5, %6, %0, %arg1) : (memref<2500x2500xi32>, index, index, index, memref<2500xi8>) -> ()
          %7 = affine.apply #map6(%arg4)[%0]
          %8 = affine.apply #map7(%arg4)
          call @S3(%arg2, %7, %8, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
        }
        affine.if #set9(%arg3, %arg4)[%0] {
          %1 = affine.apply #map12()[%0]
          call @S0(%arg2, %c1, %1, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
          %2 = affine.apply #map12()[%0]
          call @S1(%arg2, %c1, %2, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
          %3 = affine.apply #map12()[%0]
          call @S2(%arg2, %c1, %3, %0, %arg1) : (memref<2500x2500xi32>, index, index, index, memref<2500xi8>) -> ()
          %4 = affine.apply #map12()[%0]
          call @S3(%arg2, %c1, %4, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
        }
        affine.for %arg5 = max #map13(%arg3, %arg4)[%0] to min #map14(%arg3, %arg4)[%0] {
          affine.if #set10(%arg4, %arg5)[%0] {
            %1 = affine.apply #map2(%arg5)[%0]
            call @S0(%arg2, %arg5, %1, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
            %2 = affine.apply #map2(%arg5)[%0]
            call @S1(%arg2, %arg5, %2, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
            %3 = affine.apply #map2(%arg5)[%0]
            call @S2(%arg2, %arg5, %3, %0, %arg1) : (memref<2500x2500xi32>, index, index, index, memref<2500xi8>) -> ()
            %4 = affine.apply #map2(%arg5)[%0]
            call @S3(%arg2, %arg5, %4, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
          }
          affine.for %arg6 = max #map15(%arg4, %arg5)[%0] to min #map16(%arg4)[%0] {
            call @S0(%arg2, %arg5, %arg6, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
            call @S1(%arg2, %arg5, %arg6, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
            call @S2(%arg2, %arg5, %arg6, %0, %arg1) : (memref<2500x2500xi32>, index, index, index, memref<2500xi8>) -> ()
            call @S3(%arg2, %arg5, %arg6, %0) : (memref<2500x2500xi32>, index, index, index) -> ()
            affine.for %arg7 = #map2(%arg5)[%0] to #map4(%arg6) {
              call @S4(%arg2, %arg5, %arg6, %0, %arg7) : (memref<2500x2500xi32>, index, index, index, index) -> ()
            }
          }
        }
      }
    }
    return
  }
}
