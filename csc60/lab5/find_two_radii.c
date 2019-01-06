#include "lab5.h"
void find_two_radii(double a, double b, double c, double *radius_inside, double*radius_outside)
{
    double s = ((a + b + c)/2.0);
   
    *radius_inside = sqrt(  (s-a) * (s-b) * (s-c)) / s;

    *radius_outside =(a * b * c) / (sqrt( s * (s-a) * (s-b) * (s-c) ) * 4.0);

    return; 
}


