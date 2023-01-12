# See LICENSE for license details.

#*****************************************************************************
# fround.S
#-----------------------------------------------------------------------------
#
# Test fround.h, and froundnx.h instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  #define TEST_FROUND_H(testnum, flags, result, val, rm) \
    TEST_FP_RM_OP_H(testnum, fround.h, flags, result, val, rm)

  TEST_FROUND_H( 2, 0x00,    -1.0,   -1.1, rne);
  TEST_FROUND_H( 3, 0x00,    -1.0,   -1.0, rne);
  TEST_FROUND_H( 4, 0x00,     0.0,   -0.5, rne);
  TEST_FROUND_H( 5, 0x00,     0.0,    0.5, rne);
  TEST_FROUND_H( 6, 0x00,     1.0,    1.0, rne);
  TEST_FROUND_H( 7, 0x00,     1.0,    1.1, rne);
  TEST_FROUND_H( 8, 0x00,  0x0000, 0x0000, rne);
  TEST_FROUND_H( 9, 0x00,  0x8000, 0x8000, rne);
  TEST_FROUND_H(10, 0x00,  0x7c00, 0x7c00, rne);
  TEST_FROUND_H(11, 0x00,  0xfc00, 0xfc00, rne);

  TEST_FROUND_H(12, 0x00,    -1.0,   -1.1, rtz);
  TEST_FROUND_H(13, 0x00,    -1.0,   -1.0, rtz);
  TEST_FROUND_H(14, 0x00,     0.0,   -0.9, rtz);
  TEST_FROUND_H(15, 0x00,     0.0,    0.9, rtz);
  TEST_FROUND_H(16, 0x00,     1.0,    1.0, rtz);
  TEST_FROUND_H(17, 0x00,     1.0,    1.1, rtz);
  TEST_FROUND_H(18, 0x00,  0x0000, 0x0000, rtz);
  TEST_FROUND_H(19, 0x00,  0x8000, 0x8000, rtz);
  TEST_FROUND_H(20, 0x00,  0x7c00, 0x7c00, rtz);
  TEST_FROUND_H(21, 0x00,  0xfc00, 0xfc00, rtz);

  TEST_FROUND_H(22, 0x00,    -2.0,   -1.1, rdn);
  TEST_FROUND_H(23, 0x00,    -1.0,   -1.0, rdn);
  TEST_FROUND_H(24, 0x00,    -1.0,   -0.9, rdn);
  TEST_FROUND_H(25, 0x00,     0.0,    0.9, rdn);
  TEST_FROUND_H(26, 0x00,     1.0,    1.0, rdn);
  TEST_FROUND_H(27, 0x00,     1.0,    1.1, rdn);
  TEST_FROUND_H(28, 0x00,  0x0000, 0x0000, rdn);
  TEST_FROUND_H(29, 0x00,  0x8000, 0x8000, rdn);
  TEST_FROUND_H(30, 0x00,  0x7c00, 0x7c00, rdn);
  TEST_FROUND_H(31, 0x00,  0xfc00, 0xfc00, rdn);

  TEST_FROUND_H(32, 0x00,    -1.0,   -1.1, rup);
  TEST_FROUND_H(33, 0x00,    -1.0,   -1.0, rup);
  TEST_FROUND_H(34, 0x00,     0.0,   -0.9, rup);
  TEST_FROUND_H(35, 0x00,     1.0,    0.9, rup);
  TEST_FROUND_H(36, 0x00,     1.0,    1.0, rup);
  TEST_FROUND_H(37, 0x00,     2.0,    1.1, rup);
  TEST_FROUND_H(38, 0x00,  0x0000, 0x0000, rup);
  TEST_FROUND_H(39, 0x00,  0x8000, 0x8000, rup);
  TEST_FROUND_H(40, 0x00,  0x7c00, 0x7c00, rup);
  TEST_FROUND_H(41, 0x00,  0xfc00, 0xfc00, rup);

  TEST_FROUND_H(42, 0x00,    -1.0,   -1.1, rmm);
  TEST_FROUND_H(43, 0x00,    -1.0,   -1.0, rmm);
  TEST_FROUND_H(44, 0x00,    -1.0,   -0.5, rmm);
  TEST_FROUND_H(45, 0x00,     1.0,    0.5, rmm);
  TEST_FROUND_H(46, 0x00,     1.0,    1.0, rmm);
  TEST_FROUND_H(47, 0x00,     1.0,    1.1, rmm);
  TEST_FROUND_H(48, 0x00,  0x0000, 0x0000, rmm);
  TEST_FROUND_H(49, 0x00,  0x8000, 0x8000, rmm);
  TEST_FROUND_H(50, 0x00,  0x7c00, 0x7c00, rmm);
  TEST_FROUND_H(51, 0x00,  0xfc00, 0xfc00, rmm);

  TEST_CASE(52, a1, 0x10, fround.h f0, sNaNh, rne; fsflags a1, x0)
  TEST_CASE(53, a1, 0x10, fround.h f0, sNaNh, rtz; fsflags a1, x0)
  TEST_CASE(54, a1, 0x10, fround.h f0, sNaNh, rdn; fsflags a1, x0)
  TEST_CASE(55, a1, 0x10, fround.h f0, sNaNh, rup; fsflags a1, x0)
  TEST_CASE(56, a1, 0x10, fround.h f0, sNaNh, rmm; fsflags a1, x0)

  #define TEST_FROUNDNX_H(testnum, flags, result, val, rm) \
    TEST_FP_RM_OP_H(testnum, froundnx.h, flags, result, val, rm)

  TEST_FROUNDNX_H( 57, 0x01,    -1.0,   -1.1, rne);
  TEST_FROUNDNX_H( 58, 0x00,    -1.0,   -1.0, rne);
  TEST_FROUNDNX_H( 59, 0x01,     0.0,   -0.5, rne);
  TEST_FROUNDNX_H( 60, 0x01,     0.0,    0.5, rne);
  TEST_FROUNDNX_H( 61, 0x00,     1.0,    1.0, rne);
  TEST_FROUNDNX_H( 62, 0x01,     1.0,    1.1, rne);
  TEST_FROUNDNX_H( 63, 0x00,  0x0000, 0x0000, rne);
  TEST_FROUNDNX_H( 64, 0x00,  0x8000, 0x8000, rne);
  TEST_FROUNDNX_H( 65, 0x00,  0x7c00, 0x7c00, rne);
  TEST_FROUNDNX_H( 66, 0x00,  0xfc00, 0xfc00, rne);

  TEST_FROUNDNX_H( 67, 0x01,    -1.0,   -1.1, rtz);
  TEST_FROUNDNX_H( 68, 0x00,    -1.0,   -1.0, rtz);
  TEST_FROUNDNX_H( 69, 0x01,     0.0,   -0.9, rtz);
  TEST_FROUNDNX_H( 70, 0x01,     0.0,    0.9, rtz);
  TEST_FROUNDNX_H( 71, 0x00,     1.0,    1.0, rtz);
  TEST_FROUNDNX_H( 72, 0x01,     1.0,    1.1, rtz);
  TEST_FROUNDNX_H( 73, 0x00,  0x0000, 0x0000, rtz);
  TEST_FROUNDNX_H( 74, 0x00,  0x8000, 0x8000, rtz);
  TEST_FROUNDNX_H( 75, 0x00,  0x7c00, 0x7c00, rtz);
  TEST_FROUNDNX_H( 76, 0x00,  0xfc00, 0xfc00, rtz);

  TEST_FROUNDNX_H( 77, 0x01,    -2.0,   -1.1, rdn);
  TEST_FROUNDNX_H( 78, 0x00,    -1.0,   -1.0, rdn);
  TEST_FROUNDNX_H( 79, 0x01,    -1.0,   -0.9, rdn);
  TEST_FROUNDNX_H( 80, 0x01,     0.0,    0.9, rdn);
  TEST_FROUNDNX_H( 81, 0x00,     1.0,    1.0, rdn);
  TEST_FROUNDNX_H( 82, 0x01,     1.0,    1.1, rdn);
  TEST_FROUNDNX_H( 83, 0x00,  0x0000, 0x0000, rdn);
  TEST_FROUNDNX_H( 84, 0x00,  0x8000, 0x8000, rdn);
  TEST_FROUNDNX_H( 85, 0x00,  0x7c00, 0x7c00, rdn);
  TEST_FROUNDNX_H( 86, 0x00,  0xfc00, 0xfc00, rdn);

  TEST_FROUNDNX_H( 87, 0x01,    -1.0,   -1.1, rup);
  TEST_FROUNDNX_H( 88, 0x00,    -1.0,   -1.0, rup);
  TEST_FROUNDNX_H( 89, 0x01,     0.0,   -0.9, rup);
  TEST_FROUNDNX_H( 90, 0x01,     1.0,    0.9, rup);
  TEST_FROUNDNX_H( 91, 0x00,     1.0,    1.0, rup);
  TEST_FROUNDNX_H( 92, 0x01,     2.0,    1.1, rup);
  TEST_FROUNDNX_H( 93, 0x00,  0x0000, 0x0000, rup);
  TEST_FROUNDNX_H( 94, 0x00,  0x8000, 0x8000, rup);
  TEST_FROUNDNX_H( 95, 0x00,  0x7c00, 0x7c00, rup);
  TEST_FROUNDNX_H( 96, 0x00,  0xfc00, 0xfc00, rup);

  TEST_FROUNDNX_H( 97, 0x01,    -1.0,   -1.1, rmm);
  TEST_FROUNDNX_H( 98, 0x00,    -1.0,   -1.0, rmm);
  TEST_FROUNDNX_H( 99, 0x01,    -1.0,   -0.5, rmm);
  TEST_FROUNDNX_H(100, 0x01,     1.0,    0.5, rmm);
  TEST_FROUNDNX_H(101, 0x00,     1.0,    1.0, rmm);
  TEST_FROUNDNX_H(102, 0x01,     1.0,    1.1, rmm);
  TEST_FROUNDNX_H(103, 0x00,  0x0000, 0x0000, rmm);
  TEST_FROUNDNX_H(104, 0x00,  0x8000, 0x8000, rmm);
  TEST_FROUNDNX_H(105, 0x00,  0x7c00, 0x7c00, rmm);
  TEST_FROUNDNX_H(106, 0x00,  0xfc00, 0xfc00, rmm);

  TEST_CASE(107, a1, 0x10, froundnx.h f0, sNaNh, rne; fsflags a1, x0)
  TEST_CASE(108, a1, 0x10, froundnx.h f0, sNaNh, rtz; fsflags a1, x0)
  TEST_CASE(109, a1, 0x10, froundnx.h f0, sNaNh, rdn; fsflags a1, x0)
  TEST_CASE(110, a1, 0x10, froundnx.h f0, sNaNh, rup; fsflags a1, x0)
  TEST_CASE(111, a1, 0x10, froundnx.h f0, sNaNh, rmm; fsflags a1, x0)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
