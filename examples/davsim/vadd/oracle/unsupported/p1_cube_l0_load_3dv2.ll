; Direct LLVM IR probe for fail-closed P1 cube L1-to-L0 3Dv2 coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  call void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.bf16.C310.NO.DUAL.cfg(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.f16.C310.NO.DUAL.cfg(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.f32.C310.NO.DUAL.cfg(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.s16.C310.NO.DUAL.cfg(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.s32.C310.NO.DUAL.cfg(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.s8.C310.NO.DUAL.cfg(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.u16.C310.NO.DUAL.cfg(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.u32.C310.NO.DUAL.cfg(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.u8.C310.NO.DUAL.cfg(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)

  call void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.bf16.cfg(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.f16.cfg(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.f32.cfg(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.s16.cfg(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.s32.cfg(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.s8.cfg(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.u16.cfg(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.u32.cfg(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.u8.cfg(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0)
  ret void
}

declare void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.bf16.C310.NO.DUAL.cfg(ptr addrspace(3), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.f16.C310.NO.DUAL.cfg(ptr addrspace(3), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.f32.C310.NO.DUAL.cfg(ptr addrspace(3), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.s16.C310.NO.DUAL.cfg(ptr addrspace(3), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.s32.C310.NO.DUAL.cfg(ptr addrspace(3), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.s8.C310.NO.DUAL.cfg(ptr addrspace(3), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.u16.C310.NO.DUAL.cfg(ptr addrspace(3), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.u32.C310.NO.DUAL.cfg(ptr addrspace(3), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.3DV2.c310.u8.C310.NO.DUAL.cfg(ptr addrspace(3), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.bf16.cfg(ptr addrspace(4), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.f16.cfg(ptr addrspace(4), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.f32.cfg(ptr addrspace(4), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.s16.cfg(ptr addrspace(4), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.s32.cfg(ptr addrspace(4), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.s8.cfg(ptr addrspace(4), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.u16.cfg(ptr addrspace(4), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.u32.cfg(ptr addrspace(4), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.3DV2.l300.u8.cfg(ptr addrspace(4), ptr addrspace(2), i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
