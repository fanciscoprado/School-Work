/*---------------------------------------------------*/
/*  Your Name Here                                   */
/*  Lab 2b                                           */
/*                                                   */
/*  This program prints the system limitations.      */

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <float.h>

int main(void)
{
	printf("\nYour name here, Lab 2b.\n\n");

   /*  Print integer type limits.  */
   printf("SIGNED INTEGERS:  \n");
   printf("  short minimum: %i \n",  SHRT_MIN);
   printf("  short maximum: %i \n\n",SHRT_MAX);

   printf("  int minimum: %i \n",  INT_MIN);
   printf("  int maximum: %i \n\n",INT_MAX);

   printf("  long minimum: %li \n",  LONG_MIN);
   printf("  long maximum: %li \n\n",LONG_MAX);


   printf("UNSIGNED INTEGERS:  \n");
   printf("  The lower limit for all unsigned integer is zero.\n");
   printf("  unsigned short maximum: %u \n",USHRT_MAX);
   printf("  unsigned int   maximum: %u \n",UINT_MAX);
   printf("  unsigned long  maximum: %lu \n",ULONG_MAX);

   /*  Print float precision, range, maximum.  */
   printf("\n\nFLOAT PRECISION:  \n");
   printf("  float precision digits: %i \n",FLT_DIG);
   printf("  float maximum exponent: %i \n",FLT_MAX_10_EXP);
   printf("  float maximum: %e \n\n",FLT_MAX);

   /*  Print double precision, range, maximum.  */
   printf("  double precision digits: %i \n",DBL_DIG);
   printf("  double maximum exponent: %i \n",DBL_MAX_10_EXP);
   printf("  double maximum: %e \n\n",DBL_MAX);

   /*  Print long precision, range, maximum.  */
   printf("  long double precision: %i \n",LDBL_DIG);
   printf("  long double maximum exponent: %i \n",LDBL_MAX_10_EXP);
   printf("  long double maximum: %Le \n\n\n",LDBL_MAX);

   /*  Exit program.  */

   return EXIT_SUCCESS;
}
/*---------------------------------------------------*/
