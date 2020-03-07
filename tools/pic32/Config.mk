############################################################################
# tools/pic32/Config.mk
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.
#
############################################################################

# These are the macros that will be used in the NuttX make system to compile
# and assembly source files and to insert the resulting object files into an
# archive.  These replace the default definitions at tools/Config.mk

# POSTBUILD -- Perform post build operations

define POSTBUILD
	$(Q)echo "Converting the hex file"; 

	$(Q) if [ ! -f "tools/pic32/mkpichex" ] ; then \
		echo "mkpichex tool doesn't exist"; \
		echo "Please run the following command to build the tool"; \
		echo "make -C tools$(DELIM)pic32 -f Makefile.host"; \
		echo "then run make again."; \
	else \
		tools$(DELIM)pic32$(DELIM)mkpichex$(HOSTEXEEXT) $(PWD); \
		([ $$? -eq 0 ] && echo "Done."); \
	fi

endef