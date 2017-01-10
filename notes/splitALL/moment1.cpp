/*
c++ moment.cpp -o moment sims/util.o -lm

NC-PSIV    5.019 
CC-RSV     5.009 *
NC-HML2    4.594
NN-BLV     4.494 *
CC-HIV6    4.380 *
NN-BLV6    4.073 *
CC-BLV     4.047 *
CC-BLV6    4.046 *
NN-HTLV    4.030 *
NC-HTLV    4.013
NN-MPMV    3.902 *
CC-HML2    3.900 *

CN-HTLV    3.847
NN-HIV6    3.781 *
CN-HIV1    3.760
CN-RSV     3.754
NN-PSIV    3.731 *
NN-HIV1    3.703 *
NC-HIV1    3.692
NC_BLV6    3.692
NN-RELIK   3.688 *
NC-BLV     3.669
NC-HIV6    3.579
NC-RSV     3.542
CN-BLV     3.400
CC-HIV1    3.362 *
NC-RELIK   3.297
NC-JSRV    3.237
CN-HIV6    3.175
NC-MLV     3.151
NN-RSV     3.123 *
NN-MLV     3.044 *
CN-HML2    3.027
CN-BLV6    3.019
NC-MPMV    2.918
CC-HTLV    2.807 *
NN-HML2    2.166 *
NN-JSRV    0.896 *

*/

#include "sims/util.hpp"
#define M 1000
#define N 38

int main (int argc, char** argv) {
int   top;
int   f[M];
int   s[N] = { 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1 };
float bell,tail;
float mom, got, scale = 1.0; //0.05;
long  seed = (long)time(0);
	srand48(seed);
	FOR(i,M) f[i] = 0;
	sscanf(argv[1],"%d",&top);
	// FOR(i,top) s[i] = 0; FOR(i,top/2) s[i] = 1;
	FOR(m,1000000) { int i, j, k; float x;
		mom = 0.0;
		FOR(n,top) { float d = top - (float)n;
			mom += d*d*(float)s[n];
		}
		mom = sqrt(mom);
		if (m==0) got = mom;
		// FOR(n,top) printf("%1d",s[n]); Pr(mom)
		k = (int)(scale*mom);
		f[k]++;
		i = (int)(drand48()*top);
		j = (int)(drand48()*top);
		k = s[i]; s[i] = s[j]; s[j] = k;
		// Pi(i) Pi(j) NL
	}
	got *= scale;
	Pr(got) NL
	bell = tail = 0.0;
	FOR(n,1000) {
		bell += f[n];
		if (n>got) tail += f[n];
		printf("%5d %7d\n",n,f[n]);
	}
	Pr(bell) Pr(tail) Pr(tail/bell) NL
}
