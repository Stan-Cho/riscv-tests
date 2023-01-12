# See LICENSE for license details.

#*****************************************************************************
# fround.S
#-----------------------------------------------------------------------------
#
# Test fround.d, and froundnx.d instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

#if __riscv_xlen == 32
    # Replace the function with the 32-bit variant defined in test_macros.h
    #undef TEST_FP_RM_OP_D
    #define TEST_FP_RM_OP_D TEST_FP_RM_OP_D32
#endif

  #define TEST_FROUND_D(testnum, flags, result, val, rm) \
    TEST_FP_RM_OP_D(testnum, fround.d, flags, result, val, rm)

  TEST_FROUND_D( 2, 0x00,                -1.0,               -1.1, rne);
  TEST_FROUND_D( 3, 0x00,                -1.0,               -1.0, rne);
  TEST_FROUND_D( 4, 0x00,                 0.0,               -0.5, rne);
  TEST_FROUND_D( 5, 0x00,                 0.0,                0.5, rne);
  TEST_FROUND_D( 6, 0x00,                 1.0,                1.0, rne);
  TEST_FROUND_D( 7, 0x00,                 1.0,                1.1, rne);
  TEST_FROUND_D( 8, 0x00,  0x0000000000000000, 0x0000000000000000, rne);
  TEST_FROUND_D( 9, 0x00,  0x8000000000000000, 0x8000000000000000, rne);
  TEST_FROUND_D(10, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rne);
  TEST_FROUND_D(11, 0x00,  0xfff0000000000000, 0xfff0000000000000, rne);

  TEST_FROUND_D(12, 0x00,                -1.0,               -1.1, rtz);
  TEST_FROUND_D(13, 0x00,                -1.0,               -1.0, rtz);
  TEST_FROUND_D(14, 0x00,                 0.0,               -0.9, rtz);
  TEST_FROUND_D(15, 0x00,                 0.0,                0.9, rtz);
  TEST_FROUND_D(16, 0x00,                 1.0,                1.0, rtz);
  TEST_FROUND_D(17, 0x00,                 1.0,                1.1, rtz);
  TEST_FROUND_D(18, 0x00,  0x0000000000000000, 0x0000000000000000, rtz);
  TEST_FROUND_D(19, 0x00,  0x8000000000000000, 0x8000000000000000, rtz);
  TEST_FROUND_D(20, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rtz);
  TEST_FROUND_D(21, 0x00,  0xfff0000000000000, 0xfff0000000000000, rtz);

  TEST_FROUND_D(22, 0x00,                -2.0,               -1.1, rdn);
  TEST_FROUND_D(23, 0x00,                -1.0,               -1.0, rdn);
  TEST_FROUND_D(24, 0x00,                -1.0,               -0.9, rdn);
  TEST_FROUND_D(25, 0x00,                 0.0,                0.9, rdn);
  TEST_FROUND_D(26, 0x00,                 1.0,                1.0, rdn);
  TEST_FROUND_D(27, 0x00,                 1.0,                1.1, rdn);
  TEST_FROUND_D(28, 0x00,  0x0000000000000000, 0x0000000000000000, rdn);
  TEST_FROUND_D(29, 0x00,  0x8000000000000000, 0x8000000000000000, rdn);
  TEST_FROUND_D(30, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rdn);
  TEST_FROUND_D(31, 0x00,  0xfff0000000000000, 0xfff0000000000000, rdn);

  TEST_FROUND_D(32, 0x00,                -1.0,               -1.1, rup);
  TEST_FROUND_D(33, 0x00,                -1.0,               -1.0, rup);
  TEST_FROUND_D(34, 0x00,                 0.0,               -0.9, rup);
  TEST_FROUND_D(35, 0x00,                 1.0,                0.9, rup);
  TEST_FROUND_D(36, 0x00,                 1.0,                1.0, rup);
  TEST_FROUND_D(37, 0x00,                 2.0,                1.1, rup);
  TEST_FROUND_D(38, 0x00,  0x0000000000000000, 0x0000000000000000, rup);
  TEST_FROUND_D(39, 0x00,  0x8000000000000000, 0x8000000000000000, rup);
  TEST_FROUND_D(40, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rup);
  TEST_FROUND_D(41, 0x00,  0xfff0000000000000, 0xfff0000000000000, rup);

  TEST_FROUND_D(42, 0x00,                -1.0,               -1.1, rmm);
  TEST_FROUND_D(43, 0x00,                -1.0,               -1.0, rmm);
  TEST_FROUND_D(44, 0x00,                -1.0,               -0.5, rmm);
  TEST_FROUND_D(45, 0x00,                 1.0,                0.5, rmm);
  TEST_FROUND_D(46, 0x00,                 1.0,                1.0, rmm);
  TEST_FROUND_D(47, 0x00,                 1.0,                1.1, rmm);
  TEST_FROUND_D(48, 0x00,  0x0000000000000000, 0x0000000000000000, rmm);
  TEST_FROUND_D(49, 0x00,  0x8000000000000000, 0x8000000000000000, rmm);
  TEST_FROUND_D(50, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rmm);
  TEST_FROUND_D(51, 0x00,  0xfff0000000000000, 0xfff0000000000000, rmm);

  TEST_CASE(52, a1, 0x10, fround.d f0, sNaN, rne; fsflags a1, x0)
  TEST_CASE(53, a1, 0x10, fround.d f0, sNaN, rtz; fsflags a1, x0)
  TEST_CASE(54, a1, 0x10, fround.d f0, sNaN, rdn; fsflags a1, x0)
  TEST_CASE(55, a1, 0x10, fround.d f0, sNaN, rup; fsflags a1, x0)
  TEST_CASE(56, a1, 0x10, fround.d f0, sNaN, rmm; fsflags a1, x0)

  #define TEST_FROUNDNX_D(testnum, flags, result, val, rm) \
    TEST_FP_RM_OP_D(testnum, froundnx.d, flags, result, val, rm)

  TEST_FROUNDNX_D( 57, 0x01,                -1.0,               -1.1, rne);
  TEST_FROUNDNX_D( 58, 0x00,                -1.0,               -1.0, rne);
  TEST_FROUNDNX_D( 59, 0x01,                 0.0,               -0.5, rne);
  TEST_FROUNDNX_D( 60, 0x01,                 0.0,                0.5, rne);
  TEST_FROUNDNX_D( 61, 0x00,                 1.0,                1.0, rne);
  TEST_FROUNDNX_D( 62, 0x01,                 1.0,                1.1, rne);
  TEST_FROUNDNX_D( 63, 0x00,  0x0000000000000000, 0x0000000000000000, rne);
  TEST_FROUNDNX_D( 64, 0x00,  0x8000000000000000, 0x8000000000000000, rne);
  TEST_FROUNDNX_D( 65, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rne);
  TEST_FROUNDNX_D( 66, 0x00,  0xfff0000000000000, 0xfff0000000000000, rne);

  TEST_FROUNDNX_D( 67, 0x01,                -1.0,               -1.1, rtz);
  TEST_FROUNDNX_D( 68, 0x00,                -1.0,               -1.0, rtz);
  TEST_FROUNDNX_D( 69, 0x01,                 0.0,               -0.9, rtz);
  TEST_FROUNDNX_D( 70, 0x01,                 0.0,                0.9, rtz);
  TEST_FROUNDNX_D( 71, 0x00,                 1.0,                1.0, rtz);
  TEST_FROUNDNX_D( 72, 0x01,                 1.0,                1.1, rtz);
  TEST_FROUNDNX_D( 73, 0x00,  0x0000000000000000, 0x0000000000000000, rtz);
  TEST_FROUNDNX_D( 74, 0x00,  0x8000000000000000, 0x8000000000000000, rtz);
  TEST_FROUNDNX_D( 75, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rtz);
  TEST_FROUNDNX_D( 76, 0x00,  0xfff0000000000000, 0xfff0000000000000, rtz);

  TEST_FROUNDNX_D( 77, 0x01,                -2.0,               -1.1, rdn);
  TEST_FROUNDNX_D( 78, 0x00,                -1.0,               -1.0, rdn);
  TEST_FROUNDNX_D( 79, 0x01,                -1.0,               -0.9, rdn);
  TEST_FROUNDNX_D( 80, 0x01,                 0.0,                0.9, rdn);
  TEST_FROUNDNX_D( 81, 0x00,                 1.0,                1.0, rdn);
  TEST_FROUNDNX_D( 82, 0x01,                 1.0,                1.1, rdn);
  TEST_FROUNDNX_D( 83, 0x00,  0x0000000000000000, 0x0000000000000000, rdn);
  TEST_FROUNDNX_D( 84, 0x00,  0x8000000000000000, 0x8000000000000000, rdn);
  TEST_FROUNDNX_D( 85, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rdn);
  TEST_FROUNDNX_D( 86, 0x00,  0xfff0000000000000, 0xfff0000000000000, rdn);

  TEST_FROUNDNX_D( 87, 0x01,                -1.0,               -1.1, rup);
  TEST_FROUNDNX_D( 88, 0x00,                -1.0,               -1.0, rup);
  TEST_FROUNDNX_D( 89, 0x01,                 0.0,               -0.9, rup);
  TEST_FROUNDNX_D( 90, 0x01,                 1.0,                0.9, rup);
  TEST_FROUNDNX_D( 91, 0x00,                 1.0,                1.0, rup);
  TEST_FROUNDNX_D( 92, 0x01,                 2.0,                1.1, rup);
  TEST_FROUNDNX_D( 93, 0x00,  0x0000000000000000, 0x0000000000000000, rup);
  TEST_FROUNDNX_D( 94, 0x00,  0x8000000000000000, 0x8000000000000000, rup);
  TEST_FROUNDNX_D( 95, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rup);
  TEST_FROUNDNX_D( 96, 0x00,  0xfff0000000000000, 0xfff0000000000000, rup);

  TEST_FROUNDNX_D( 97, 0x01,                -1.0,               -1.1, rmm);
  TEST_FROUNDNX_D( 98, 0x00,                -1.0,               -1.0, rmm);
  TEST_FROUNDNX_D( 99, 0x01,                -1.0,               -0.5, rmm);
  TEST_FROUNDNX_D(100, 0x01,                 1.0,                0.5, rmm);
  TEST_FROUNDNX_D(101, 0x00,                 1.0,                1.0, rmm);
  TEST_FROUNDNX_D(102, 0x01,                 1.0,                1.1, rmm);
  TEST_FROUNDNX_D(103, 0x00,  0x0000000000000000, 0x0000000000000000, rmm);
  TEST_FROUNDNX_D(104, 0x00,  0x8000000000000000, 0x8000000000000000, rmm);
  TEST_FROUNDNX_D(105, 0x00,  0x7ff0000000000000, 0x7ff0000000000000, rmm);
  TEST_FROUNDNX_D(106, 0x00,  0xfff0000000000000, 0xfff0000000000000, rmm);

  TEST_CASE(107, a1, 0x10, froundnx.d f0, sNaN, rne; fsflags a1, x0)
  TEST_CASE(108, a1, 0x10, froundnx.d f0, sNaN, rtz; fsflags a1, x0)
  TEST_CASE(109, a1, 0x10, froundnx.d f0, sNaN, rdn; fsflags a1, x0)
  TEST_CASE(110, a1, 0x10, froundnx.d f0, sNaN, rup; fsflags a1, x0)
  TEST_CASE(111, a1, 0x10, froundnx.d f0, sNaN, rmm; fsflags a1, x0)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
