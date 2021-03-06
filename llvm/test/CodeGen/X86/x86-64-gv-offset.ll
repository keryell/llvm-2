; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-darwin | FileCheck %s

	%struct.x = type { float, double }
@X = global %struct.x { float 1.000000e+00, double 2.000000e+00 }, align 16		; <%struct.x*> [#uses=2]

define i32 @main() nounwind  {
; CHECK-LABEL: main:
; CHECK:       ## %bb.0: ## %entry
; CHECK-NEXT:    pushq %rax
; CHECK-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; CHECK-NEXT:    movsd {{.*#+}} xmm1 = mem[0],zero
; CHECK-NEXT:    callq _t
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    popq %rcx
; CHECK-NEXT:    retq
entry:
	%tmp2 = load float, float* getelementptr (%struct.x, %struct.x* @X, i32 0, i32 0), align 16		; <float> [#uses=1]
	%tmp4 = load double, double* getelementptr (%struct.x, %struct.x* @X, i32 0, i32 1), align 8		; <double> [#uses=1]
	tail call void @t( float %tmp2, double %tmp4 ) nounwind
	ret i32 0
}

declare void @t(float, double)
