#!../../bin/windows-x64/Agilent_53220A

## You may have to change Agilent_53220A to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet "IOCNAME" "$(P=$(MYPVPREFIX))AG53220A"
epicsEnvSet "IOCSTATS_DB" "$(DEVIOCSTATS)/db/iocAdminSoft.db"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/Agilent_53220A.dbd"
Agilent_53220A_registerRecordDeviceDriver pdbbase

cd ${TOP}/iocBoot/${IOC}

# Turn on asynTraceFlow and asynTraceError for global trace, i.e. no connected asynUser.
#asynSetTraceMask("", 0, 17)

## main args are:  portName, configSection, configFile, host, options (see lvDCOMConfigure() documentation in lvDCOMDriver.cpp)
##
## there are additional optional args to specify a DCOM ProgID for a compiled LabVIEW application 
## and a different username + password for remote host if that is required 
##
## the "options" argument is a combination of the following flags (as per the #lvDCOMOptions enum in lvDCOMInterface.h)
##    viWarnIfIdle=1, viStartIfIdle=2, viStopOnExitIfStarted=4, viAlwaysStopOnExit=8
#lvDCOMConfigure("frontpanel", "frontpanel", "$(TOP)/Agilent_53220AApp/protocol/agilent53200A.xml", "ndxchipir", 6, "", "spudulike", "reliablebeam")
lvDCOMConfigure("frontpanel", "frontpanel", "$(TOP)/Agilent_53220AApp/protocol/agilent53200A.xml", "", 6)

dbLoadRecords("$(TOP)/db/Agilent_53220A.db","P=$(IOCNAME):")
#dbLoadRecords("$(IOCSTATS_DB)","IOC=$(IOCNAME)")

#asynSetTraceMask("frontpanel",0,0xff)
asynSetTraceIOMask("frontpanel",0,0x2)

iocInit

