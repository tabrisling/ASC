define void @dav_vgatherb_b64(ptr addrspace(1) %data, ptr addrspace(1) %offsets, ptr addrspace(1) %out) {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %data, i64 288230377225453824, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %offsets, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i32 0, i32 1, i32 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i32 0, i32 1, i32 0)

  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %idx = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %s64 = call <32 x i64> @llvm.hivm.vgatherb.v310.v32s64(ptr addrspace(6) null, <64 x i32> %idx, <256 x i1> %mask)
  %u64 = call <32 x i64> @llvm.hivm.vgatherb.v310.v32u64(ptr addrspace(6) null, <64 x i32> %idx, <256 x i1> %mask)
  %s64_bits = bitcast <32 x i64> %s64 to <64 x i32>
  %u64_bits = bitcast <32 x i64> %u64 to <64 x i32>
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %s64_bits, ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %u64_bits, ptr addrspace(6) inttoptr (i64 1280 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)

  call void @llvm.hivm.SET.FLAG.IMM(i32 1, i32 2, i32 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i32 1, i32 2, i32 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), i64 288230377225453824, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i32 0)
  ret void
}

declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i32, i32, i32)
declare void @llvm.hivm.WAIT.FLAG.IMM(i32, i32, i32)
declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6), i32, i32, i32)
declare <32 x i64> @llvm.hivm.vgatherb.v310.v32s64(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <32 x i64> @llvm.hivm.vgatherb.v310.v32u64(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare void @llvm.hivm.vstsx1.v64s32(<64 x i32>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i32)
