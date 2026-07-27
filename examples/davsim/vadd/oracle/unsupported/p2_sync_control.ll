; Direct LLVM IR probe for fail-closed P2 sync/control intrinsic coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  call void @llvm.hivm.SET.LOOP1.STRIDE.OUTTOUB(i64 1)
  call void @llvm.hivm.SET.LOOP2.STRIDE.OUTTOUB(i64 1)
  call void @llvm.hivm.SET.LOOP.SIZE.OUTTOUB(i64 1)

  call void @llvm.hivm.SET.CROSS.CORE(i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.DEV.REG(i64 0)
  call void @llvm.hivm.WAIT.FLAG.DEV.PIPE.IMM(i64 4, i64 0)
  call void @llvm.hivm.WAIT.FLAG.DEV.PIPE.REG(i64 4, i64 0)

  call void @llvm.hivm.mem.bar.vst.vld()
  call void @llvm.hivm.mem.bar.vld.vst()
  call void @llvm.hivm.mem.bar.vst.vst()
  call void @llvm.hivm.mem.bar.vs.all()
  call void @llvm.hivm.mem.bar.vst.ld()
  call void @llvm.hivm.mem.bar.vld.st()
  call void @llvm.hivm.mem.bar.vst.st()
  call void @llvm.hivm.mem.bar.sv.all()
  call void @llvm.hivm.mem.bar.st.vld()
  call void @llvm.hivm.mem.bar.ld.vst()
  call void @llvm.hivm.mem.bar.st.vst()
  call void @llvm.hivm.mem.bar.ss.all()
  call void @llvm.hivm.mem.bar.st.ld()
  call void @llvm.hivm.mem.bar.ld.st()
  call void @llvm.hivm.mem.bar.st.st()

  ret void
}

declare void @llvm.hivm.SET.LOOP1.STRIDE.OUTTOUB(i64)
declare void @llvm.hivm.SET.LOOP2.STRIDE.OUTTOUB(i64)
declare void @llvm.hivm.SET.LOOP.SIZE.OUTTOUB(i64)
declare void @llvm.hivm.SET.CROSS.CORE(i64, i64)
declare void @llvm.hivm.WAIT.FLAG.DEV.REG(i64)
declare void @llvm.hivm.WAIT.FLAG.DEV.PIPE.IMM(i64, i64)
declare void @llvm.hivm.WAIT.FLAG.DEV.PIPE.REG(i64, i64)
declare void @llvm.hivm.mem.bar.vst.vld()
declare void @llvm.hivm.mem.bar.vld.vst()
declare void @llvm.hivm.mem.bar.vst.vst()
declare void @llvm.hivm.mem.bar.vs.all()
declare void @llvm.hivm.mem.bar.vst.ld()
declare void @llvm.hivm.mem.bar.vld.st()
declare void @llvm.hivm.mem.bar.vst.st()
declare void @llvm.hivm.mem.bar.sv.all()
declare void @llvm.hivm.mem.bar.st.vld()
declare void @llvm.hivm.mem.bar.ld.vst()
declare void @llvm.hivm.mem.bar.st.vst()
declare void @llvm.hivm.mem.bar.ss.all()
declare void @llvm.hivm.mem.bar.st.ld()
declare void @llvm.hivm.mem.bar.ld.st()
declare void @llvm.hivm.mem.bar.st.st()

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
