# See LICENSE for license details.

#*****************************************************************************
# fcvtmod.S
#-----------------------------------------------------------------------------
#
# Test fcvtmod.w.d instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_FP_INT_OP_D(2,  fcvtmod.w.d, 0x01,         -1, -1.1, rtz);
  TEST_FP_INT_OP_D(3,  fcvtmod.w.d, 0x00,         -1, -1.0, rtz);
  TEST_FP_INT_OP_D(4,  fcvtmod.w.d, 0x01,          0, -0.9, rtz);
  TEST_FP_INT_OP_D(5,  fcvtmod.w.d, 0x01,          0,  0.9, rtz);
  TEST_FP_INT_OP_D(6,  fcvtmod.w.d, 0x00,          1,  1.0, rtz);
  TEST_FP_INT_OP_D(7,  fcvtmod.w.d, 0x01,          1,  1.1, rtz);
  TEST_FP_INT_OP_D(8,  fcvtmod.w.d, 0x10, 0x4d2fa200, -3e9, rtz); # FIXME: check the test case is correct
  TEST_FP_INT_OP_D(9,  fcvtmod.w.d, 0x10, 0xb2d05e00,  3e9, rtz); # FIXME: check the test case is correct

  # test negative NaN, negative infinity conversion
  TEST_CASE(10, x1, 0, la x1, tdat_d; fld f1,  0(x1); fcvtmod.w.d x1, f1, rtz)
  TEST_CASE(11, x1, 0, la x1, tdat_d; fld f1, 16(x1); fcvtmod.w.d x1, f1, rtz)

  # test positive NaN, positive infinity conversion
  TEST_CASE(12, x1, 0, la x1, tdat_d; fld f1,  8(x1); fcvtmod.w.d x1, f1, rtz)
  TEST_CASE(13, x1, 0, la x1, tdat_d; fld f1, 24(x1); fcvtmod.w.d x1, f1, rtz)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

# -NaN, NaN, -inf, +inf
tdat_d:
.dword 0xffffffffffffffff
.dword 0x7fffffffffffffff
.dword 0xfff0000000000000
.dword 0x7ff0000000000000

RVTEST_DATA_END
