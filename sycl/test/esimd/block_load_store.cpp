// RUN: %clangxx -fsycl -fsyntax-only -Xclang -verify %s

#include <CL/sycl.hpp>
#include <sycl/ext/intel/experimental/esimd.hpp>
#include <limits>
#include <utility>

using namespace sycl::ext::intel::experimental::esimd;
using namespace cl::sycl;

SYCL_EXTERNAL void kernel1(
    accessor<int, 1, access::mode::read_write, access::target::global_buffer>
        &buf) SYCL_ESIMD_FUNCTION {
  simd<int, 32> v1(0, 1);
  // expected-warning@+2 {{deprecated}}
  // expected-note@sycl/ext/intel/experimental/esimd/esimd_memory.hpp:191 {{}}
  auto v0 = block_load<int, 32>(buf, 0);
  v0 = v0 + v1;
  // expected-warning@+2 {{deprecated}}
  // expected-note@sycl/ext/intel/experimental/esimd/esimd_memory.hpp:223 {{}}
  block_store<int, 32>(buf, 0, v0);
}

SYCL_EXTERNAL void kernel2(int *ptr) SYCL_ESIMD_FUNCTION {
  simd<int, 32> v1(0, 1);
  // expected-warning@+2 {{deprecated}}
  // expected-note@sycl/ext/intel/experimental/esimd/esimd_memory.hpp:172 {{}}
  auto v0 = block_load<int, 32>(ptr);
  v0 = v0 + v1;
  // expected-warning@+2 {{deprecated}}
  // expected-note@sycl/ext/intel/experimental/esimd/esimd_memory.hpp:204 {{}}
  block_store<int, 32>(ptr, v0);
}
