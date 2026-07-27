define void @dav_vbitsort_f32(ptr addrspace(1) %scores, ptr addrspace(1) %indices, ptr addrspace(1) %out) {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) null, ptr addrspace(1) %scores, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), ptr addrspace(1) %indices, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.VBS32.V300.f32(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(6) null, ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), i64 72057594037927936)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 8589934592, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

define void @dav_vbitsort_f16(ptr addrspace(1) %scores, ptr addrspace(1) %indices, ptr addrspace(1) %out) {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) null, ptr addrspace(1) %scores, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), ptr addrspace(1) %indices, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.VBS32.V300.f16(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(6) null, ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), i64 72057594037927936)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 8589934592, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.VBS32.V300.f32(ptr addrspace(6), ptr addrspace(6), ptr addrspace(6), i64)
declare void @llvm.hivm.VBS32.V300.f16(ptr addrspace(6), ptr addrspace(6), ptr addrspace(6), i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)
