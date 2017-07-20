; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=sse4.1 | FileCheck %s


define <2 x double> @test_x86_sse41_blend_pd(<2 x double> %a0, <2 x double> %a1) {
; CHECK-LABEL: test_x86_sse41_blend_pd:
; CHECK:       # BB#0:
; CHECK-NEXT:    retq
  %1 = call <2 x double> @llvm.x86.sse41.blendpd(<2 x double> %a0, <2 x double> %a1, i32 0)
  ret <2 x double> %1
}

define <4 x float> @test_x86_sse41_blend_ps(<4 x float> %a0, <4 x float> %a1) {
; CHECK-LABEL: test_x86_sse41_blend_ps:
; CHECK:       # BB#0:
; CHECK-NEXT:    retq
  %1 = call <4 x float> @llvm.x86.sse41.blendps(<4 x float> %a0, <4 x float> %a1, i32 0)
  ret <4 x float> %1
}

define <8 x i16> @test_x86_sse41_pblend_w(<8 x i16> %a0, <8 x i16> %a1) {
; CHECK-LABEL: test_x86_sse41_pblend_w:
; CHECK:       # BB#0:
; CHECK-NEXT:    retq
  %1 = call <8 x i16> @llvm.x86.sse41.pblendw(<8 x i16> %a0, <8 x i16> %a1, i32 0)
  ret <8 x i16> %1
}

define <2 x double> @test2_x86_sse41_blend_pd(<2 x double> %a0, <2 x double> %a1) {
; CHECK-LABEL: test2_x86_sse41_blend_pd:
; CHECK:       # BB#0:
; CHECK-NEXT:    movaps %xmm1, %xmm0
; CHECK-NEXT:    retq
  %1 = call <2 x double> @llvm.x86.sse41.blendpd(<2 x double> %a0, <2 x double> %a1, i32 -1)
  ret <2 x double> %1
}

define <4 x float> @test2_x86_sse41_blend_ps(<4 x float> %a0, <4 x float> %a1) {
; CHECK-LABEL: test2_x86_sse41_blend_ps:
; CHECK:       # BB#0:
; CHECK-NEXT:    movaps %xmm1, %xmm0
; CHECK-NEXT:    retq
  %1 = call <4 x float> @llvm.x86.sse41.blendps(<4 x float> %a0, <4 x float> %a1, i32 -1)
  ret <4 x float> %1
}

define <8 x i16> @test2_x86_sse41_pblend_w(<8 x i16> %a0, <8 x i16> %a1) {
; CHECK-LABEL: test2_x86_sse41_pblend_w:
; CHECK:       # BB#0:
; CHECK-NEXT:    movaps %xmm1, %xmm0
; CHECK-NEXT:    retq
  %1 = call <8 x i16> @llvm.x86.sse41.pblendw(<8 x i16> %a0, <8 x i16> %a1, i32 -1)
  ret <8 x i16> %1
}

define <2 x double> @test3_x86_sse41_blend_pd(<2 x double> %a0) {
; CHECK-LABEL: test3_x86_sse41_blend_pd:
; CHECK:       # BB#0:
; CHECK-NEXT:    retq
  %1 = call <2 x double> @llvm.x86.sse41.blendpd(<2 x double> %a0, <2 x double> %a0, i32 7)
  ret <2 x double> %1
}

define <4 x float> @test3_x86_sse41_blend_ps(<4 x float> %a0) {
; CHECK-LABEL: test3_x86_sse41_blend_ps:
; CHECK:       # BB#0:
; CHECK-NEXT:    retq
  %1 = call <4 x float> @llvm.x86.sse41.blendps(<4 x float> %a0, <4 x float> %a0, i32 7)
  ret <4 x float> %1
}

define <8 x i16> @test3_x86_sse41_pblend_w(<8 x i16> %a0) {
; CHECK-LABEL: test3_x86_sse41_pblend_w:
; CHECK:       # BB#0:
; CHECK-NEXT:    retq
  %1 = call <8 x i16> @llvm.x86.sse41.pblendw(<8 x i16> %a0, <8 x i16> %a0, i32 7)
  ret <8 x i16> %1
}

declare <2 x double> @llvm.x86.sse41.blendpd(<2 x double>, <2 x double>, i32)
declare <4 x float> @llvm.x86.sse41.blendps(<4 x float>, <4 x float>, i32)
declare <8 x i16> @llvm.x86.sse41.pblendw(<8 x i16>, <8 x i16>, i32)

