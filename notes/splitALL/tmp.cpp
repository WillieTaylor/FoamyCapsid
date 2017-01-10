/*
c++ uphalf.cpp -o uphalf sims/util.o -lm

HML2_C+C  4.831140 *
PSIV_N+C  4.729706 
RSV_C+C   4.683664 * 
HIV6_C+C  4.631099 *
BLV_N+N   4.550298 *
HIV1_C+N  4.273827
HML2_N+C  4.227009
RSV_C+N   4.199538
MPMV_N+N  4.194418 *
HTLV_N+C  4.015540
HIV1_N+N  4.000161 *
BLV_N+C   3.943483
HTLV_C+N  3.895263
BLV_C+C   3.844976 *
HTLV_N+N  3.822390 *
PSIV_N+N  3.786701 *
HIV1_N+C  3.773716
RELIK_N+N 3.762604 *
BLV6_C+N  3.698471
BLV_C+N   3.681621
RSV_N+C   3.467369
RELIK_N+C 3.420985
MLV_N+C   3.409715
BLV6_C+C  3.330469 *
HTLV_C+C  3.264650 *
HIV1_C+C  3.192982 *
HML2_C+N  3.118644
MLV_N+N   3.022367 *
MPMV_N+C  2.958706
JSRV_N+C  2.926990
RSV_N+N   2.912407 *
HIV6_C+N  2.692553
HML2_N+N  2.333253 *
JSRV_N+N  0.937486 *

*/

#include "sims/util.hpp"
#define M 30
#define N 38

int main (int argc, char** argv) {
int   top;
int   f[M];
int   s[N] = { 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0 };
float bell,tail;
float mom, got, cut;
long  seed = (long)time(0);
	srand48(seed);
	FOR(i,M) f[i] = 0;
	sscanf(argv[1],"%d",&top);
	cut = 0.5*(float)(top-1);
	// FOR(i,top) s[i] = 0; FOR(i,top/2) s[i] = 1;
	FOR(m,1000000) { int i, j, k; float x;
		mom = 0.0;
		FOR(n,top) { float d = (float)n;
			if ( s[n]==1 && d<cut ) mom += 1.0;
		}
		if (m==0) got = mom;
		//FOR(n,top) printf("%1d",s[n]); Pr(mom)
		k = (int)(mom+0.5);
		f[k]++;
		i = (int)(drand48()*top);
		j = (int)(drand48()*top);
		k = s[i]; s[i] = s[j]; s[j] = k;
		//Pi(i) Pi(j) NL
	}
	Pr(got) NL
	bell = tail = 0.0;
	FOR(n,M) {
		bell += f[n];
		if (n>got) tail += f[n];
		printf("%5d %7d\n",n,f[n]);
	}
	Pr(bell) Pr(tail) Pr(tail/bell) NL
}
