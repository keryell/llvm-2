; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s | FileCheck %s

target triple = "aarch64-unknown-linux-gnu"

;
; CLZ
;

define <vscale x 16 x i8> @ctlz_b(<vscale x 16 x i8> %a) #0 {
; CHECK-LABEL: ctlz_b:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    clz z0.b, p0/m, z0.b
; CHECK-NEXT:    ret

  %res = call <vscale x 16 x i8> @llvm.ctlz.nxv16i8(<vscale x 16 x i8> %a)
  ret <vscale x 16 x i8> %res
}

define <vscale x 8 x i16> @ctlz_h(<vscale x 8 x i16> %a) #0 {
; CHECK-LABEL: ctlz_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    clz z0.h, p0/m, z0.h
; CHECK-NEXT:    ret

  %res = call <vscale x 8 x i16> @llvm.ctlz.nxv8i16(<vscale x 8 x i16> %a)
  ret <vscale x 8 x i16> %res
}

define <vscale x 4 x i32> @ctlz_s(<vscale x 4 x i32> %a) #0 {
; CHECK-LABEL: ctlz_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    clz z0.s, p0/m, z0.s
; CHECK-NEXT:    ret

  %res = call <vscale x 4 x i32> @llvm.ctlz.nxv4i32(<vscale x 4 x i32> %a)
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @ctlz_d(<vscale x 2 x i64> %a) #0 {
; CHECK-LABEL: ctlz_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    clz z0.d, p0/m, z0.d
; CHECK-NEXT:    ret

  %res = call <vscale x 2 x i64> @llvm.ctlz.nxv2i64(<vscale x 2 x i64> %a)
  ret <vscale x 2 x i64> %res
}

;
; CNT
;

define <vscale x 16 x i8> @ctpop_b(<vscale x 16 x i8> %a) #0 {
; CHECK-LABEL: ctpop_b:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    cnt z0.b, p0/m, z0.b
; CHECK-NEXT:    ret

  %res = call <vscale x 16 x i8> @llvm.ctpop.nxv16i8(<vscale x 16 x i8> %a)
  ret <vscale x 16 x i8> %res
}

define <vscale x 8 x i16> @ctpop_h(<vscale x 8 x i16> %a) #0 {
; CHECK-LABEL: ctpop_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    cnt z0.h, p0/m, z0.h
; CHECK-NEXT:    ret

  %res = call <vscale x 8 x i16> @llvm.ctpop.nxv8i16(<vscale x 8 x i16> %a)
  ret <vscale x 8 x i16> %res
}

define <vscale x 4 x i32> @ctpop_s(<vscale x 4 x i32> %a) #0 {
; CHECK-LABEL: ctpop_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    cnt z0.s, p0/m, z0.s
; CHECK-NEXT:    ret

  %res = call <vscale x 4 x i32> @llvm.ctpop.nxv4i32(<vscale x 4 x i32> %a)
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @ctpop_d(<vscale x 2 x i64> %a) #0 {
; CHECK-LABEL: ctpop_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    cnt z0.d, p0/m, z0.d
; CHECK-NEXT:    ret

  %res = call <vscale x 2 x i64> @llvm.ctpop.nxv2i64(<vscale x 2 x i64> %a)
  ret <vscale x 2 x i64> %res
}

;
; Count trailing zeros
;

define <vscale x 16 x i8> @cttz_b(<vscale x 16 x i8> %a) #0 {
; CHECK-LABEL: cttz_b:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    rbit z0.b, p0/m, z0.b
; CHECK-NEXT:    clz z0.b, p0/m, z0.b
; CHECK-NEXT:    ret

  %res = call <vscale x 16 x i8> @llvm.cttz.nxv16i8(<vscale x 16 x i8> %a)
  ret <vscale x 16 x i8> %res
}

define <vscale x 8 x i16> @cttz_h(<vscale x 8 x i16> %a) #0 {
; CHECK-LABEL: cttz_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    rbit z0.h, p0/m, z0.h
; CHECK-NEXT:    clz z0.h, p0/m, z0.h
; CHECK-NEXT:    ret

  %res = call <vscale x 8 x i16> @llvm.cttz.nxv8i16(<vscale x 8 x i16> %a)
  ret <vscale x 8 x i16> %res
}

define <vscale x 4 x i32> @cttz_s(<vscale x 4 x i32> %a) #0 {
; CHECK-LABEL: cttz_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    rbit z0.s, p0/m, z0.s
; CHECK-NEXT:    clz z0.s, p0/m, z0.s
; CHECK-NEXT:    ret

  %res = call <vscale x 4 x i32> @llvm.cttz.nxv4i32(<vscale x 4 x i32> %a)
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @cttz_d(<vscale x 2 x i64> %a) #0 {
; CHECK-LABEL: cttz_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    rbit z0.d, p0/m, z0.d
; CHECK-NEXT:    clz z0.d, p0/m, z0.d
; CHECK-NEXT:    ret

  %res = call <vscale x 2 x i64> @llvm.cttz.nxv2i64(<vscale x 2 x i64> %a)
  ret <vscale x 2 x i64> %res
}

attributes #0 = { "target-features"="+sve" }

declare <vscale x 16 x i8> @llvm.ctlz.nxv16i8(<vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.ctlz.nxv8i16(<vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.ctlz.nxv4i32(<vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.ctlz.nxv2i64(<vscale x 2 x i64>)

declare <vscale x 16 x i8> @llvm.ctpop.nxv16i8(<vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.ctpop.nxv8i16(<vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.ctpop.nxv4i32(<vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.ctpop.nxv2i64(<vscale x 2 x i64>)

declare <vscale x 16 x i8> @llvm.cttz.nxv16i8(<vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.cttz.nxv8i16(<vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.cttz.nxv4i32(<vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.cttz.nxv2i64(<vscale x 2 x i64>)
