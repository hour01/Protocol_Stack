# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "C:/Program Files/CMake/bin/cmake.exe"

# The command to remove a file.
RM = "C:/Program Files/CMake/bin/cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "D:/Third_Spring/computer network/lab/net-lab"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "D:/Third_Spring/computer network/lab/net-lab/build"

# Include any dependencies generated for this target.
include CMakeFiles/ip_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/ip_test.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/ip_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ip_test.dir/flags.make

CMakeFiles/ip_test.dir/testing/ip_test.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/testing/ip_test.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/testing/ip_test.c.obj: ../testing/ip_test.c
CMakeFiles/ip_test.dir/testing/ip_test.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ip_test.dir/testing/ip_test.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/testing/ip_test.c.obj -MF CMakeFiles/ip_test.dir/testing/ip_test.c.obj.d -o CMakeFiles/ip_test.dir/testing/ip_test.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/testing/ip_test.c"

CMakeFiles/ip_test.dir/testing/ip_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/testing/ip_test.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/testing/ip_test.c" > CMakeFiles/ip_test.dir/testing/ip_test.c.i

CMakeFiles/ip_test.dir/testing/ip_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/testing/ip_test.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/testing/ip_test.c" -o CMakeFiles/ip_test.dir/testing/ip_test.c.s

CMakeFiles/ip_test.dir/src/ethernet.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/src/ethernet.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/src/ethernet.c.obj: ../src/ethernet.c
CMakeFiles/ip_test.dir/src/ethernet.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/ip_test.dir/src/ethernet.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/src/ethernet.c.obj -MF CMakeFiles/ip_test.dir/src/ethernet.c.obj.d -o CMakeFiles/ip_test.dir/src/ethernet.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/src/ethernet.c"

CMakeFiles/ip_test.dir/src/ethernet.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/src/ethernet.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/src/ethernet.c" > CMakeFiles/ip_test.dir/src/ethernet.c.i

CMakeFiles/ip_test.dir/src/ethernet.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/src/ethernet.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/src/ethernet.c" -o CMakeFiles/ip_test.dir/src/ethernet.c.s

CMakeFiles/ip_test.dir/src/arp.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/src/arp.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/src/arp.c.obj: ../src/arp.c
CMakeFiles/ip_test.dir/src/arp.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/ip_test.dir/src/arp.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/src/arp.c.obj -MF CMakeFiles/ip_test.dir/src/arp.c.obj.d -o CMakeFiles/ip_test.dir/src/arp.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/src/arp.c"

CMakeFiles/ip_test.dir/src/arp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/src/arp.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/src/arp.c" > CMakeFiles/ip_test.dir/src/arp.c.i

CMakeFiles/ip_test.dir/src/arp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/src/arp.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/src/arp.c" -o CMakeFiles/ip_test.dir/src/arp.c.s

CMakeFiles/ip_test.dir/src/ip.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/src/ip.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/src/ip.c.obj: ../src/ip.c
CMakeFiles/ip_test.dir/src/ip.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/ip_test.dir/src/ip.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/src/ip.c.obj -MF CMakeFiles/ip_test.dir/src/ip.c.obj.d -o CMakeFiles/ip_test.dir/src/ip.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/src/ip.c"

CMakeFiles/ip_test.dir/src/ip.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/src/ip.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/src/ip.c" > CMakeFiles/ip_test.dir/src/ip.c.i

CMakeFiles/ip_test.dir/src/ip.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/src/ip.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/src/ip.c" -o CMakeFiles/ip_test.dir/src/ip.c.s

CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj: ../testing/faker/icmp.c
CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj -MF CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj.d -o CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/testing/faker/icmp.c"

CMakeFiles/ip_test.dir/testing/faker/icmp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/testing/faker/icmp.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/testing/faker/icmp.c" > CMakeFiles/ip_test.dir/testing/faker/icmp.c.i

CMakeFiles/ip_test.dir/testing/faker/icmp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/testing/faker/icmp.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/testing/faker/icmp.c" -o CMakeFiles/ip_test.dir/testing/faker/icmp.c.s

CMakeFiles/ip_test.dir/testing/faker/udp.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/testing/faker/udp.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/testing/faker/udp.c.obj: ../testing/faker/udp.c
CMakeFiles/ip_test.dir/testing/faker/udp.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/ip_test.dir/testing/faker/udp.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/testing/faker/udp.c.obj -MF CMakeFiles/ip_test.dir/testing/faker/udp.c.obj.d -o CMakeFiles/ip_test.dir/testing/faker/udp.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/testing/faker/udp.c"

CMakeFiles/ip_test.dir/testing/faker/udp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/testing/faker/udp.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/testing/faker/udp.c" > CMakeFiles/ip_test.dir/testing/faker/udp.c.i

CMakeFiles/ip_test.dir/testing/faker/udp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/testing/faker/udp.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/testing/faker/udp.c" -o CMakeFiles/ip_test.dir/testing/faker/udp.c.s

CMakeFiles/ip_test.dir/testing/faker/driver.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/testing/faker/driver.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/testing/faker/driver.c.obj: ../testing/faker/driver.c
CMakeFiles/ip_test.dir/testing/faker/driver.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/ip_test.dir/testing/faker/driver.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/testing/faker/driver.c.obj -MF CMakeFiles/ip_test.dir/testing/faker/driver.c.obj.d -o CMakeFiles/ip_test.dir/testing/faker/driver.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/testing/faker/driver.c"

CMakeFiles/ip_test.dir/testing/faker/driver.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/testing/faker/driver.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/testing/faker/driver.c" > CMakeFiles/ip_test.dir/testing/faker/driver.c.i

CMakeFiles/ip_test.dir/testing/faker/driver.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/testing/faker/driver.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/testing/faker/driver.c" -o CMakeFiles/ip_test.dir/testing/faker/driver.c.s

CMakeFiles/ip_test.dir/testing/global.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/testing/global.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/testing/global.c.obj: ../testing/global.c
CMakeFiles/ip_test.dir/testing/global.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/ip_test.dir/testing/global.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/testing/global.c.obj -MF CMakeFiles/ip_test.dir/testing/global.c.obj.d -o CMakeFiles/ip_test.dir/testing/global.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/testing/global.c"

CMakeFiles/ip_test.dir/testing/global.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/testing/global.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/testing/global.c" > CMakeFiles/ip_test.dir/testing/global.c.i

CMakeFiles/ip_test.dir/testing/global.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/testing/global.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/testing/global.c" -o CMakeFiles/ip_test.dir/testing/global.c.s

CMakeFiles/ip_test.dir/src/net.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/src/net.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/src/net.c.obj: ../src/net.c
CMakeFiles/ip_test.dir/src/net.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/ip_test.dir/src/net.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/src/net.c.obj -MF CMakeFiles/ip_test.dir/src/net.c.obj.d -o CMakeFiles/ip_test.dir/src/net.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/src/net.c"

CMakeFiles/ip_test.dir/src/net.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/src/net.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/src/net.c" > CMakeFiles/ip_test.dir/src/net.c.i

CMakeFiles/ip_test.dir/src/net.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/src/net.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/src/net.c" -o CMakeFiles/ip_test.dir/src/net.c.s

CMakeFiles/ip_test.dir/src/buf.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/src/buf.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/src/buf.c.obj: ../src/buf.c
CMakeFiles/ip_test.dir/src/buf.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/ip_test.dir/src/buf.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/src/buf.c.obj -MF CMakeFiles/ip_test.dir/src/buf.c.obj.d -o CMakeFiles/ip_test.dir/src/buf.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/src/buf.c"

CMakeFiles/ip_test.dir/src/buf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/src/buf.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/src/buf.c" > CMakeFiles/ip_test.dir/src/buf.c.i

CMakeFiles/ip_test.dir/src/buf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/src/buf.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/src/buf.c" -o CMakeFiles/ip_test.dir/src/buf.c.s

CMakeFiles/ip_test.dir/src/map.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/src/map.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/src/map.c.obj: ../src/map.c
CMakeFiles/ip_test.dir/src/map.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/ip_test.dir/src/map.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/src/map.c.obj -MF CMakeFiles/ip_test.dir/src/map.c.obj.d -o CMakeFiles/ip_test.dir/src/map.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/src/map.c"

CMakeFiles/ip_test.dir/src/map.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/src/map.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/src/map.c" > CMakeFiles/ip_test.dir/src/map.c.i

CMakeFiles/ip_test.dir/src/map.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/src/map.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/src/map.c" -o CMakeFiles/ip_test.dir/src/map.c.s

CMakeFiles/ip_test.dir/src/utils.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/src/utils.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/src/utils.c.obj: ../src/utils.c
CMakeFiles/ip_test.dir/src/utils.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/ip_test.dir/src/utils.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/src/utils.c.obj -MF CMakeFiles/ip_test.dir/src/utils.c.obj.d -o CMakeFiles/ip_test.dir/src/utils.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/src/utils.c"

CMakeFiles/ip_test.dir/src/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/src/utils.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/src/utils.c" > CMakeFiles/ip_test.dir/src/utils.c.i

CMakeFiles/ip_test.dir/src/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/src/utils.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/src/utils.c" -o CMakeFiles/ip_test.dir/src/utils.c.s

CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj: CMakeFiles/ip_test.dir/flags.make
CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj: CMakeFiles/ip_test.dir/includes_C.rsp
CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj: ../testing/faker/tcp.c
CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj: CMakeFiles/ip_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj -MF CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj.d -o CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj -c "D:/Third_Spring/computer network/lab/net-lab/testing/faker/tcp.c"

CMakeFiles/ip_test.dir/testing/faker/tcp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ip_test.dir/testing/faker/tcp.c.i"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "D:/Third_Spring/computer network/lab/net-lab/testing/faker/tcp.c" > CMakeFiles/ip_test.dir/testing/faker/tcp.c.i

CMakeFiles/ip_test.dir/testing/faker/tcp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ip_test.dir/testing/faker/tcp.c.s"
	C:/TDM-GCC-64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "D:/Third_Spring/computer network/lab/net-lab/testing/faker/tcp.c" -o CMakeFiles/ip_test.dir/testing/faker/tcp.c.s

# Object files for target ip_test
ip_test_OBJECTS = \
"CMakeFiles/ip_test.dir/testing/ip_test.c.obj" \
"CMakeFiles/ip_test.dir/src/ethernet.c.obj" \
"CMakeFiles/ip_test.dir/src/arp.c.obj" \
"CMakeFiles/ip_test.dir/src/ip.c.obj" \
"CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj" \
"CMakeFiles/ip_test.dir/testing/faker/udp.c.obj" \
"CMakeFiles/ip_test.dir/testing/faker/driver.c.obj" \
"CMakeFiles/ip_test.dir/testing/global.c.obj" \
"CMakeFiles/ip_test.dir/src/net.c.obj" \
"CMakeFiles/ip_test.dir/src/buf.c.obj" \
"CMakeFiles/ip_test.dir/src/map.c.obj" \
"CMakeFiles/ip_test.dir/src/utils.c.obj" \
"CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj"

# External object files for target ip_test
ip_test_EXTERNAL_OBJECTS =

ip_test.exe: CMakeFiles/ip_test.dir/testing/ip_test.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/src/ethernet.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/src/arp.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/src/ip.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/testing/faker/icmp.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/testing/faker/udp.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/testing/faker/driver.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/testing/global.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/src/net.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/src/buf.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/src/map.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/src/utils.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/testing/faker/tcp.c.obj
ip_test.exe: CMakeFiles/ip_test.dir/build.make
ip_test.exe: CMakeFiles/ip_test.dir/linklibs.rsp
ip_test.exe: CMakeFiles/ip_test.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_14) "Linking C executable ip_test.exe"
	"C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/ip_test.dir/objects.a
	C:/TDM-GCC-64/bin/ar.exe qc CMakeFiles/ip_test.dir/objects.a @CMakeFiles/ip_test.dir/objects1.rsp
	C:/TDM-GCC-64/bin/gcc.exe -g -Wl,--whole-archive CMakeFiles/ip_test.dir/objects.a -Wl,--no-whole-archive -o ip_test.exe -Wl,--out-implib,libip_test.dll.a -Wl,--major-image-version,0,--minor-image-version,0 @CMakeFiles/ip_test.dir/linklibs.rsp

# Rule to build all files generated by this target.
CMakeFiles/ip_test.dir/build: ip_test.exe
.PHONY : CMakeFiles/ip_test.dir/build

CMakeFiles/ip_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ip_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ip_test.dir/clean

CMakeFiles/ip_test.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "D:/Third_Spring/computer network/lab/net-lab" "D:/Third_Spring/computer network/lab/net-lab" "D:/Third_Spring/computer network/lab/net-lab/build" "D:/Third_Spring/computer network/lab/net-lab/build" "D:/Third_Spring/computer network/lab/net-lab/build/CMakeFiles/ip_test.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/ip_test.dir/depend
