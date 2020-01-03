TEMPLATE = subdirs
SUBDIRS = qwt
SUBDIRS += src
CONFIG += ordered

pvs_studio.target = pvs
pvs_studio.output = true
pvs_studio.cxxflags = -std=c++11
pvs_studio.sources = $${SOURCES}
include(src/PVS-Studio.pri)
