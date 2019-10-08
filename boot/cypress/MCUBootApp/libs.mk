################################################################################
# \file libs.mk
# \version 1.0
#
# \brief
# Makefile to describe libraries needed for Cypress MCUBoot based applications.
#
################################################################################
# \copyright
# Copyright 2018-2019 Cypress Semiconductor Corporation
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

################################################################################
# PDL library
################################################################################
PDL_VERSION = 121
#
CUR_LIBS_PATH = $(CURDIR)/libs

# Collect source files for PDL
SOURCES_PDL := $(wildcard $(CUR_LIBS_PATH)/pdl/psoc6pdl/drivers/source/*.c)
SOURCES_PDL += $(CUR_LIBS_PATH)/pdl/psoc6pdl/devices/bsp/COMPONENT_MTB/startup/system_psoc6_cm0plus.c

# Collect source files for MbedTLS
SOURCES_MBEDTLS := $(wildcard $(CUR_LIBS_PATH)/mbedtls/library/*.c)

# PDL related include directories
INCLUDE_DIRS_PDL := $(CUR_LIBS_PATH)/pdl/psoc6pdl/drivers/include
INCLUDE_DIRS_PDL += $(CUR_LIBS_PATH)/pdl/psoc6pdl/devices/include/
INCLUDE_DIRS_PDL += $(CUR_LIBS_PATH)/pdl/psoc6pdl/devices/include/ip
INCLUDE_DIRS_PDL += $(CUR_LIBS_PATH)/pdl/psoc6pdl/cmsis/include
INCLUDE_DIRS_PDL += $(CUR_LIBS_PATH)/bsp/core-lib/include

# MbedTLS related include directories
INCLUDE_DIRS_MBEDTLS := $(CUR_LIBS_PATH)/mbedtls/include
INCLUDE_DIRS_MBEDTLS += $(CUR_LIBS_PATH)/mbedtls/include/mbedtls

# Collected source files for libraries
SOURCES_LIBS := $(SOURCES_PDL)
SOURCES_LIBS += $(SOURCES_BSP)
SOURCES_LIBS += $(SOURCES_MBEDTLS)

# Collected include directories for libraries
INCLUDE_DIRS_LIBS := $(addprefix -I,$(INCLUDE_DIRS_PDL))
INCLUDE_DIRS_LIBS += $(addprefix -I,$(INCLUDE_DIRS_BSP))
INCLUDE_DIRS_LIBS += $(addprefix -I,$(INCLUDE_DIRS_MBEDTLS))

# Add define for PDL version
DEFINES_PDL += -DPDL_VERSION=$(PDL_VERSION)
