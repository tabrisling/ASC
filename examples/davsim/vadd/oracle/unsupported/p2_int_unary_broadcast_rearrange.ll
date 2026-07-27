; Direct LLVM IR probe for fail-closed P2 integer unary/broadcast/rearrange coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %mask8 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)

  %abs_i32 = call <64 x i32> @llvm.hivm.vabs.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %abs_i16 = call <128 x i16> @llvm.hivm.vabs.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %abs_i8 = call <256 x i8> @llvm.hivm.vabs.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %neg_i32 = call <64 x i32> @llvm.hivm.vneg.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %neg_i16 = call <128 x i16> @llvm.hivm.vneg.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %neg_i8 = call <256 x i8> @llvm.hivm.vneg.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %not_i32 = call <64 x i32> @llvm.hivm.vnot.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %not_i16 = call <128 x i16> @llvm.hivm.vnot.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %not_u16 = call <128 x i16> @llvm.hivm.vnot.x.v128u16(<128 x i16> undef, <256 x i1> %mask16)
  %not_i8 = call <256 x i8> @llvm.hivm.vnot.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %absdif_s = call <64 x i32> @llvm.hivm.vabsdif.s.x(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask32)
  %absdif_u = call <64 x i32> @llvm.hivm.vabsdif.u.x(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask32)

  %br_i32 = call <64 x i32> @llvm.hivm.vbr.v64s32(i32 0)
  %br_i16 = call <128 x i16> @llvm.hivm.vbr.v128s16(i16 0)
  %br_i8 = call <256 x i8> @llvm.hivm.vbr.v256s8(i8 0)

  %pack_i32 = call <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %pack_i16 = call <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare <64 x i32> @llvm.hivm.vabs.x.v64i32(<64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vabs.x.v128i16(<128 x i16>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vabs.x.v256i8(<256 x i8>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vneg.x.v64i32(<64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vneg.x.v128i16(<128 x i16>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vneg.x.v256i8(<256 x i8>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vnot.x.v64i32(<64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vnot.x.v128i16(<128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vnot.x.v128u16(<128 x i16>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vnot.x.v256i8(<256 x i8>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vabsdif.s.x(<64 x i32>, <64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vabsdif.u.x(<64 x i32>, <64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vbr.v64s32(i32)
declare <128 x i16> @llvm.hivm.vbr.v128s16(i16)
declare <256 x i8> @llvm.hivm.vbr.v256s8(i8)
declare <128 x i16> @llvm.hivm.vpack.x.v64i32(<64 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vpack.x.v128i16(<128 x i16>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
