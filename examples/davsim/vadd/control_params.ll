define void @dav_control_params(ptr addrspace(1) %input, ptr addrspace(1) %output) {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6) null, ptr addrspace(1) %input, i64 288230377225453600, i64 35184372088864)
  call void @llvm.hivm.SET.LOOP3.PARA(i64 1)
  call void @llvm.hivm.SET.CHANNEL.PARA(i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %output, ptr addrspace(6) null, i64 288230377225453600, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.LOOP3.PARA(i64)
declare void @llvm.hivm.SET.CHANNEL.PARA(i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)
