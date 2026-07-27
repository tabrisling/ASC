; Minimal dav vadd LLVM IR smoke test for tools/asc-sim.
; The intrinsic names match OpenTileAS include/Target/Npu/IntrinsicsNPU.td.

define void @dav_vadd(ptr addrspace(6) %a,
                      ptr addrspace(6) %b,
                      ptr addrspace(6) %out) {
entry:
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %va = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %a, i32 0, i32 0, i32 0)
  %vb = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) %b, i32 0, i32 0, i32 0)
  %sum = call <64 x float> @llvm.hivm.vadd.v64f32.x(<64 x float> %va, <64 x float> %vb, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %sum, ptr addrspace(6) %out, i32 0, i32 0, i32 0, <256 x i1> %mask)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6), i32, i32, i32)
declare <64 x float> @llvm.hivm.vadd.v64f32.x(<64 x float>, <64 x float>, <256 x i1>)
declare void @llvm.hivm.vstsx1.v64f32(<64 x float>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
