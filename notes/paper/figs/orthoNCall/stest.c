/*
cc stest.c -o stest util/wt/util.o util/aa/stutest.o util/wt/sort.o -lm

checked against: http://graphpad.com/quickcalcs/ttest1/?Format=C

P value and statistical significance:
  The two-tailed P value equals 0.0187
  By conventional criteria, this difference is considered to be statistically significant.

Confidence interval:
  The mean of Group One minus Group Two equals -0.22441957
  95% confidence interval of this difference: From -0.40537216 to -0.04346697

Intermediate values used in calculations:
  t = 2.6600
  df = 14
  standard error of difference = 0.084

Learn more:

GraphPad's web site includes portions of the manual for GraphPad Prism that can help you learn statistics. First, review the meaning of P values and confidence intervals. Then learn how to interpret results from an unpaired or paired t test. These links include GraphPad's popular analysis checklists.

Review your data:
  Group 	  Group One   	  Group Two  
Mean 	1.15053333 	1.37495290
SD 	0.11488259 	0.18490477
SEM 	0.04690062 	0.05847202
N 	6           	10          

-----------------------------------------------------------------------------
wtaylor@wt:~/ianpdbs/sapit$ ./stest testT 30 10
 argv[1] = testT damp = 30.000000
1.135419
1.019212
1.270234
1.146333
1.036209
1.295793
 in1 = 6 maln = 49 naln = 78 mean1 = 1.150533 stdv1 = 0.114882
1.201959
1.419772
1.635969
1.566285
1.275894
1.390705
1.201959
1.419772
1.070929
1.566285
 in2 = 10 mean2 = 1.374953 stdv2 = 0.184903
Avg: 1.15e+00 < 1.37e+00 Tprob=1.87e-02 *
StD: 1.15e-01 = 1.85e-01 Fprob=1.54e-01 


Tprob=1.87e-02 = The two-tailed P value equals 0.0187

NB for 1-tailed, P = 0.5 2-tailed
*/
#include "util/wt/incl/util.h"
#include "util/aa/incl/student.h"
#include <math.h>


main(argc,argv) int argc; char *argv[];
{
int i, j, k, m, n, in1,in2, maln,naln,maxaln; 
float r, s, t, t0s,t1s,t2s,t3s,tset, smin,smax, range;
float fit, sum, ssum, mean1, mean2, stdv1, stdv2;
float *a, rmsd, x,y,z, fin;
char line[222], file[222];
FILE *dat, *plt;
float	damp = 30.0;
int	margin = 10;
	a = (float*)alloca(sizeof(float)*100000);
	sscanf(argv[2],"%f", &damp);
	sscanf(argv[3],"%d", &margin);
	Ps(argv[1]) Pr(damp) NL
	damp *= damp;
	// read overall.dat (full length native)
/*
	strcpy(file,argv[1]);
	strcat(file,"/");
	strcat(file,"overall.dat");
*/
	dat = fopen("sapall.dat","r");
	maln = 999;
	naln = -99;
	in1 = 0;
	while (1)
	{ int	io = read_line(dat,line);
		if (io<=0) break;
		sscanf(line,"%d %ff", &n, &rmsd);
		if (n < maln) maln = n;
		if (n > naln) naln = n;
		x = (float)n;
		// r = a*sqrt(x) : a = r/sqrt(N)
		// r = a*sqrt(x)*(1-exp(-x*x/(30*30))) : a = r/(sqrt(N)*(1-exp(-x*x/(30*30))))
		a[in1] = rmsd/(sqrt(x)*(1-exp(-x*x/damp)));
		in1++;
	}
	fclose(dat);
	if (naln-maln < margin*2) {
		n = (maln+naln)/2;
		maln = n - margin;
		naln = n + margin;
	}
	Pi(in1) Pi(maln) Pi(naln)
	sum = ssum = 0.0;
	for (i=0; i<in1; i++) {
		sum += a[i];
		ssum += a[i]*a[i];
	}
	fin = (float)in1;
	mean1 = sum/fin;
	stdv1 = sqrt((ssum-mean1*mean1*fin)/(fin-1.0));
	Pr(mean1) Pr(stdv1)
	// read random.dat
/*
	strcpy(file,argv[1]);
	strcat(file,"/");
	strcat(file,"randoms.dat");
*/
	dat = fopen("random.dat","r");
	in2 = 0;
	while (1)
	{ float s0, t0, t1, t2, t3;
	  int	io = read_line(dat,line);
		if (io<=0) break;
		sscanf(line,"%d %f %f %f %f %f %f", &n, &r, &s0, &t0, &t1, &t2, &t3);
		if (n<maln || n>naln) continue;
		x = (float)n;
		a[in2] = r/(sqrt(x)*(1-exp(-x*x/damp)));
		in2++;
	}
	fclose(dat);
	Pi(in2)
	sum = ssum = 0.0;
	for (i=0; i<in2; i++) {
		sum += a[i];
		ssum += a[i]*a[i];
	}
	fin = (float)in2;
	mean2 = sum/fin;
	stdv2 = sqrt((ssum-mean2*mean2*fin)/(fin-1.0));
	Pr(mean2) Pr(stdv2)
	NL
	stutest(mean1,mean2,stdv1*stdv1,stdv2*stdv2,in1,in2);
}
