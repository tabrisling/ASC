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
