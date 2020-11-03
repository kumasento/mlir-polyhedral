#!/usr/bin/bash

NAME="$1"
MAIN_FILE="${NAME}.c"
MAIN_LLVMIR_FILE="${NAME}.ll"
MLIR_FILE="${NAME}.mlir"
MLIR_LLVM_FILE="${NAME}_llvm.mlir"
MLIR_LLVMIR_FILE="${NAME}_mlir.ll"
MLIR_BC_FILE="${NAME}_mlir.bc"

RESULT_BC_FILE="result.bc"
RESULT_OBJ_FILE="result.o"

EXE=main

LLVM_BINDIR="${PWD}/../../../../llvm/build/bin"

${LLVM_BINDIR}/mlir-opt \
  --lower-affine \
  --convert-scf-to-std \
  --convert-std-to-llvm='emit-c-wrappers=1' \
  "${MLIR_FILE}" \
  -o "${MLIR_LLVM_FILE}" 

${LLVM_BINDIR}/mlir-translate "${MLIR_LLVM_FILE}" --mlir-to-llvmir -o "${MLIR_LLVMIR_FILE}"

${LLVM_BINDIR}/llvm-as "${MLIR_LLVMIR_FILE}" -o "${MLIR_BC_FILE}"

${LLVM_BINDIR}/clang -emit-llvm "${MAIN_FILE}" -S -o "${MAIN_LLVMIR_FILE}"

${LLVM_BINDIR}/llvm-link "${MAIN_LLVMIR_FILE}" "${MLIR_LLVMIR_FILE}" -o "${RESULT_BC_FILE}"

${LLVM_BINDIR}/llc -filetype=obj "${RESULT_BC_FILE}"

${LLVM_BINDIR}/clang "${RESULT_OBJ_FILE}" -o "${EXE}"

"./${EXE}"
