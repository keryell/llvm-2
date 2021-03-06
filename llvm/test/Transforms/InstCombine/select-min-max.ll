; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

declare i5 @llvm.smin.i5(i5, i5)
declare <2 x i8> @llvm.smax.v2i8(<2 x i8>, <2 x i8>)
declare i5 @llvm.umin.i5(i5, i5)
declare <3 x i5> @llvm.umax.v3i5(<3 x i5>, <3 x i5>)

define i5 @smin_smin_common_op_00(i1 %cond, i5 %x, i5 %y, i5 %z) {
; CHECK-LABEL: @smin_smin_common_op_00(
; CHECK-NEXT:    [[MINMAXOP:%.*]] = select i1 [[COND:%.*]], i5 [[X:%.*]], i5 [[Y:%.*]]
; CHECK-NEXT:    [[SEL:%.*]] = call i5 @llvm.smin.i5(i5 [[MINMAXOP]], i5 [[Z:%.*]])
; CHECK-NEXT:    ret i5 [[SEL]]
;
  %m1 = call i5 @llvm.smin.i5(i5 %z, i5 %x)
  %m2 = call i5 @llvm.smin.i5(i5 %z, i5 %y)
  %sel = select i1 %cond, i5 %m1, i5 %m2
  ret i5 %sel
}

define <2 x i8> @smax_smax_common_op_01(<2 x i1> %cond, <2 x i8> %x, <2 x i8> %y, <2 x i8> %z) {
; CHECK-LABEL: @smax_smax_common_op_01(
; CHECK-NEXT:    [[MINMAXOP:%.*]] = select <2 x i1> [[COND:%.*]], <2 x i8> [[X:%.*]], <2 x i8> [[Y:%.*]]
; CHECK-NEXT:    [[SEL:%.*]] = call <2 x i8> @llvm.smax.v2i8(<2 x i8> [[MINMAXOP]], <2 x i8> [[Z:%.*]])
; CHECK-NEXT:    ret <2 x i8> [[SEL]]
;
  %m1 = call <2 x i8> @llvm.smax.v2i8(<2 x i8> %z, <2 x i8> %x)
  %m2 = call <2 x i8> @llvm.smax.v2i8(<2 x i8> %y, <2 x i8> %z)
  %sel = select <2 x i1> %cond, <2 x i8> %m1, <2 x i8> %m2
  ret <2 x i8> %sel
}

define i5 @umin_umin_common_op_10(i1 %cond, i5 %x, i5 %y, i5 %z, i5* %p) {
; CHECK-LABEL: @umin_umin_common_op_10(
; CHECK-NEXT:    [[M1:%.*]] = call i5 @llvm.umin.i5(i5 [[X:%.*]], i5 [[Z:%.*]])
; CHECK-NEXT:    store i5 [[M1]], i5* [[P:%.*]], align 1
; CHECK-NEXT:    [[MINMAXOP:%.*]] = select i1 [[COND:%.*]], i5 [[X]], i5 [[Y:%.*]]
; CHECK-NEXT:    [[SEL:%.*]] = call i5 @llvm.umin.i5(i5 [[MINMAXOP]], i5 [[Z]])
; CHECK-NEXT:    ret i5 [[SEL]]
;
  %m1 = call i5 @llvm.umin.i5(i5 %x, i5 %z)
  store i5 %m1, i5* %p
  %m2 = call i5 @llvm.umin.i5(i5 %z, i5 %y)
  %sel = select i1 %cond, i5 %m1, i5 %m2
  ret i5 %sel
}

define <3 x i5> @umax_umax_common_op_11(i1 %cond, <3 x i5> %x, <3 x i5> %y, <3 x i5> %z, <3 x i5>* %p) {
; CHECK-LABEL: @umax_umax_common_op_11(
; CHECK-NEXT:    [[M2:%.*]] = call <3 x i5> @llvm.umax.v3i5(<3 x i5> [[Y:%.*]], <3 x i5> [[Z:%.*]])
; CHECK-NEXT:    store <3 x i5> [[M2]], <3 x i5>* [[P:%.*]], align 4
; CHECK-NEXT:    [[MINMAXOP:%.*]] = select i1 [[COND:%.*]], <3 x i5> [[X:%.*]], <3 x i5> [[Y]]
; CHECK-NEXT:    [[SEL:%.*]] = call <3 x i5> @llvm.umax.v3i5(<3 x i5> [[MINMAXOP]], <3 x i5> [[Z]])
; CHECK-NEXT:    ret <3 x i5> [[SEL]]
;
  %m1 = call <3 x i5> @llvm.umax.v3i5(<3 x i5> %x, <3 x i5> %z)
  %m2 = call <3 x i5> @llvm.umax.v3i5(<3 x i5> %y, <3 x i5> %z)
  store <3 x i5> %m2, <3 x i5>* %p
  %sel = select i1 %cond, <3 x i5> %m1, <3 x i5> %m2
  ret <3 x i5> %sel
}

; negative test - intrinsic mismatch

define i5 @smin_umin_common_op_11(i1 %cond, i5 %x, i5 %y, i5 %z) {
; CHECK-LABEL: @smin_umin_common_op_11(
; CHECK-NEXT:    [[M1:%.*]] = call i5 @llvm.smin.i5(i5 [[X:%.*]], i5 [[Z:%.*]])
; CHECK-NEXT:    [[M2:%.*]] = call i5 @llvm.umin.i5(i5 [[Y:%.*]], i5 [[Z]])
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i5 [[M1]], i5 [[M2]]
; CHECK-NEXT:    ret i5 [[SEL]]
;
  %m1 = call i5 @llvm.smin.i5(i5 %x, i5 %z)
  %m2 = call i5 @llvm.umin.i5(i5 %y, i5 %z)
  %sel = select i1 %cond, i5 %m1, i5 %m2
  ret i5 %sel
}

; negative test - require shared operand

define i5 @smin_smin_no_common_op(i1 %cond, i5 %x, i5 %y, i5 %z, i5 %w) {
; CHECK-LABEL: @smin_smin_no_common_op(
; CHECK-NEXT:    [[M1:%.*]] = call i5 @llvm.smin.i5(i5 [[Z:%.*]], i5 [[X:%.*]])
; CHECK-NEXT:    [[M2:%.*]] = call i5 @llvm.smin.i5(i5 [[W:%.*]], i5 [[Y:%.*]])
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i5 [[M1]], i5 [[M2]]
; CHECK-NEXT:    ret i5 [[SEL]]
;
  %m1 = call i5 @llvm.smin.i5(i5 %z, i5 %x)
  %m2 = call i5 @llvm.smin.i5(i5 %w, i5 %y)
  %sel = select i1 %cond, i5 %m1, i5 %m2
  ret i5 %sel
}

; negative test - too many uses

define i5 @umin_umin_common_op_10_uses(i1 %cond, i5 %x, i5 %y, i5 %z, i5* %p1, i5* %p2) {
; CHECK-LABEL: @umin_umin_common_op_10_uses(
; CHECK-NEXT:    [[M1:%.*]] = call i5 @llvm.umin.i5(i5 [[X:%.*]], i5 [[Z:%.*]])
; CHECK-NEXT:    store i5 [[M1]], i5* [[P1:%.*]], align 1
; CHECK-NEXT:    [[M2:%.*]] = call i5 @llvm.umin.i5(i5 [[Z]], i5 [[Y:%.*]])
; CHECK-NEXT:    store i5 [[M2]], i5* [[P2:%.*]], align 1
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i5 [[M1]], i5 [[M2]]
; CHECK-NEXT:    ret i5 [[SEL]]
;
  %m1 = call i5 @llvm.umin.i5(i5 %x, i5 %z)
  store i5 %m1, i5* %p1
  %m2 = call i5 @llvm.umin.i5(i5 %z, i5 %y)
  store i5 %m2, i5* %p2
  %sel = select i1 %cond, i5 %m1, i5 %m2
  ret i5 %sel
}
