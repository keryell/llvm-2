//==------------ esimd.hpp - DPC++ Explicit SIMD API -----------------------==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
// The main header of the Explicit SIMD API.
//===----------------------------------------------------------------------===//

#pragma once

#ifdef __SYCL_DEVICE_ONLY__
#define SYCL_ESIMD_KERNEL __attribute__((sycl_explicit_simd))
#define SYCL_ESIMD_FUNCTION __attribute__((sycl_explicit_simd))
#else
#define SYCL_ESIMD_KERNEL
#define SYCL_ESIMD_FUNCTION
#endif

/// \defgroup sycl_esimd DPC++ Explicit SIMD API

#include <sycl/ext/intel/experimental/esimd/esimd.hpp>
#include <sycl/ext/intel/experimental/esimd/esimd_math.hpp>
#include <sycl/ext/intel/experimental/esimd/esimd_memory.hpp>
#include <sycl/ext/intel/experimental/esimd/esimd_view.hpp>
