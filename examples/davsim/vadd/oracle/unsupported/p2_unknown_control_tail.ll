; Direct LLVM IR probe for fail-closed P2 tail unknown intrinsic coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %mask8 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)

  %block_num = call i64 @llvm.hivm.GET.BLOCK.NUM()
  %subblock_id = call i64 @llvm.hivm.GET.SUBBLOCKID()
  %subblock_dim = call i64 @llvm.hivm.GET.SUBBLOCKDIM()

  call void @llvm.hivm.SET.FFTS.BASE.ADDR(i64 %block_num)
  call void @llvm.hivm.SET.MTE2.NZ.PARA(i64 274877972481)
  call void @llvm.hivm.SET.FMATRIX(i64 %subblock_id)
  call void @llvm.hivm.SET.FMATRIX.B(i64 %subblock_dim)
  call void @llvm.hivm.SET.L3D.RPT(i64 0)
  call void @llvm.hivm.SET.L3D.RPT.B(i64 0)
  call void @llvm.hivm.SET.PADDING(i64 0)
  call void @llvm.hivm.SET.PADDING.B(i64 0)
  call void @llvm.hivm.SET.FPC(i64 0)
  call void @llvm.hivm.SET.ATOMIC.f16(i64 0)
  call void @llvm.hivm.SET.ATOMIC.f32(i64 0)
  call void @llvm.hivm.SET.ATOMIC.s16(i64 0)

  call void @llvm.hivm.MAD.f322f32.c310(ptr addrspace(5) null, ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529025493336000)
  call void @llvm.hivm.MAD.f162f32.c310(ptr addrspace(5) null, ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529025493336000)
  call void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5) null, ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529025493336000)
  call void @llvm.hivm.MAD.e4m3e4m3.c310(ptr addrspace(5) null, ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529025493336000)
  call void @llvm.hivm.MAD.e4m3e5m2.c310(ptr addrspace(5) null, ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529025493336000)
  call void @llvm.hivm.MAD.e5m2e4m3.c310(ptr addrspace(5) null, ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529025493336000)
  call void @llvm.hivm.MAD.e5m2e5m2.c310(ptr addrspace(5) null, ptr addrspace(3) null, ptr addrspace(4) null, i64 -6917529025493336000)

  %pge32 = call <256 x i1> @llvm.hivm.pge.b32(i32 0, i32 0)
  %pge16 = call <256 x i1> @llvm.hivm.pge.b16(i32 0, i32 0)
  %pge8 = call <256 x i1> @llvm.hivm.pge.b8(i32 0, i32 0)
  %pltm32 = call <256 x i1> @llvm.hivm.pltm.b32.v300(i16 0, i32 64)
  %pltm16 = call <256 x i1> @llvm.hivm.pltm.b16.v300(i16 0, i32 128)
  %pltm8 = call <256 x i1> @llvm.hivm.pltm.b8.v300(i16 0, i32 256)
  %pand = call <256 x i1> @llvm.hivm.pand.z(<256 x i1> %pge32, <256 x i1> %pltm32, <256 x i1> %mask32)
  %por = call <256 x i1> @llvm.hivm.por.z(<256 x i1> %pge16, <256 x i1> %pltm16, <256 x i1> %mask16)
  %pxor = call <256 x i1> @llvm.hivm.pxor.z(<256 x i1> %pge8, <256 x i1> %pltm8, <256 x i1> %mask8)
  %pnot = call <256 x i1> @llvm.hivm.pnot.z(<256 x i1> %pand, <256 x i1> %por)

  %vslide_i32 = call <64 x i32> @llvm.hivm.vslide.v64i32(<64 x i32> undef, <64 x i32> undef, i16 4)
  %vslide_i16 = call <128 x i16> @llvm.hivm.vslide.v128i16(<128 x i16> undef, <128 x i16> undef, i16 4)
  %vslide_i8 = call <256 x i8> @llvm.hivm.vslide.v256i8(<256 x i8> undef, <256 x i8> undef, i16 4)

  %dhist = call <128 x i16> @llvm.hivm.dhistv2.m(<128 x i16> undef, <256 x i8> undef, <256 x i1> %pnot, i32 0)
  %chist = call <128 x i16> @llvm.hivm.chistv2.m(<128 x i16> %dhist, <256 x i8> %vslide_i8, <256 x i1> %mask8, i32 0)

  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare i64 @llvm.hivm.GET.BLOCK.NUM()
declare i64 @llvm.hivm.GET.SUBBLOCKID()
declare i64 @llvm.hivm.GET.SUBBLOCKDIM()
declare void @llvm.hivm.SET.FFTS.BASE.ADDR(i64)
declare void @llvm.hivm.SET.MTE2.NZ.PARA(i64)
declare void @llvm.hivm.SET.FMATRIX(i64)
declare void @llvm.hivm.SET.FMATRIX.B(i64)
declare void @llvm.hivm.SET.L3D.RPT(i64)
declare void @llvm.hivm.SET.L3D.RPT.B(i64)
declare void @llvm.hivm.SET.PADDING(i64)
declare void @llvm.hivm.SET.PADDING.B(i64)
declare void @llvm.hivm.SET.FPC(i64)
declare void @llvm.hivm.SET.ATOMIC.f16(i64)
declare void @llvm.hivm.SET.ATOMIC.f32(i64)
declare void @llvm.hivm.SET.ATOMIC.s16(i64)
declare void @llvm.hivm.MAD.f322f32.c310(ptr addrspace(5), ptr addrspace(3), ptr addrspace(4), i64)
declare void @llvm.hivm.MAD.f162f32.c310(ptr addrspace(5), ptr addrspace(3), ptr addrspace(4), i64)
declare void @llvm.hivm.MAD.bf162f32.c310(ptr addrspace(5), ptr addrspace(3), ptr addrspace(4), i64)
declare void @llvm.hivm.MAD.e4m3e4m3.c310(ptr addrspace(5), ptr addrspace(3), ptr addrspace(4), i64)
declare void @llvm.hivm.MAD.e4m3e5m2.c310(ptr addrspace(5), ptr addrspace(3), ptr addrspace(4), i64)
declare void @llvm.hivm.MAD.e5m2e4m3.c310(ptr addrspace(5), ptr addrspace(3), ptr addrspace(4), i64)
declare void @llvm.hivm.MAD.e5m2e5m2.c310(ptr addrspace(5), ptr addrspace(3), ptr addrspace(4), i64)
declare <256 x i1> @llvm.hivm.pge.b32(i32, i32)
declare <256 x i1> @llvm.hivm.pge.b16(i32, i32)
declare <256 x i1> @llvm.hivm.pge.b8(i32, i32)
declare <256 x i1> @llvm.hivm.pltm.b32.v300(i16, i32)
declare <256 x i1> @llvm.hivm.pltm.b16.v300(i16, i32)
declare <256 x i1> @llvm.hivm.pltm.b8.v300(i16, i32)
declare <256 x i1> @llvm.hivm.pand.z(<256 x i1>, <256 x i1>, <256 x i1>)
declare <256 x i1> @llvm.hivm.por.z(<256 x i1>, <256 x i1>, <256 x i1>)
declare <256 x i1> @llvm.hivm.pxor.z(<256 x i1>, <256 x i1>, <256 x i1>)
declare <256 x i1> @llvm.hivm.pnot.z(<256 x i1>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vslide.v64i32(<64 x i32>, <64 x i32>, i16)
declare <128 x i16> @llvm.hivm.vslide.v128i16(<128 x i16>, <128 x i16>, i16)
declare <256 x i8> @llvm.hivm.vslide.v256i8(<256 x i8>, <256 x i8>, i16)
declare <128 x i16> @llvm.hivm.dhistv2.m(<128 x i16>, <256 x i8>, <256 x i1>, i32)
declare <128 x i16> @llvm.hivm.chistv2.m(<128 x i16>, <256 x i8>, <256 x i1>, i32)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
