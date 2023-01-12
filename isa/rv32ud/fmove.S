# See LICENSE for license details.

#*****************************************************************************
# fmove.S
#-----------------------------------------------------------------------------
#
# Test fmvh.x.d and fmvp.d.x instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

  TEST_CASE(2, a0, 0xfedcba98, la t0, tdat; fld f1, 0(t0); fmvh.x.d a0, f1)

  TEST_CASE_D32(3, a0, a1, 0xfedcba9876543210, la t0, tdat; lw a2, 0(t0); lw a3, 4(t0); \
                                               fmvp.d.x f0, a3, a2; \
                                               fsd f0, 8(a0); lw a0, 8(a0); lw a1, 12(a0))

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

tdat:
.word 0xfedcba98
.word 0x76543210
.word 0x00000000
.word 0x00000000

RVTEST_DATA_END
