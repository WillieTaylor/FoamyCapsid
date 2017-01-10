/*
cc fits1.c -o fits1 util/wt/util.o util/wt/sort.o -lm

*/
#include "util/wt/incl/util.h"
#include <math.h>


main(argc,argv) int argc; char *argv[];
{
int plot[300];
int i, j, k, m, n, maln,naln,maxaln; 
float r, s, t, t0s,t1s,t2s,t3s,tset, smin,smax, range;
float fit, sum, ssum, wsum, mean, stdv, ymax, zmax;
float *a, rmsd, x,y,z;
char line[222], file[222];
FILE *dat, *plt;
float	damp = 30.0*30.0; // should be adjusted to fit data
int	margin = 10;
	a = (float*)alloca(sizeof(float)*100000);
	sscanf(argv[2],"%f", &damp);
	sscanf(argv[3],"%d", &margin);
	Pr(damp) Pi(margin) NL
	damp *= damp;
	// read overall.dat (full length native)
/*
	strcpy(file,argv[1]);
	strcat(file,"/");
	strcat(file,"overall.dat");
	dat = fopen(file,"r");
*/
dat = fopen("overall.dat","r");
	read_line(dat,line);
	sscanf(line,"%d %f %f", &naln, &rmsd, &s);
	fclose(dat);
	// read random.dat
/*
	strcpy(file,argv[1]);
	strcat(file,"/");
	strcat(file,"random.dat");
	dat = fopen(file,"r");
*/
for(i=0; i<300; i++) plot[i] = 0;
dat = fopen("random.dat","r");
	i = 0;
	while (1)
	{ float s0, t0, t1, t2, t3;
	  int	io = read_line(dat,line), j;
		if (io<=0) break;
		sscanf(line,"%d %f %f %f %f %f %f", &n, &r, &s0, &t0, &t1, &t2, &t3);
		if (n<naln-margin || n>naln+margin) continue;
		x = (float)n;
		// r = a*sqrt(x) : a = r/sqrt(N)
		// r = a*sqrt(x)*(1-exp(-x*x/(30*30))) : a = r/(sqrt(N)*(1-exp(-x*x/(30*30))))
		a[i] = r/(sqrt(x)*(1-exp(-x*x/damp)));
j = (int)(50.0*a[i]+0.5);
plot[j]++;
		i++;
	}
	fclose(dat);
	n = i;
	Pi(n)
	sum = ssum = 0.0;
for(i=0; i<200; i++) { Pi(i) Pi(plot[i]) NL }
	for (i=0; i<n; i++) {
		sum += a[i];
		ssum += a[i]*a[i];
	}
	mean = sum/(float)n;
	stdv = sqrt((ssum-mean*mean*(float)n)/(float)(n-1));
	Pr(mean) Pr(stdv)
ssum = 0.0;
for (i=0; i<n; i++) { float x = a[i]-mean;
	ssum += x*x;
}
ssum /= (float)n;
Pr(sqrt(ssum)) NL
	x = (float)naln;
	y = rmsd/(sqrt(x)*(1-exp(-x*x/damp)));
	Pr(y) Pr(mean-y)
	y = mean - y;
	z = y/stdv;
	Pr(z) NL
}
