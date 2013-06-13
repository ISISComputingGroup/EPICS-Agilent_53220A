TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = Agilent_53220A
# Agilent_53220A.dbd will be created and installed
DBD += Agilent_53220A.dbd

# Agilent_53220A.dbd will be made up from these files:
Agilent_53220A_DBD += base.dbd

# Include dbd files from all support applications:
#Agilent_53220A_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#Agilent_53220A_LIBS += xxx

# Agilent_53220A_registerRecordDeviceDriver.cpp derives from Agilent_53220A.dbd
Agilent_53220A_SRCS += Agilent_53220A_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
Agilent_53220A_SRCS_DEFAULT += Agilent_53220AMain.cpp
Agilent_53220A_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#Agilent_53220A_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

Agilent_53220A_LIBS +=  lvDCOMSupport asyn
Agilent_53220A_SYS_LIBS_WIN32 += msxml2

# Finally link to the EPICS Base libraries
Agilent_53220A_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

