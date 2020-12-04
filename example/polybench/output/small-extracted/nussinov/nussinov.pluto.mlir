#map0 = affine_map<(d0)[s0] -> (-d0 + s0)>
#map1 = affine_map<(d0) -> (d0 - 1)>
#map2 = affine_map<(d0)[s0] -> (-d0 + s0 - 1)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<()[s0] -> ((s0 - 62) floordiv 32 + 1)>
#map5 = affine_map<(d0)[s0] -> (d0 * -32 + s0 - 31)>
#map6 = affine_map<(d0) -> (d0 * 32 + 31)>
#map7 = affine_map<()[s0] -> (0, (s0 - 61) ceildiv 32)>
#map8 = affine_map<()[s0] -> ((s0 - 1) floordiv 16 + 1)>
#map9 = affine_map<(d0)[s0] -> (0, (d0 * 32 - s0 + 1) ceildiv 32)>
#map10 = affine_map<(d0)[s0] -> ((s0 - 1) floordiv 32 + 1, d0 + 1)>
#map11 = affine_map<()[s0] -> (s0 - 1)>
#map12 = affine_map<(d0, d1)[s0] -> (2, d0 * 32 - d1 * 32, d1 * -32 + s0 - 30)>
#map13 = affine_map<(d0, d1)[s0] -> (s0, d0 * 32 - d1 * 32 + 32)>
#map14 = affine_map<(d0, d1)[s0] -> (d0 * 32, -d1 + s0 + 1)>
#map15 = affine_map<(d0)[s0] -> (s0, d0 * 32 + 32)>
#set0 = affine_set<(d0) : (d0 >= 0)>
#set1 = affine_set<(d0)[s0] : (-d0 + s0 - 1 >= 0)>
#set2 = affine_set<(d0, d1)[s0] : (d0 >= 0, -d1 + s0 - 1 >= 0)>
#set3 = affine_set<(d0, d1) : (d1 - d0 - 1 >= 0)>
#set4 = affine_set<()[s0] : (s0 - 62 >= 0)>
#set5 = affine_set<()[s0] : ((s0 + 2) mod 32 == 0)>
#set6 = affine_set<(d0, d1)[s0] : (-d0 + (s0 - 31) floordiv 32 >= 0, -d1 + s0 floordiv 32 - 1 >= 0)>
#set7 = affine_set<(d0, d1)[s0] : (d0 - d1 == 0, d0 - (s0 - 31) ceildiv 32 >= 0)>
#set8 = affine_set<(d0, d1)[s0] : ((-d1 + s0) floordiv 32 - d0 >= 0)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"}  {
  llvm.mlir.global internal constant @str6("==END   DUMP_ARRAYS==\0A\00")
  llvm.mlir.global internal constant @str5("\0Aend   dump: %s\0A\00")
  llvm.mlir.global internal constant @str4("%d \00")
  llvm.mlir.global internal constant @str3("\0A\00")
  llvm.mlir.global internal constant @str2("table\00")
  llvm.mlir.global internal constant @str1("begin dump: %s\00")
  llvm.mlir.global internal constant @str0("==BEGIN DUMP_ARRAYS==\0A\00")
  llvm.mlir.global external @stderr() : !llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>
  llvm.func @fprintf(!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, ...) -> !llvm.i32
  func @main(%arg0: i32, %arg1: !llvm.ptr<ptr<i8>>) -> i32 {
    %c60_i32 = constant 60 : i32
    %c0_i32 = constant 0 : i32
    %0 = alloc() : memref<60xi8>
    %1 = alloc() : memref<60x60xi32>
    call @init_array(%c60_i32, %0, %1) : (i32, memref<60xi8>, memref<60x60xi32>) -> ()
    call @kernel_nussinov_new(%c60_i32, %0, %1) : (i32, memref<60xi8>, memref<60x60xi32>) -> ()
    call @print_array(%c60_i32, %1) : (i32, memref<60x60xi32>) -> ()
    return %c0_i32 : i32
  }
  func @init_array(%arg0: i32, %arg1: memref<60xi8>, %arg2: memref<60x60xi32>) {
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
    store %5, %arg1[%2] : memref<60xi8>
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
    store %c0_i32, %arg2[%8, %11] : memref<60x60xi32>
    %12 = addi %9, %c1_i32 : i32
    br ^bb5(%12 : i32)
  ^bb7:  // pred: ^bb5
    %13 = addi %6, %c1_i32 : i32
    br ^bb3(%13 : i32)
  }
  func @kernel_nussinov(%arg0: i32, %arg1: memref<60xi8>, %arg2: memref<60x60xi32>) {
    %0 = index_cast %arg0 : i32 to index
    affine.for %arg3 = 0 to %0 {
      affine.for %arg4 = #map0(%arg3)[%0] to %0 {
        %1 = affine.apply #map1(%arg4)
        affine.if #set0(%1) {
          call @S0(%arg2, %arg3, %arg4, %0) : (memref<60x60xi32>, index, index, index) -> ()
        }
        %2 = affine.apply #map0(%arg3)[%0]
        affine.if #set1(%2)[%0] {
          call @S1(%arg2, %arg3, %arg4, %0) : (memref<60x60xi32>, index, index, index) -> ()
        }
        affine.if #set2(%1, %2)[%0] {
          %3 = affine.apply #map2(%arg3)[%0]
          affine.if #set3(%3, %1) {
            call @S2(%arg2, %arg3, %arg4, %0, %arg1) : (memref<60x60xi32>, index, index, index, memref<60xi8>) -> ()
          } else {
            call @S3(%arg2, %arg3, %arg4, %0) : (memref<60x60xi32>, index, index, index) -> ()
          }
        }
        affine.for %arg5 = #map0(%arg3)[%0] to #map3(%arg4) {
          call @S4(%arg2, %arg3, %arg4, %0, %arg5) : (memref<60x60xi32>, index, index, index, index) -> ()
        }
      }
    }
    return
  }
  func @print_array(%arg0: i32, %arg1: memref<60x60xi32>) {
    %c0_i32 = constant 0 : i32
    %c20_i32 = constant 20 : i32
    %c1_i32 = constant 1 : i32
    %0 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %1 = llvm.load %0 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %2 = llvm.mlir.addressof @str0 : !llvm.ptr<array<23 x i8>>
    %3 = llvm.mlir.constant(0 : index) : !llvm.i64
    %4 = llvm.getelementptr %2[%3, %3] : (!llvm.ptr<array<23 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %5 = llvm.call @fprintf(%1, %4) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    %6 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %7 = llvm.load %6 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr<array<15 x i8>>
    %9 = llvm.getelementptr %8[%3, %3] : (!llvm.ptr<array<15 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %10 = llvm.mlir.addressof @str2 : !llvm.ptr<array<6 x i8>>
    %11 = llvm.getelementptr %10[%3, %3] : (!llvm.ptr<array<6 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %12 = llvm.call @fprintf(%7, %9, %11) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
    br ^bb1(%c0_i32, %c0_i32 : i32, i32)
  ^bb1(%13: i32, %14: i32):  // 2 preds: ^bb0, ^bb5
    %15 = cmpi "slt", %13, %arg0 : i32
    %16 = index_cast %13 : i32 to index
    cond_br %15, ^bb3(%13, %14 : i32, i32), ^bb2
  ^bb2:  // pred: ^bb1
    %17 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %18 = llvm.load %17 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %19 = llvm.mlir.addressof @str5 : !llvm.ptr<array<17 x i8>>
    %20 = llvm.getelementptr %19[%3, %3] : (!llvm.ptr<array<17 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %21 = llvm.mlir.addressof @str2 : !llvm.ptr<array<6 x i8>>
    %22 = llvm.getelementptr %21[%3, %3] : (!llvm.ptr<array<6 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %23 = llvm.call @fprintf(%18, %20, %22) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.ptr<i8>) -> !llvm.i32
    %24 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %25 = llvm.load %24 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %26 = llvm.mlir.addressof @str6 : !llvm.ptr<array<23 x i8>>
    %27 = llvm.getelementptr %26[%3, %3] : (!llvm.ptr<array<23 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %28 = llvm.call @fprintf(%25, %27) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    return
  ^bb3(%29: i32, %30: i32):  // 2 preds: ^bb1, ^bb4
    %31 = cmpi "slt", %29, %arg0 : i32
    %32 = index_cast %29 : i32 to index
    cond_br %31, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %33 = remi_signed %30, %c20_i32 : i32
    %34 = cmpi "eq", %33, %c0_i32 : i32
    scf.if %34 {
      %45 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
      %46 = llvm.load %45 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
      %47 = llvm.mlir.addressof @str3 : !llvm.ptr<array<2 x i8>>
      %48 = llvm.getelementptr %47[%3, %3] : (!llvm.ptr<array<2 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
      %49 = llvm.call @fprintf(%46, %48) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>) -> !llvm.i32
    }
    %35 = llvm.mlir.addressof @stderr : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %36 = llvm.load %35 : !llvm.ptr<ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>>
    %37 = llvm.mlir.addressof @str4 : !llvm.ptr<array<4 x i8>>
    %38 = llvm.getelementptr %37[%3, %3] : (!llvm.ptr<array<4 x i8>>, !llvm.i64, !llvm.i64) -> !llvm.ptr<i8>
    %39 = load %arg1[%16, %32] : memref<60x60xi32>
    %40 = llvm.mlir.cast %39 : i32 to !llvm.i32
    %41 = llvm.call @fprintf(%36, %38, %40) : (!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, !llvm.i32) -> !llvm.i32
    %42 = addi %30, %c1_i32 : i32
    %43 = addi %29, %c1_i32 : i32
    br ^bb3(%43, %42 : i32, i32)
  ^bb5:  // pred: ^bb3
    %44 = addi %13, %c1_i32 : i32
    br ^bb1(%44, %30 : i32, i32)
  }
  func private @free(memref<?xi8>)
  func private @S0(%arg0: memref<60x60xi32>, %arg1: index, %arg2: index, %arg3: index) attributes {scop.stmt} {
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2 - 1] : memref<60x60xi32>
    %2 = cmpi "sge", %0, %1 : i32
    %3 = scf.if %2 -> (i32) {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
      scf.yield %4 : i32
    } else {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2 - 1] : memref<60x60xi32>
      scf.yield %4 : i32
    }
    affine.store %3, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    return
  }
  func private @S1(%arg0: memref<60x60xi32>, %arg1: index, %arg2: index, %arg3: index) attributes {scop.stmt} {
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2] : memref<60x60xi32>
    %2 = cmpi "sge", %0, %1 : i32
    %3 = scf.if %2 -> (i32) {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
      scf.yield %4 : i32
    } else {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2] : memref<60x60xi32>
      scf.yield %4 : i32
    }
    affine.store %3, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    return
  }
  func private @S2(%arg0: memref<60x60xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<60xi8>) attributes {scop.stmt} {
    %c3_i32 = constant 3 : i32
    %c1_i32 = constant 1 : i32
    %c0_i32 = constant 0 : i32
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2 - 1] : memref<60x60xi32>
    %2 = affine.load %arg4[-%arg1 + symbol(%arg3) - 1] : memref<60xi8>
    %3 = sexti %2 : i8 to i32
    %4 = affine.load %arg4[%arg2] : memref<60xi8>
    %5 = sexti %4 : i8 to i32
    %6 = addi %3, %5 : i32
    %7 = cmpi "eq", %6, %c3_i32 : i32
    %8 = select %7, %c1_i32, %c0_i32 : i32
    %9 = addi %1, %8 : i32
    %10 = cmpi "sge", %0, %9 : i32
    %11 = scf.if %10 -> (i32) {
      %12 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
      scf.yield %12 : i32
    } else {
      %12 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2 - 1] : memref<60x60xi32>
      %13 = affine.load %arg4[-%arg1 + symbol(%arg3) - 1] : memref<60xi8>
      %14 = sexti %13 : i8 to i32
      %15 = affine.load %arg4[%arg2] : memref<60xi8>
      %16 = sexti %15 : i8 to i32
      %17 = addi %14, %16 : i32
      %18 = cmpi "eq", %17, %c3_i32 : i32
      %19 = select %18, %c1_i32, %c0_i32 : i32
      %20 = addi %12, %19 : i32
      scf.yield %20 : i32
    }
    affine.store %11, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    return
  }
  func private @S3(%arg0: memref<60x60xi32>, %arg1: index, %arg2: index, %arg3: index) attributes {scop.stmt} {
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2 - 1] : memref<60x60xi32>
    %2 = cmpi "sge", %0, %1 : i32
    %3 = scf.if %2 -> (i32) {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
      scf.yield %4 : i32
    } else {
      %4 = affine.load %arg0[-%arg1 + symbol(%arg3), %arg2 - 1] : memref<60x60xi32>
      scf.yield %4 : i32
    }
    affine.store %3, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    return
  }
  func private @S4(%arg0: memref<60x60xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) attributes {scop.stmt} {
    %0 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    %1 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg4] : memref<60x60xi32>
    %2 = affine.load %arg0[%arg4 + 1, %arg2] : memref<60x60xi32>
    %3 = addi %1, %2 : i32
    %4 = cmpi "sge", %0, %3 : i32
    %5 = scf.if %4 -> (i32) {
      %6 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
      scf.yield %6 : i32
    } else {
      %6 = affine.load %arg0[-%arg1 + symbol(%arg3) - 1, %arg4] : memref<60x60xi32>
      %7 = affine.load %arg0[%arg4 + 1, %arg2] : memref<60x60xi32>
      %8 = addi %6, %7 : i32
      scf.yield %8 : i32
    }
    affine.store %5, %arg0[-%arg1 + symbol(%arg3) - 1, %arg2] : memref<60x60xi32>
    return
  }
  func @kernel_nussinov_new(%arg0: i32, %arg1: memref<60xi8>, %arg2: memref<60x60xi32>) {
    %c1 = constant 1 : index
    %0 = index_cast %arg0 : i32 to index
    affine.if #set4()[%0] {
      affine.if #set5()[%0] {
        affine.for %arg3 = 0 to #map4()[%0] {
          %1 = affine.apply #map5(%arg3)[%0]
          %2 = affine.apply #map6(%arg3)
          call @S0(%arg2, %1, %2, %0) : (memref<60x60xi32>, index, index, index) -> ()
          %3 = affine.apply #map5(%arg3)[%0]
          %4 = affine.apply #map6(%arg3)
          call @S1(%arg2, %3, %4, %0) : (memref<60x60xi32>, index, index, index) -> ()
          %5 = affine.apply #map5(%arg3)[%0]
          %6 = affine.apply #map6(%arg3)
          call @S2(%arg2, %5, %6, %0, %arg1) : (memref<60x60xi32>, index, index, index, memref<60xi8>) -> ()
          %7 = affine.apply #map5(%arg3)[%0]
          %8 = affine.apply #map6(%arg3)
          call @S3(%arg2, %7, %8, %0) : (memref<60x60xi32>, index, index, index) -> ()
        }
      }
    }
    affine.for %arg3 = max #map7()[%0] to #map8()[%0] {
      affine.for %arg4 = max #map9(%arg3)[%0] to min #map10(%arg3)[%0] {
        affine.if #set6(%arg3, %arg4)[%0] {
          %1 = affine.apply #map5(%arg4)[%0]
          %2 = affine.apply #map6(%arg4)
          call @S0(%arg2, %1, %2, %0) : (memref<60x60xi32>, index, index, index) -> ()
          %3 = affine.apply #map5(%arg4)[%0]
          %4 = affine.apply #map6(%arg4)
          call @S1(%arg2, %3, %4, %0) : (memref<60x60xi32>, index, index, index) -> ()
          %5 = affine.apply #map5(%arg4)[%0]
          %6 = affine.apply #map6(%arg4)
          call @S2(%arg2, %5, %6, %0, %arg1) : (memref<60x60xi32>, index, index, index, memref<60xi8>) -> ()
          %7 = affine.apply #map5(%arg4)[%0]
          %8 = affine.apply #map6(%arg4)
          call @S3(%arg2, %7, %8, %0) : (memref<60x60xi32>, index, index, index) -> ()
        }
        affine.if #set7(%arg3, %arg4)[%0] {
          %1 = affine.apply #map11()[%0]
          call @S0(%arg2, %c1, %1, %0) : (memref<60x60xi32>, index, index, index) -> ()
          %2 = affine.apply #map11()[%0]
          call @S1(%arg2, %c1, %2, %0) : (memref<60x60xi32>, index, index, index) -> ()
          %3 = affine.apply #map11()[%0]
          call @S2(%arg2, %c1, %3, %0, %arg1) : (memref<60x60xi32>, index, index, index, memref<60xi8>) -> ()
          %4 = affine.apply #map11()[%0]
          call @S3(%arg2, %c1, %4, %0) : (memref<60x60xi32>, index, index, index) -> ()
        }
        affine.for %arg5 = max #map12(%arg3, %arg4)[%0] to min #map13(%arg3, %arg4)[%0] {
          affine.if #set8(%arg4, %arg5)[%0] {
            %1 = affine.apply #map0(%arg5)[%0]
            call @S0(%arg2, %arg5, %1, %0) : (memref<60x60xi32>, index, index, index) -> ()
            %2 = affine.apply #map0(%arg5)[%0]
            call @S1(%arg2, %arg5, %2, %0) : (memref<60x60xi32>, index, index, index) -> ()
            %3 = affine.apply #map0(%arg5)[%0]
            call @S2(%arg2, %arg5, %3, %0, %arg1) : (memref<60x60xi32>, index, index, index, memref<60xi8>) -> ()
            %4 = affine.apply #map0(%arg5)[%0]
            call @S3(%arg2, %arg5, %4, %0) : (memref<60x60xi32>, index, index, index) -> ()
          }
          affine.for %arg6 = max #map14(%arg4, %arg5)[%0] to min #map15(%arg4)[%0] {
            call @S0(%arg2, %arg5, %arg6, %0) : (memref<60x60xi32>, index, index, index) -> ()
            call @S1(%arg2, %arg5, %arg6, %0) : (memref<60x60xi32>, index, index, index) -> ()
            call @S2(%arg2, %arg5, %arg6, %0, %arg1) : (memref<60x60xi32>, index, index, index, memref<60xi8>) -> ()
            call @S3(%arg2, %arg5, %arg6, %0) : (memref<60x60xi32>, index, index, index) -> ()
            affine.for %arg7 = #map0(%arg5)[%0] to #map3(%arg6) {
              call @S4(%arg2, %arg5, %arg6, %0, %arg7) : (memref<60x60xi32>, index, index, index, index) -> ()
            }
          }
        }
      }
    }
    return
  }
}
