# See LICENSE for license details.

#*****************************************************************************
# fcmpq.S
#-----------------------------------------------------------------------------
#
# Test f{lt|le}q.s instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_FP_CMP_OP_S( 2, fleq.s, 0x00, 1, -1.36, -1.36)
  TEST_FP_CMP_OP_S( 3, fltq.s, 0x00, 0, -1.36, -1.36)

  TEST_FP_CMP_OP_S( 4, fleq.s, 0x00, 1, -1.37, -1.36)
  TEST_FP_CMP_OP_S( 5, fltq.s, 0x00, 1, -1.37, -1.36)

  # qNaN should not signal invalid.
  TEST_FP_CMP_OP_S( 6, fltq.s, 0x00, 0, NaN, 0)
  TEST_FP_CMP_OP_S( 7, fltq.s, 0x00, 0, NaN, NaN)
  TEST_FP_CMP_OP_S( 8, fltq.s, 0x10, 0, sNaNf, 0)
  TEST_FP_CMP_OP_S( 9, fleq.s, 0x00, 0, NaN, 0)
  TEST_FP_CMP_OP_S(10, fleq.s, 0x00, 0, NaN, NaN)
  TEST_FP_CMP_OP_S(11, fleq.s, 0x10, 0, sNaNf, 0)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
