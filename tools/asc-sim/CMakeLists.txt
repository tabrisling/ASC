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

add_custom_command(
  OUTPUT "${ASC_SIM_OUTPUT}"
  COMMAND "${CMAKE_COMMAND}" -E copy_if_different
          "${ASC_SIM_SCRIPT}" "${ASC_SIM_OUTPUT}"
  DEPENDS "${ASC_SIM_SCRIPT}"
  COMMENT "Copying asc-sim"
  VERBATIM)

add_custom_target(asc-sim DEPENDS "${ASC_SIM_OUTPUT}")

install(PROGRAMS "${ASC_SIM_SCRIPT}" DESTINATION bin)
