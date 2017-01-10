/*
c++ cdf.cpp -o cdf sims/util.o sims/geom.o -lm

*/
#include "sims/util.hpp"
#include "sims/geom.hpp"

main () {
float x = 1.0;
float sum = x;
float value = x;
float result;
	FOR(j,300) {
		x = 0.01*(float)j;
		FIR(i,100) {
      			value = (value*x*x/(2*i+1));
      			sum = sum+value;
		}
		result = 0.5+(sum/sqrt(2*PI))*exp(-(x*x)/2);
		Pi(x) Pr(result) NL
	}
}
