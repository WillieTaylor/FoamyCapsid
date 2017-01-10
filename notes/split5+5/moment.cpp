/*
c++ moment.cpp -o moment sims/util.o -lm

        ortho-N   ortho-C   
 foamy   N    C    N    C

BLV-1  4.49 3.67 3.40 4.05

HIV-1  3.70 3.69 3.76 3.36

HML2   2.17 4.59 3.02 3.90

HTLV-1 4.03 4.01 3.85 2.81

RSV    3.12 3.54 3.75 5.01

5.01 cc *
4.59 nc
4.49 nn *
4.05 cc *
4.03 nn *
4.01 nc
3.90 cc *
3.85 cn
3.76 cn
3.75 cn
3.70 nn *
3.69 nc
3.67 nc
3.54 cn
3.40 cn
3.36 cc *
3.12 nn *
3.02 cn
2.81 cc *
2.17 nn *

*/

#include "sims/util.hpp"
#define M 1000
#define N 20

int main (int argc, char** argv) {
int   top;
int   f[M];
int   s[N] = { 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1 };
float w[N] = { 5.01, 4.59, 4.49, 4.05, 4.03, 4.01, 3.90, 3.85, 3.76, 3.75, 3.70, 3.69, 3.67, 3.54, 3.40, 3.36, 3.12, 3.02, 2.81, 2.17};
float bell,tail;
float mom,got;
long  seed = (long)time(0);
	srand48(seed);
	FOR(i,M) f[i] = 0;
	sscanf(argv[1],"%d",&top);
	// FOR(i,top) s[i] = 0; FOR(i,top/2) s[i] = 1;
	FOR(m,1000000) { int i, j, k; float x;
		mom = 0.0;
		FOR(n,top) { float d = top - (float)n; // - (float)(top-1)*0.5;
			mom += d*d*(float)s[n]; //*w[n]/4.0;
		}
		mom = sqrt(mom);
		if (m==0) got = mom;
		// FOR(n,top) printf("%1d",s[n]); Pr(mom)
		k = (int)(2.0*mom);
		f[k]++;
		i = (int)(drand48()*top);
		j = (int)(drand48()*top);
		k = s[i]; s[i] = s[j]; s[j] = k;
		// Pi(i) Pi(j) NL
		//x = w[i]; w[i] = w[j]; w[j] = x;
	}
	got *= 2.0;
	Pr(got) NL
	bell = tail = 0.0;
	FOR(n,1000) {
		bell += f[n];
		if (n>got) tail += f[n];
		printf("%5d %7d\n",n,f[n]);
	}
	Pr(bell) Pr(tail) Pr(tail/bell) NL
}
