; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+sse2 | FileCheck %s --check-prefix=X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+sse2 | FileCheck %s --check-prefix=X64

; PR11580
define <3 x float> @addf3(<3 x float> %x) {
; X86-LABEL: addf3:
; X86:       # BB#0: # %entry
; X86-NEXT:    addps {{\.LCPI.*}}, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: addf3:
; X64:       # BB#0: # %entry
; X64-NEXT:    addps {{.*}}(%rip), %xmm0
; X64-NEXT:    retq
entry:
  %add = fadd <3 x float> %x, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>
  ret <3 x float> %add
}

; PR11580
define <4 x float> @cvtf3_f4(<3 x float> %x) {
; X86-LABEL: cvtf3_f4:
; X86:       # BB#0: # %entry
; X86-NEXT:    retl
;
; X64-LABEL: cvtf3_f4:
; X64:       # BB#0: # %entry
; X64-NEXT:    retq
entry:
  %extractVec = shufflevector <3 x float> %x, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 undef>
  ret <4 x float> %extractVec
}

; PR11580
define <3 x float> @cvtf4_f3(<4 x float> %x) {
; X86-LABEL: cvtf4_f3:
; X86:       # BB#0: # %entry
; X86-NEXT:    retl
;
; X64-LABEL: cvtf4_f3:
; X64:       # BB#0: # %entry
; X64-NEXT:    retq
entry:
  %extractVec = shufflevector <4 x float> %x, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  ret <3 x float> %extractVec
}
