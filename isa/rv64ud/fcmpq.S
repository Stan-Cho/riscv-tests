# See LICENSE for license details.

#*****************************************************************************
# fcmpq.S
#-----------------------------------------------------------------------------
#
# Test f{lt|le}q.d instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

#if __riscv_xlen == 32
    # Replace the function with the 32-bit variant defined in test_macros.h
    #undef TEST_FP_CMP_OP_D
    #define TEST_FP_CMP_OP_D TEST_FP_CMP_OP_D32
#endif

  TEST_FP_CMP_OP_D( 2, fleq.d, 0x00, 1, -1.36, -1.36)
  TEST_FP_CMP_OP_D( 3, fltq.d, 0x00, 0, -1.36, -1.36)

  TEST_FP_CMP_OP_D( 4, fleq.d, 0x00, 1, -1.37, -1.36)
  TEST_FP_CMP_OP_D( 5, fltq.d, 0x00, 1, -1.37, -1.36)

  # qNaN should not signal invalid.
  TEST_FP_CMP_OP_D( 6, fltq.d, 0x00, 0, NaN, 0)
  TEST_FP_CMP_OP_D( 7, fltq.d, 0x00, 0, NaN, NaN)
  TEST_FP_CMP_OP_D( 8, fltq.d, 0x10, 0, sNaN, 0)
  TEST_FP_CMP_OP_D( 9, fleq.d, 0x00, 0, NaN, 0)
  TEST_FP_CMP_OP_D(10, fleq.d, 0x00, 0, NaN, NaN)
  TEST_FP_CMP_OP_D(11, fleq.d, 0x10, 0, sNaN, 0)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
