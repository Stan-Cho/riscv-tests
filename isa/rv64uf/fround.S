# See LICENSE for license details.

#*****************************************************************************
# fround.S
#-----------------------------------------------------------------------------
#
# Test fround.s, and froundnx.s instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  #define TEST_FROUND_S(testnum, flags, result, val, rm) \
    TEST_FP_RM_OP_S(testnum, fround.s, flags, result, val, rm)

  TEST_FROUND_S( 2, 0x00,        -1.0,       -1.1, rne);
  TEST_FROUND_S( 3, 0x00,        -1.0,       -1.0, rne);
  TEST_FROUND_S( 4, 0x00,         0.0,       -0.5, rne);
  TEST_FROUND_S( 5, 0x00,         0.0,        0.5, rne);
  TEST_FROUND_S( 6, 0x00,         1.0,        1.0, rne);
  TEST_FROUND_S( 7, 0x00,         1.0,        1.1, rne);
  TEST_FROUND_S( 8, 0x00,  0x00000000, 0x00000000, rne);
  TEST_FROUND_S( 9, 0x00,  0x80000000, 0x80000000, rne);
  TEST_FROUND_S(10, 0x00,  0x7f800000, 0x7f800000, rne);
  TEST_FROUND_S(11, 0x00,  0xff800000, 0xff800000, rne);

  TEST_FROUND_S(12, 0x00,        -1.0,       -1.1, rtz);
  TEST_FROUND_S(13, 0x00,        -1.0,       -1.0, rtz);
  TEST_FROUND_S(14, 0x00,         0.0,       -0.9, rtz);
  TEST_FROUND_S(15, 0x00,         0.0,        0.9, rtz);
  TEST_FROUND_S(16, 0x00,         1.0,        1.0, rtz);
  TEST_FROUND_S(17, 0x00,         1.0,        1.1, rtz);
  TEST_FROUND_S(18, 0x00,  0x00000000, 0x00000000, rtz);
  TEST_FROUND_S(19, 0x00,  0x80000000, 0x80000000, rtz);
  TEST_FROUND_S(20, 0x00,  0x7f800000, 0x7f800000, rtz);
  TEST_FROUND_S(21, 0x00,  0xff800000, 0xff800000, rtz);

  TEST_FROUND_S(22, 0x00,        -2.0,       -1.1, rdn);
  TEST_FROUND_S(23, 0x00,        -1.0,       -1.0, rdn);
  TEST_FROUND_S(24, 0x00,        -1.0,       -0.9, rdn);
  TEST_FROUND_S(25, 0x00,         0.0,        0.9, rdn);
  TEST_FROUND_S(26, 0x00,         1.0,        1.0, rdn);
  TEST_FROUND_S(27, 0x00,         1.0,        1.1, rdn);
  TEST_FROUND_S(28, 0x00,  0x00000000, 0x00000000, rdn);
  TEST_FROUND_S(29, 0x00,  0x80000000, 0x80000000, rdn);
  TEST_FROUND_S(30, 0x00,  0x7f800000, 0x7f800000, rdn);
  TEST_FROUND_S(31, 0x00,  0xff800000, 0xff800000, rdn);

  TEST_FROUND_S(32, 0x00,        -1.0,       -1.1, rup);
  TEST_FROUND_S(33, 0x00,        -1.0,       -1.0, rup);
  TEST_FROUND_S(34, 0x00,         0.0,       -0.9, rup);
  TEST_FROUND_S(35, 0x00,         1.0,        0.9, rup);
  TEST_FROUND_S(36, 0x00,         1.0,        1.0, rup);
  TEST_FROUND_S(37, 0x00,         2.0,        1.1, rup);
  TEST_FROUND_S(38, 0x00,  0x00000000, 0x00000000, rup);
  TEST_FROUND_S(39, 0x00,  0x80000000, 0x80000000, rup);
  TEST_FROUND_S(40, 0x00,  0x7f800000, 0x7f800000, rup);
  TEST_FROUND_S(41, 0x00,  0xff800000, 0xff800000, rup);

  TEST_FROUND_S(42, 0x00,        -1.0,       -1.1, rmm);
  TEST_FROUND_S(43, 0x00,        -1.0,       -1.0, rmm);
  TEST_FROUND_S(44, 0x00,        -1.0,       -0.5, rmm);
  TEST_FROUND_S(45, 0x00,         1.0,        0.5, rmm);
  TEST_FROUND_S(46, 0x00,         1.0,        1.0, rmm);
  TEST_FROUND_S(47, 0x00,         1.0,        1.1, rmm);
  TEST_FROUND_S(48, 0x00,  0x00000000, 0x00000000, rmm);
  TEST_FROUND_S(49, 0x00,  0x80000000, 0x80000000, rmm);
  TEST_FROUND_S(50, 0x00,  0x7f800000, 0x7f800000, rmm);
  TEST_FROUND_S(51, 0x00,  0xff800000, 0xff800000, rmm);

  TEST_CASE(52, a1, 0x10, fround.s f0, sNaNf, rne; fsflags a1, x0)
  TEST_CASE(53, a1, 0x10, fround.s f0, sNaNf, rtz; fsflags a1, x0)
  TEST_CASE(54, a1, 0x10, fround.s f0, sNaNf, rdn; fsflags a1, x0)
  TEST_CASE(55, a1, 0x10, fround.s f0, sNaNf, rup; fsflags a1, x0)
  TEST_CASE(56, a1, 0x10, fround.s f0, sNaNf, rmm; fsflags a1, x0)

  #define TEST_FROUNDNX_S(testnum, flags, result, val, rm) \
    TEST_FP_RM_OP_S(testnum, froundnx.s, flags, result, val, rm)

  TEST_FROUNDNX_S( 57, 0x01,        -1.0,       -1.1, rne);
  TEST_FROUNDNX_S( 58, 0x00,        -1.0,       -1.0, rne);
  TEST_FROUNDNX_S( 59, 0x01,         0.0,       -0.5, rne);
  TEST_FROUNDNX_S( 60, 0x01,         0.0,        0.5, rne);
  TEST_FROUNDNX_S( 61, 0x00,         1.0,        1.0, rne);
  TEST_FROUNDNX_S( 62, 0x01,         1.0,        1.1, rne);
  TEST_FROUNDNX_S( 63, 0x00,  0x00000000, 0x00000000, rne);
  TEST_FROUNDNX_S( 64, 0x00,  0x80000000, 0x80000000, rne);
  TEST_FROUNDNX_S( 65, 0x00,  0x7f800000, 0x7f800000, rne);
  TEST_FROUNDNX_S( 66, 0x00,  0xff800000, 0xff800000, rne);

  TEST_FROUNDNX_S( 67, 0x01,        -1.0,       -1.1, rtz);
  TEST_FROUNDNX_S( 68, 0x00,        -1.0,       -1.0, rtz);
  TEST_FROUNDNX_S( 69, 0x01,         0.0,       -0.9, rtz);
  TEST_FROUNDNX_S( 70, 0x01,         0.0,        0.9, rtz);
  TEST_FROUNDNX_S( 71, 0x00,         1.0,        1.0, rtz);
  TEST_FROUNDNX_S( 72, 0x01,         1.0,        1.1, rtz);
  TEST_FROUNDNX_S( 73, 0x00,  0x00000000, 0x00000000, rtz);
  TEST_FROUNDNX_S( 74, 0x00,  0x80000000, 0x80000000, rtz);
  TEST_FROUNDNX_S( 75, 0x00,  0x7f800000, 0x7f800000, rtz);
  TEST_FROUNDNX_S( 76, 0x00,  0xff800000, 0xff800000, rtz);

  TEST_FROUNDNX_S( 77, 0x01,        -2.0,       -1.1, rdn);
  TEST_FROUNDNX_S( 78, 0x00,        -1.0,       -1.0, rdn);
  TEST_FROUNDNX_S( 79, 0x01,        -1.0,       -0.9, rdn);
  TEST_FROUNDNX_S( 80, 0x01,         0.0,        0.9, rdn);
  TEST_FROUNDNX_S( 81, 0x00,         1.0,        1.0, rdn);
  TEST_FROUNDNX_S( 82, 0x01,         1.0,        1.1, rdn);
  TEST_FROUNDNX_S( 83, 0x00,  0x00000000, 0x00000000, rdn);
  TEST_FROUNDNX_S( 84, 0x00,  0x80000000, 0x80000000, rdn);
  TEST_FROUNDNX_S( 85, 0x00,  0x7f800000, 0x7f800000, rdn);
  TEST_FROUNDNX_S( 86, 0x00,  0xff800000, 0xff800000, rdn);

  TEST_FROUNDNX_S( 87, 0x01,        -1.0,       -1.1, rup);
  TEST_FROUNDNX_S( 88, 0x00,        -1.0,       -1.0, rup);
  TEST_FROUNDNX_S( 89, 0x01,         0.0,       -0.9, rup);
  TEST_FROUNDNX_S( 90, 0x01,         1.0,        0.9, rup);
  TEST_FROUNDNX_S( 91, 0x00,         1.0,        1.0, rup);
  TEST_FROUNDNX_S( 92, 0x01,         2.0,        1.1, rup);
  TEST_FROUNDNX_S( 93, 0x00,  0x00000000, 0x00000000, rup);
  TEST_FROUNDNX_S( 94, 0x00,  0x80000000, 0x80000000, rup);
  TEST_FROUNDNX_S( 95, 0x00,  0x7f800000, 0x7f800000, rup);
  TEST_FROUNDNX_S( 96, 0x00,  0xff800000, 0xff800000, rup);

  TEST_FROUNDNX_S( 97, 0x01,        -1.0,       -1.1, rmm);
  TEST_FROUNDNX_S( 98, 0x00,        -1.0,       -1.0, rmm);
  TEST_FROUNDNX_S( 99, 0x01,        -1.0,       -0.5, rmm);
  TEST_FROUNDNX_S(100, 0x01,         1.0,        0.5, rmm);
  TEST_FROUNDNX_S(101, 0x00,         1.0,        1.0, rmm);
  TEST_FROUNDNX_S(102, 0x01,         1.0,        1.1, rmm);
  TEST_FROUNDNX_S(103, 0x00,  0x00000000, 0x00000000, rmm);
  TEST_FROUNDNX_S(104, 0x00,  0x80000000, 0x80000000, rmm);
  TEST_FROUNDNX_S(105, 0x00,  0x7f800000, 0x7f800000, rmm);
  TEST_FROUNDNX_S(106, 0x00,  0xff800000, 0xff800000, rmm);

  TEST_CASE(107, a1, 0x10, froundnx.s f0, sNaNf, rne; fsflags a1, x0)
  TEST_CASE(108, a1, 0x10, froundnx.s f0, sNaNf, rtz; fsflags a1, x0)
  TEST_CASE(109, a1, 0x10, froundnx.s f0, sNaNf, rdn; fsflags a1, x0)
  TEST_CASE(110, a1, 0x10, froundnx.s f0, sNaNf, rup; fsflags a1, x0)
  TEST_CASE(111, a1, 0x10, froundnx.s f0, sNaNf, rmm; fsflags a1, x0)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
