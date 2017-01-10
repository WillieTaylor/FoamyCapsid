/*
c++ unbias.cpp -o unbias sims/util.o -lm

NC-PSIV    5.02 
CC-RSV     5.01 *
NC-HML2    4.59
NN-BLV     4.49 *
CC-HIV6    4.38 *
CC-BLV6    4.05 *
CC-BLV     4.05 *
NN-HTLV    4.03 *
NC-HTLV    4.01
NN-MPMV    3.90 *
CC-HML2    3.90 *
CN-HTLV    3.85
CN-HIV1    3.76
CN-RSV     3.75
NN-PSIV    3.73 *
NN-HIV1    3.70 *
NN-RELIK   3.69 *
NC-HIV1    3.69
NC-BLV     3.67
NC-RSV     3.54
CN-BLV     3.40
CC-HIV1    3.36 *
NC-RELIK   3.29
NC-JSRV    3.24
CN-HIV6    3.18
NC-MLV     3.15
NN-RSV     3.12 *
NN-MLV     3.04 *
CN-HML2    3.02
CN-BLV6    3.02
NC-MPMV    2.92
CC-HTLV    2.81 *
NN-HML2    2.17 *
NN-JSRV    0.90 *

*/

#include "sims/util.hpp"

#define N 34

int main (int argc, char** argv) {
int   f[1000];
int   s[N] = { 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1 };
float bell,tail;
float mom,got;
long  seed = (long)time(0);
	srand48(seed);
	FOR(i,1000) f[i] = 0;
	FOR(m,1000000) { int i, j, k; float x;
		mom = 0.0;
		FOR(n,20) { float d = 20.0 - (float)n; // - 9.5;
			mom += d*d*(float)s[n]; //*w[n]/4.0;
		}
		if (m==0) got = mom;
		//FOR(n,20) printf("%1d",s[n]); Pr(mom) NL
		k = (int)(0.2*mom);
		f[k]++;
		i = (int)(drand48()*20);
		j = (int)(drand48()*20);
		k = s[i]; s[i] = s[j]; s[j] = k;
		//x = w[i]; w[i] = w[j]; w[j] = x;
	}
	got *= 0.2;
	Pr(got) NL
	bell = tail = 0.0;
	FOR(n,1000) {
		bell += f[n];
		if (n>got) tail += f[n];
		printf("%5d %7d\n",n,f[n]);
	}
	Pr(bell) Pr(tail) Pr(tail/bell) NL
}

