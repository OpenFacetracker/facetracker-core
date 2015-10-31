#
# Facetracker 
# @authors : Hamza & Godeleine & Quentin
# installing open cv , using libopencv-dev 
#
OBJ=help
BINDIR=obj
WININSTDIR=install
ARCHDIR=targz

all: $(OBJ)

help:
	@echo  '**************************************'	
	@echo  '*  Facetracker Building    *'
	@echo  '**************************************'
	@echo
	@echo  'make compil 		: Build facetracker'
	@echo  'make memleaks		: Check memory leaks'

compil: compilmsg
compilmsg:
	#Xml/libxml/libxmlforft.a
	@echo ===================[Compiling FT]===================
	@echo 'using g++ ..'
	#g++ -DFT_USE_COLOR=TRUE Utils/ft_main.cpp Console/ft_console.cpp Utils/ft_parser.cpp Utils/ft_config.cpp Utils/ft_log.cpp -o facetracker
	g++ -c  -DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 Utils/ft_main.cpp -o obj/ftmain.o
	g++ -c  -DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 Console/ft_console.cpp -o obj/ftcons.o
	g++ -c  -DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 Utils/ft_parser.cpp -o obj/ftpars.o
	g++ -c  -DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 Utils/ft_utils.cpp -o obj/ftutils.o
	g++ -c  -DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 Utils/ft_config.cpp -o obj/ftconfig.o
	g++ -c  -DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 Utils/ft_log.cpp -o obj/ftlog.o
	g++ -c 	-DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 -DFT_FORM=1 Camera/ft_detect.cpp `pkg-config --cflags --libs opencv` -o obj/ftdetect.o
	g++ -c 	-DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 -DFT_FORM=1 -DFT_TEST_RECOGNISE=1 Camera/ft_draw.cpp `pkg-config --cflags --libs opencv` -o obj/ftdraw.o
	#g++ -c 	-DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 Camera/core/drawing.cpp `pkg-config --cflags --libs opencv` -o obj/ftcoredraw.o
	#using make to compile the xmllib
	#cd lib/XmlLibrary
	make -C lib/XmlLibrary/
	#cd ../../
	#linking all .o files
	g++ obj/*.o lib/XmlLibrary/*.o `pkg-config --cflags --libs opencv` -o facetracker 
	@echo 'done'
	@echo ===================[Finished]===================

memleaks: memleaksmsg
memleaksmsg:
	@echo usiing Valgrind ..
	valgrind --leak-check=yes ./facetracker -r PATH_TMP

mc:	mcmsg
mcmsg:
	#compile a module
	g++ -c 	-DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 -DFT_FORM=1 Camera/ft_detect.cpp `pkg-config --cflags --libs opencv` -o obj/ftdetect.o
	g++ -c 	-DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 -DFT_FORM=1 Camera/ft_draw.cpp `pkg-config --cflags --libs opencv` -o obj/ftdraw.o
	g++ -c  -DFT_USE_COLOR=TRUE -DFT_DEBUG_ENABLED=1 Utils/ft_utils.cpp -o obj/ftutils.o
	g++ obj/*.o lib/XmlLibrary/*.o `pkg-config --cflags --libs opencv` -o facetracker 
