#
# Copyright (C) 2016 Denso IT Laboratory, Inc.
# All Rights Reserved
#
# Denso IT Laboratory, Inc. retains sole and exclusive ownership of all
# intellectual property rights including copyrights and patents related to this
# Software.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of the Software and accompanying documentation to use, copy, modify, merge,
# publish, or distribute the Software or software derived from it for
# non-commercial purposes, such as academic study, education and personal use,
# subject to the following conditions:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

cmake_minimum_required(VERSION 3.5)

set(ISPC_SEARCH_PATHS
  ${ISPC_HOME}
  $ENV{ISPC_HOME}
  $ENV{CMAKE_PREFIX_PATH}
  ${CMAKE_PREFIX_PATH}
  /usr
  /usr/local
)


find_program(ISPC_EXECUTABLE NAMES ispc
  PATHS ${ISPC_SEARCH_PATHS}
)

if (NOT ISPC_ARCH)
  if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
    set (ISPC_ARCH		"arm")
    if (NOT ISPC_TARGET)
      set (ISPC_TARGET	"neon-i32x4")
    endif()
  elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
    set (ISPC_ARCH		"aarch64")
    if (NOT ISPC_TARGET)
      set (ISPC_TARGET	"neon-i32x4")
    endif()
  else()
    set (ISPC_ARCH		"x86-64")
    if (NOT ISPC_TARGET)
      set (ISPC_TARGET	"avx2-i32x8")
    endif()
  endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ispc  DEFAULT_MSG
  ISPC_EXECUTABLE
)
