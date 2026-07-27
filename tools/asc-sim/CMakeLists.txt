#===------------------------------------------------------------------------===#
#
#                     The KLEE Symbolic Virtual Machine
#
# This file is distributed under the University of Illinois Open Source
# License. See LICENSE.TXT for details.
#
#===------------------------------------------------------------------------===#

set(ASC_SIM_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/asc-sim")
set(ASC_SIM_OUTPUT "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/asc-sim")
set(ASC_SIM_ORACLE_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/asc-sim-oracle")
set(ASC_SIM_ORACLE_OUTPUT "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/asc-sim-oracle")
set(ASC_INTRINSIC_COVERAGE_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/asc-intrinsic-coverage")
set(ASC_INTRINSIC_COVERAGE_OUTPUT "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/asc-intrinsic-coverage")

add_custom_command(
  OUTPUT "${ASC_SIM_OUTPUT}"
  COMMAND "${CMAKE_COMMAND}" -E copy_if_different
          "${ASC_SIM_SCRIPT}" "${ASC_SIM_OUTPUT}"
  DEPENDS "${ASC_SIM_SCRIPT}"
  COMMENT "Copying asc-sim"
  VERBATIM)

add_custom_command(
  OUTPUT "${ASC_SIM_ORACLE_OUTPUT}"
  COMMAND "${CMAKE_COMMAND}" -E copy_if_different
          "${ASC_SIM_ORACLE_SCRIPT}" "${ASC_SIM_ORACLE_OUTPUT}"
  DEPENDS "${ASC_SIM_ORACLE_SCRIPT}"
  COMMENT "Copying asc-sim-oracle"
  VERBATIM)

add_custom_command(
  OUTPUT "${ASC_INTRINSIC_COVERAGE_OUTPUT}"
  COMMAND "${CMAKE_COMMAND}" -E copy_if_different
          "${ASC_INTRINSIC_COVERAGE_SCRIPT}" "${ASC_INTRINSIC_COVERAGE_OUTPUT}"
  DEPENDS "${ASC_INTRINSIC_COVERAGE_SCRIPT}"
  COMMENT "Copying asc-intrinsic-coverage"
  VERBATIM)

add_custom_target(
  asc-sim
  DEPENDS
    "${ASC_SIM_OUTPUT}"
    "${ASC_SIM_ORACLE_OUTPUT}"
    "${ASC_INTRINSIC_COVERAGE_OUTPUT}")

install(
  PROGRAMS
    "${ASC_SIM_SCRIPT}"
    "${ASC_SIM_ORACLE_SCRIPT}"
    "${ASC_INTRINSIC_COVERAGE_SCRIPT}"
  DESTINATION bin)
