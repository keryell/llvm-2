//===-- Passes.td - MemRef transformation definition file --*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_MEMREF_TRANSFORMS_PASSES
#define MLIR_DIALECT_MEMREF_TRANSFORMS_PASSES

include "mlir/Pass/PassBase.td"

def FoldSubViewOps : Pass<"fold-memref-subview-ops"> {
  let summary = "Fold memref.subview ops into consumer load/store ops";
  let description = [{
    The pass folds loading/storing from/to subview ops to loading/storing
    from/to the original memref.
  }];
  let constructor = "mlir::memref::createFoldSubViewOpsPass()";
  let dependentDialects = ["memref::MemRefDialect", "vector::VectorDialect"];
}


#endif // MLIR_DIALECT_MEMREF_TRANSFORMS_PASSES

