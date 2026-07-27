; Direct LLVM IR probe for fail-closed P1 cube L1-to-L0 2Dv2 coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.f16(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.f32(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.s16(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.s32(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.u16(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.u32(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.u8(ptr addrspace(3) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)

  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.f16(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.f32(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.s16(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.s32(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.u16(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.u32(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  call void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.u8(ptr addrspace(4) null, ptr addrspace(2) null, i64 0, i64 0, i64 0)
  ret void
}

declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.bf16(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.f16(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.f32(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.s16(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.s32(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.u16(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.u32(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0A.2Dv2.u8(ptr addrspace(3), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.bf16(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.f16(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.f32(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.s16(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.s32(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.u16(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.u32(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)
declare void @llvm.hivm.LOAD.L1.TO.L0B.2Dv2.u8(ptr addrspace(4), ptr addrspace(2), i64, i64, i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
