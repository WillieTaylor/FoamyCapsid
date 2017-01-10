/*
c++ unbias.cpp -o unbias sims/util.o -lm

N+C 5.018795   
C+C 5.008660  *
N+C 4.594095   
N+N 4.493551  *
C+C 4.379582  *
C+C 4.047075  *
C+C 4.046926  *
N+N 4.030429  *
N+C 4.013291    

N+N 3.901779  *
C+C 3.899511  *
C+N 3.846900  
C+N 3.760632  
C+N 3.753835  
N+N 3.731022  *            9
----------------------------
N+N 3.702746  *            5
N+C 3.691602  
N+N 3.687560  *
N+C 3.669370  
N+C 3.542199  

C+N 3.399738  
C+C 3.362449  *
N+C 3.296824  
N+C 3.236956  
C+N 3.175344  
N+C 3.151332  
N+N 3.122707  *
N+N 3.044558  *
C+N 3.027011  
C+N 3.019336  

*/

#define N 30

#include "sims/util.hpp"

int main (int argc, char** argv) {
int   f[1000];
int   s[N] = { 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0 };
float w[N];
float bell,tail;
float mom,got;
long  seed = (long)time(0);
	srand48(seed);
	FOR(i,1000) f[i] = 0;
	FOR(m,1000000) { int i, j, k; float x;
		mom = 0.0;
		FOR(n,N) { float d = (float)n -15.5;
			mom += d*d*(float)s[n]; //*w[n]/4.0;
		}
		if (m==0) got = mom;
		// FOR(n,20) printf("%1d",s[n]); Pr(mom) NL
		k = (int)(0.5*mom);
		f[k]++;
		i = (int)(drand48()*30);
		j = (int)(drand48()*30);
		k = s[i]; s[i] = s[j]; s[j] = k;
		//x = w[i]; w[i] = w[j]; w[j] = x;
	}
	got *= 0.5;
	Pr(got) NL
	bell = tail = 0.0;
	FOR(n,1000) {
		bell += f[n];
		if (n>got) tail += f[n];
		printf("%5d %7d\n",n,f[n]);
	}
	Pr(bell) Pr(tail) Pr(tail/bell) NL
}

