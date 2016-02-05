/*
 * Facetracker 
 * @authors : Hamza & Godeleine & Quentin
 *
*/
#ifndef HFT_RECOGNISE
#define HFT_RECOGNISE
#include <math.h>
#include <ctime>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <opencv/cv.h>  
#include <opencv/highgui.h> 
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/contrib/contrib.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/objdetect/objdetect.hpp> 
#include <fstream>

#ifdef _WIN32
    #define PATH_DB             "DB/images_win.ext"
    #define FT_TEST_RECOGNISE   1
#endif

#ifdef linux
    #define PATH_DB             "DB/images.ext"
#endif

#define UNKNOWN			-1
#define MATCHING		-2
#define RECOGNIZED		 1

using namespace cv;

class Recognise{
	public:
		IplImage *EqualizingPicture(CvRect *r,  IplImage *imageSrc);
		int Crop(IplImage *imageSrc, CvRect *r, int i);
		int ftrecognise(Mat face);
	private:
		void SaveImage(char *filename, Mat img, int *Compteur);
		IplImage *GoGetPictures(char *filename, int *Compteur);
		void parse_csv(const string& filename, vector<Mat>& images, vector<int>& labels);

};


#endif
