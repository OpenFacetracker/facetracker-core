/*
 * Facetracker 
 * @authors : Hamza & Godeleine & Quentin
 *
*/


#include "../Header/secure.h"


char * Security::rawInput(char* inp){

#ifdef BOUNDS_PROTECTION
	if(strlen(inp) > MAX_SIZE){
		return NULL;
	}
#endif

	return 0;
}