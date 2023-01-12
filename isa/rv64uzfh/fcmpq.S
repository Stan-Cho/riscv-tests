# See LICENSE for license details.

#*****************************************************************************
# fcmpq.S
#-----------------------------------------------------------------------------
#
# Test f{lt|le}q.h instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_FP_CMP_OP_H( 2, fleq.h, 0x00, 1, -1.36, -1.36)
  TEST_FP_CMP_OP_H( 3, fltq.h, 0x00, 0, -1.36, -1.36)

  TEST_FP_CMP_OP_H( 4, fleq.h, 0x00, 1, -1.37, -1.36)
  TEST_FP_CMP_OP_H( 5, fltq.h, 0x00, 1, -1.37, -1.36)

  # qNaN should not signal invalid.
  TEST_FP_CMP_OP_H( 6, fltq.h, 0x00, 0, NaN, 0)
  TEST_FP_CMP_OP_H( 7, fltq.h, 0x00, 0, NaN, NaN)
  TEST_FP_CMP_OP_H( 8, fltq.h, 0x10, 0, sNaN, 0)
  TEST_FP_CMP_OP_H( 9, fleq.h, 0x00, 0, NaN, 0)
  TEST_FP_CMP_OP_H(10, fleq.h, 0x00, 0, NaN, NaN)
  TEST_FP_CMP_OP_H(11, fleq.h, 0x10, 0, sNaN, 0)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
