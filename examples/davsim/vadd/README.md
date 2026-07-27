# ASC dav-sim vadd smoke test

This directory contains the first local dav intrinsic simulation milestone.
It exercises a single GM-entry `vector<64xf32>` add with explicit UB staging:

```text
GM a,b -> MOV.OUT.TO.UB -> vldsx1 -> vadd -> vstsx1
       -> MOV.UB.TO.OUT -> GM out
```

Run it from the repository root:

```bash
build/bin/asc-sim examples/davsim/vadd/vadd.ll \
  --case examples/davsim/vadd/vadd.case.json \
  --trace
```

The model is intentionally functional. It checks the hardware constraints that
matter for the first step, including GM/UB address space separation, 32-byte
alignment, DMA region bounds, and buffer overflow, but it does not model cycle
timing or pipeline scheduling.

Run the oracle suite to exercise local negative cases and an OpenTileAS
vector_add kernel after real dav-351x lowering. The suite also reuses the same
GM/UB/register data path to check the first batch of f32 vector compute ops:
`vadd`, `vsub`, `vmul`, `vdiv`, `vmax`, and `vmin`.

```bash
build/bin/asc-sim-oracle
```

Add `--run-simulator --ssh opentile-simu` to also upload the canonical
OpenTileAS vector_add case to the remote simulator oracle.
