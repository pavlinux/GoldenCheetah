# To build, copy this file to gcconfig.pri and then fill in the paths.

# You can define the name of the executable file here.
# If you do not specify anything then we default to: GoldenCheetah
#APP_NAME =

# We recommend a debug build for development and a release build for deployment
#CONFIG += debug
CONFIG += release

# Uncomment when WebKit is not available (e.g. QT >= 5.6)
#DEFINES += NOWEBKIT

LIBS +=  -lQt5WebEngineWidgets

# Uncomment below if you want an R chart
# You will need R installed along with the Rcpp and RInside
# packages. There is an R script in the `util' directory that
# can be run to install these packages; see it for more info.
DEFINES += GC_WANT_R

# Uncomment below if you want Python charting / ML etc
# You will need Python Development tools installed
#
# Libs needed can typically be found by calling e.g
# python3.6-config --libs
#
# below 3 lines work well on Linux style OS
DEFINES += GC_WANT_PYTHON
PYTHONINCLUDES = -I/usr/include/python3.7m -I/usr/include/x86_64-linux-gnu/qt5/QtWebEngineWidgets/ -lQt5WebEngineWidgets
PYTHONLIBS = -L/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu -L/usr/lib -lpython3.7m

# put output into a separate dir to keep main directory clear
#DESTDIR = .
#OBJECTS_DIR = ./.obj
#MOC_DIR = ./.moc
#RCC_DIR = ./.rcc
#UI_DIR = ./.ui

# Global conf file name: If you'd like to use a different global config file
# name than the default (e.g. for testing purposes), set it here.
#DEFINES += GC_SETTINGS_APP=\\\"GoldenCheetahTest\\\"

# If you want a console window to appear on Windows machines
# then uncomment the following two lines.
#CONFIG += console
#QMAKE_LFLAGS = -mwindows

# To compile translation you need QT tool - lrelease
# If it is not found using he defaults in src/src.pro
# then set the full path and filename here.
#QMAKE_LRELEASE = /usr/bin/lrelease-qt4

# MSVC needs the WINDOWS KIT libraries for the memory model you are building
#WINKIT_INSTALL= "C:/Program Files (x86)/Windows Kits/8.1/Lib/winv6.3/um/x64"

# We use g++ on all platforms so switch on auto vectorization amongst other
# things to speed up looping over ride file points
QMAKE_CXXFLAGS += -g0 -ggdb0 -Ofast -mtune=native -march=native -mfpmath=sse -fexcess-precision=fast -fno-strict-aliasing -floop-parallelize-all -funroll-all-loops

# Let us know where flex and bison are installed.
# You may need to specify the full path if things don't work.
QMAKE_LEX  = flex
QMAKE_YACC = bison
# If you're compiling with nmake and VC then you
# will likely also use win_flex and win_bison
# so uncomment below
#QMAKE_LEX = win_flex
#QMAKE_YACC = win_bison
#win32 {
#  QMAKE_YACC = bison --file-prefix=y -t
#  QMAKE_MOVE = cmd /c move
#  QMAKE_DEL_FILE = rm -f
#}

# If you want SRM download support you must install SRMIO
#     http://www.zuto.de/project/srmio/
# Set path to the root of the SRMIO installation
# If you installed in /usr/local/srmio then set
# SRMIO_INSTALL = /usr/local/srmio
# This will automatically set:
# SRMIO_INCLUDE = $${SRMIO_INSTALL}/include
# SRMIO_LIBS    = $${SRMIO_INSTALL}/lib/libsrmio.a
# You may override the INCLUDE and LIB files if you like.
# You *must* define SRMIO_INSTALL to use this feature.
SRMIO_INSTALL = /usr/lib
SRMIO_INCLUDE = /usr/include
SRMIO_LIBS    = /usr/lib/libsrmio.a -lsrmio

# If you want D2XX device downloads, you need the D2XX libraries
#    http://www.ftdichip.com/Drivers/D2XX.htm
# Set path to where the D2XX include file (d2xx.h) is located
# If the files are in /usr/include/d2xx then set
# D2XX = /usr/include/d2xx
# If for some reason you need a library to compile d2xx support
# specify it on the D2XX_LIBS = line.
# You *must* define D2XX_INCLUDE to use this feature.
#D2XX_INCLUDE = 
#D2XX_LIBS    =

# If you want support for Google Earth .kml files then you need
# to install the Google libkml library
#
# http://code.google.com/p/libkml/
# or on Linux sudo apt-get install libkml-dev
#
# then set the following variable appropriately
# to the root of the libs/include path
#KML_INSTALL = /usr/local
#KML_INCLUDE = 
#KML_LIBS    = 
# Since KML also requires BOOST you will need to install
# that too and then set BOOST_INCLUDE to that location
# If the files are in /usr/include/boost then set
BOOST_INCLUDE = /usr/include

#Additionally, on MAC the latest libs also need the following
#QMAKE_CFLAGS_X86_64 += -mmacosx-version-min=10.7
#QMAKE_CXXFLAGS_X86_64 = $$QMAKE_CFLAGS_X86_64
#LIBS += -lexpat -luriparser -lminizip

# If you want support for downloading from iCal calendars you will need libical
#     http://sourceforge.net/projects/freeassociation/
# Set path to the root of the libical installation
# If you installed in /usr/local/libical then set
# ICAL_INSTALL = /usr/local/libical
# This will automatically set:
# ICAL_INCLUDE = $${ICAL_INSTALL}/include 
# ICAL_LIBS    = $${ICAL_INSTALL}/lib/libical.a
# You may override the INCLUDE and LIB files if you like.
# You *must* define ICAL_INSTALL to use this feature.
ICAL_INSTALL = /usr/include
ICAL_INCLUDE = /usr/include
ICAL_LIBS    = -lical


# If you want support for using USB1 sticks in Train View on Windows
# then install the SiLabs USBXpress Software Development Kit (SDK)
#     http://www.silabs.com/products/mcu/Pages/USBXpress.aspx
# and set the following to the 'Host' directory within the SDK
# USBXPRESS_INSTALL = /c/SiLabs/MCU/USBXpress/USBXpress_API/Host/
# You may override the INCLUDE and LIB files if you like.
# You *must* define USBXPRESS_INSTALL to use this feature.
#USBXPRESS_INSTALL = 
#USBXPRESS_INCLUDE = 
#USBXPRESS_LIBS    = 

# If you want support for using USB2 sticks in Train View on Linux or Windows
# then you need to install libusb (Linux) version 0.1.12 
# or libusb-win32 (Windows) version 1.2.6.0
# For Linux builds download: (There is a copy in the contrib directory)
#     http://prdownloads.sourceforge.net/libusb/libusb-0.1.12.tar.gz
# For Windows builds download:
#     ttps://sourceforge.net/projects/libusb-win32/files/libusb-win32-releases/1.2.6.0/
# You may override the INCLUDE and LIB files if you like.
# You *must* define LIBUSB_INSTALL to use this feature.
LIBUSB_INSTALL = /usr/lib/
#LIBUSB_INCLUDE =
LIBUSB_LIBS = -lusb -lusb-1.0
LIBUSB_USE_V_1 = false # don't use on Windows

# if you want video playback on training mode then
# download and install vlc (videolan) from
# ftp.videolan.org/pub/vlc/1.1.8 or http://download.videolan.org/vlc/ for 
# your platform there are sdks for Mac and Windows. On Linux you
# will need to use the latest distro (e.g. Meerkat
# on Ubuntu) to be sure apt-get installs the latest
# builds (we need 1.1.8 or higher).
# Set path to the root of the VLC installation
# If the are installed in /usr/local/vlc then set
# VLC_INSTALL = /usr/local/vlc
# This will automatically set (Windows and Unix):
# VLC_INCLUDE = $${VLC_INSTALL}/include 
# For Windows
# VLC_LIBS    = $${VLC_INSTALL}/lib/libvlc.dll.a
# For Unix
# VLC_LIBS    = -lvlc
# You may override the INCLUDE and LIB files if you like.
# You *must* define VLC_INSTALL to use this feature.
#VLC_INSTALL =
#VLC_INCLUDE =
#VLC_LIBS = -lvlc

# *** Mac users NOTE ***
# On MAC you don't need libvlc since we use the
# native QTKit (OSX framework) for video playback
# using Quicktime and on 10.6 or higher Quicktime X
#

# if you want to resample with high fidelity we can use the
# libsamplerate libraries, this is used in RideFile::resample()
# if you don't resample (e.g. export or merge with new recording
# intervals) then don't bother.
#
# Mainly tested on Linux, compilation on Windows requires
# some modifications in the build process to build with MSVC2015 
# Code is available at: http://www.mega-nerd.com/SRC/
#
SAMPLERATE_INSTALL = /usr/
SAMPLERATE_INCLUDE = /usr/include
SAMPLERATE_LIBS = /usr/lib/x86_64-linux-gnu/libsamplerate.a

# If your system has PKG_CONFIG, QT can use this to get dependent libraries.
# Add the names of libraries with PKG_CONFIG information.
# eg. PKGCONFIG = oauth libical
# Uncomment the following two lines to enable.
#CONFIG   += link_pkgconfig
#PKGCONFIG = 

# If your QT build includes its own local compress libs
# then you should comment the line below, otherwise you
# will need to have the compress libraries installed
# separately. 
#LIBZ_INCLUDE =
LIBZ_LIBS    = -lz

macx {
    # Uncomment this line to build with OS X Tiger support on a Leopard system:
    #QMAKE_MAC_SDK=/Developer/SDKs/MacOSX10.4u.sdk

    # Uncomment this line to build a OS X universal binary:
    #CONFIG+=x86 ppc

    # Uncomment this line if you have SDK 10.7 or higher
    #DEFINES += GC_HAVE_LION

    #uncomment below if you are running on the 10.9 developer preview
    #INCLUDEPATH += /Library/Developer/CommandLineTools/SDKs/MacOSX10.9.sdk/usr/include/ 
}

# uncomment below for R integration via webservices
#HTPATH = ../httpserver

#if you want a 'robot' to test realtime code without having
#to get on your trainer and ride then uncomment below
#DEFINES += GC_WANT_ROBOT

#if you have a version of mingw that properly provides
#the Dwmapi.h header then uncomment this line
#DEFINES += GC_HAVE_DWM

# USING THE DROPBOX API
# register your app at https://www.dropbox.com/developers/apps and
# make sure the redirect_uri for the app includes  the url: 
# https://goldencheetah.github.io/blank.html and full permissions 
# are granted. Then set the client # and secret in the two defines
# below replacing the xxxxxxxxxxxxxx with the actual values.
#DEFINES += GC_DROPBOX_CLIENT_ID=\\\"xxxxxxxxxxxxxxx\\\"
#DEFINES += GC_DROPBOX_CLIENT_SECRET=\\\"xxxxxxxxxxxxxxx\\\"

# if you have your own MAPQUEST KEY
#DEFINES += GC_MAPQUESTAPI_KEY=\\\"xxxxxxxxxxxxxxxxxxxxxx\\\"

# USING THE WITHINGS API (http://oauth.withings.com/api)
#DEFINES += GC_WITHINGS_CONSUMER_KEY=\\\"xxxxxxxxxxxxxxx\\\"
#DEFINES += GC_WITHINGS_CONSUMER_SECRET=\\\"xxxxxxxxxxxxxxx\\\"

# What video playback do you want?
#DEFINES += GC_VIDEO_NONE             # dont add any video playback support
# DEFINES += GC_VIDEO_QUICKTIME        # mac only and the default
DEFINES += GC_VIDEO_QT5              # use QT5 qvideowidget if QT > 5.2.1
#DEFINES += GC_VIDEO_VLC              # use VideoLan library needs VLC_INSTALL defined above
DEFINES += GC_VIDEO_AV               # use AV Foundation on Mac now QTKit is deprecated


# Using the GoldenCheetah/CloudDB feature (with a private CloudDB instance)
# requires that you have a running instance of CloudDB on Google App Engine
# (for details on CloudDB please check the documentation here: https://github.com/GoldenCheetah/CloudDB
#DEFINES +=GC_CLOUD_DB_BASIC_AUTH=
#DEFINES +=GC_CLOUD_DB_APP_NAME=
#CloudDB = active
