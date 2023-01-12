# See LICENSE for license details.

#*****************************************************************************
# fli.S
#-----------------------------------------------------------------------------
#
# Test fli.d instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_CASE( 2, x1,               -1.0, fli.d x1,   0)
  TEST_CASE( 3, x1, 0x0010000000000000, fli.d x1, min)
  TEST_CASE( 4, x1, 0x3ef0000000000000, fli.d x1,   2)
  TEST_CASE( 5, x1, 0x3f00000000000000, fli.d x1,   3)
  TEST_CASE( 6, x1, 0x3f70000000000000, fli.d x1,   4)
  TEST_CASE( 7, x1, 0x3f80000000000000, fli.d x1,   5)
  TEST_CASE( 8, x1,             0.0625, fli.d x1,   6)
  TEST_CASE( 9, x1,              0.125, fli.d x1,   7)
  TEST_CASE(10, x1,               0.25, fli.d x1,   8)
  TEST_CASE(11, x1,             0.3125, fli.d x1,   9)
  TEST_CASE(12, x1,              0.375, fli.d x1,  10)
  TEST_CASE(13, x1,             0.4375, fli.d x1,  11)
  TEST_CASE(14, x1,                0.5, fli.d x1,  12)
  TEST_CASE(15, x1,              0.625, fli.d x1,  13)
  TEST_CASE(16, x1,               0.75, fli.d x1,  14)
  TEST_CASE(17, x1,              0.875, fli.d x1,  15)
  TEST_CASE(18, x1,                1.0, fli.d x1,  16)
  TEST_CASE(19, x1,               1.25, fli.d x1,  17)
  TEST_CASE(20, x1,                1.5, fli.d x1,  18)
  TEST_CASE(21, x1,               1.75, fli.d x1,  19)
  TEST_CASE(22, x1,                2.0, fli.d x1,  20)
  TEST_CASE(23, x1,                2.5, fli.d x1,  21)
  TEST_CASE(24, x1,                  3, fli.d x1,  22)
  TEST_CASE(25, x1,                  4, fli.d x1,  23)
  TEST_CASE(26, x1,                  8, fli.d x1,  24)
  TEST_CASE(27, x1,                 16, fli.d x1,  25)
  TEST_CASE(28, x1,                128, fli.d x1,  26)
  TEST_CASE(29, x1,                256, fli.d x1,  27)
  TEST_CASE(30, x1, 0x40e0000000000000, fli.d x1,  28)
  TEST_CASE(31, x1, 0x40f0000000000000, fli.d x1,  29)
  TEST_CASE(32, x1, 0x7ff0000000000000, fli.d x1, inf)
  TEST_CASE(33, x1,               qNaN, fli.d x1, nan)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
