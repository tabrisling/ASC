define void @dav_vmrgsort4_f32(ptr addrspace(1) %input, ptr addrspace(1) %output, ptr addrspace(1) %counts) {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6) null, ptr addrspace(1) %input, i64 288230377225453600, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.VMRGSORT.f32.V300(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 844433520132096 to ptr addrspace(6)), i64 281479271743489, i64 7937)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 0, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 0, i64 0)
  %raw_counts = call i64 @llvm.hivm.GET.VMS4.SR()
  store i64 %raw_counts, ptr addrspace(1) %counts, align 4
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %output, ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), i64 288230377225453600, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

define void @dav_vmrgsort4_f16(ptr addrspace(1) %input, ptr addrspace(1) %output, ptr addrspace(1) %counts) {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %input, i64 288230377225453600, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.VMRGSORT.f16.V300(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), ptr addrspace(6) inttoptr (i64 844433520132096 to ptr addrspace(6)), i64 281479271743489, i64 7937)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 0, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 0, i64 0)
  %raw_counts = call i64 @llvm.hivm.GET.VMS4.SR()
  store i64 %raw_counts, ptr addrspace(1) %counts, align 4
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %output, ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), i64 288230377225453600, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.VMRGSORT.f32.V300(ptr addrspace(6), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.VMRGSORT.f16.V300(ptr addrspace(6), ptr addrspace(6), i64, i64)
declare i64 @llvm.hivm.GET.VMS4.SR()
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)
