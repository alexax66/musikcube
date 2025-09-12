include(CheckCXXSourceCompiles)

set(_ATOMIC_LINK_TEST_CODE "
#include <stdint.h>
int main() {
  volatile unsigned long long v = 0;
  __atomic_fetch_add(&v, 1ULL, __ATOMIC_SEQ_CST);
  return (int)v;
}
")

function(check_and_add_libatomic out_var)
  set(CMAKE_REQUIRED_LIBRARIES "")
  check_cxx_source_compiles("${_ATOMIC_LINK_TEST_CODE}" _ATOMIC_NO_LIB_OK)

  if(_ATOMIC_NO_LIB_OK)
    message(STATUS "atomics link without libatomic — not adding it")
    return()
  endif()

  set(CMAKE_REQUIRED_LIBRARIES atomic)
  check_cxx_source_compiles("${_ATOMIC_LINK_TEST_CODE}" _ATOMIC_WITH_LIB_OK)

  if(_ATOMIC_WITH_LIB_OK)
    message(STATUS "atomics require libatomic — adding it")
    set(${out_var} ${${out_var}} atomic PARENT_SCOPE)
  else()
    message(WARNING "atomics failed even with libatomic; not adding it")
  endif()
endfunction()