#!/usr/bin/perl

use strict;
use warnings;
use feature qw(say);

my $part = $ARGV[0];

$part =~ s/{//;
$part =~ s/}//;

my $x;
my $m;
my $a;
my $s;

my @elements = split /,/, $part;
foreach my $el (@elements) {
	if ($el =~ /^x=(\d+)\z/) {
		$x = $1;
	} elsif ($el =~ /^m=(\d+)\z/) {
		$m = $1;
	} elsif ($el =~ /^a=(\d+)\z/) {
		$a = $1;
	} elsif ($el =~ /^s=(\d+)\z/) {
		$s = $1;
	} else {
		die "cant parse part";
	}
}

goto LABEL_in;

LABEL_btl:
# m>2179:hzd,a>965:js,x<3167:bc,crx
if ( $m > 2179 ) {
	goto LABEL_hzd;
}
if ( $a > 965 ) {
	goto LABEL_js;
}
if ( $x < 3167 ) {
	goto LABEL_bc;
}
goto LABEL_crx;

LABEL_ktc:
# x<2922:A,s<469:R,R
if ( $x < 2922 ) {
	say 'A';
	exit;
}
if ( $s < 469 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_ctl:
# m<420:A,s>2487:R,A
if ( $m < 420 ) {
	say 'A';
	exit;
}
if ( $s > 2487 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_mcm:
# x>3761:A,x>3654:A,a<829:A,R
if ( $x > 3761 ) {
	say 'A';
	exit;
}
if ( $x > 3654 ) {
	say 'A';
	exit;
}
if ( $a < 829 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_bj:
# x<1257:xc,sr
if ( $x < 1257 ) {
	goto LABEL_xc;
}
goto LABEL_sr;

LABEL_mfq:
# x<3188:rr,x<3650:R,A
if ( $x < 3188 ) {
	goto LABEL_rr;
}
if ( $x < 3650 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_tlh:
# a>738:R,A
if ( $a > 738 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_zn:
# x>3618:ph,hvb
if ( $x > 3618 ) {
	goto LABEL_ph;
}
goto LABEL_hvb;

LABEL_rb:
# s<892:R,a<2337:A,A
if ( $s < 892 ) {
	say 'R';
	exit;
}
if ( $a < 2337 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_ms:
# x<3783:A,x>3900:R,A
if ( $x < 3783 ) {
	say 'A';
	exit;
}
if ( $x > 3900 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_prn:
# m>2248:R,A
if ( $m > 2248 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_qtq:
# a>3468:A,m>2263:A,jt
if ( $a > 3468 ) {
	say 'A';
	exit;
}
if ( $m > 2263 ) {
	say 'A';
	exit;
}
goto LABEL_jt;

LABEL_dx:
# a<3314:R,m<3567:R,a<3330:R,R
if ( $a < 3314 ) {
	say 'R';
	exit;
}
if ( $m < 3567 ) {
	say 'R';
	exit;
}
if ( $a < 3330 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_vt:
# x>3136:tcz,x>2504:csv,x>2299:smz,kjt
if ( $x > 3136 ) {
	goto LABEL_tcz;
}
if ( $x > 2504 ) {
	goto LABEL_csv;
}
if ( $x > 2299 ) {
	goto LABEL_smz;
}
goto LABEL_kjt;

LABEL_xt:
# x<2452:A,R
if ( $x < 2452 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_xkc:
# x<2342:A,A
if ( $x < 2342 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_st:
# s<3506:R,A
if ( $s < 3506 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_zz:
# s<1239:lxb,s>1671:qgb,m>2346:ts,rbp
if ( $s < 1239 ) {
	goto LABEL_lxb;
}
if ( $s > 1671 ) {
	goto LABEL_qgb;
}
if ( $m > 2346 ) {
	goto LABEL_ts;
}
goto LABEL_rbp;

LABEL_lsh:
# m>2358:A,s>1491:R,R
if ( $m > 2358 ) {
	say 'A';
	exit;
}
if ( $s > 1491 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_cq:
# m<2723:R,A
if ( $m < 2723 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_xll:
# s<586:A,x<2806:A,x<2947:R,R
if ( $s < 586 ) {
	say 'A';
	exit;
}
if ( $x < 2806 ) {
	say 'A';
	exit;
}
if ( $x < 2947 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_csn:
# m<2108:R,s>714:A,a<760:R,A
if ( $m < 2108 ) {
	say 'R';
	exit;
}
if ( $s > 714 ) {
	say 'A';
	exit;
}
if ( $a < 760 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_fr:
# a<1242:R,R
if ( $a < 1242 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_dvh:
# m>1842:gt,s>3457:jhg,jgd
if ( $m > 1842 ) {
	goto LABEL_gt;
}
if ( $s > 3457 ) {
	goto LABEL_jhg;
}
goto LABEL_jgd;

LABEL_gxq:
# a>2315:R,a<2256:A,m>3786:A,R
if ( $a > 2315 ) {
	say 'R';
	exit;
}
if ( $a < 2256 ) {
	say 'A';
	exit;
}
if ( $m > 3786 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_vc:
# x<1484:zlf,x>1814:A,s<520:jsc,R
if ( $x < 1484 ) {
	goto LABEL_zlf;
}
if ( $x > 1814 ) {
	say 'A';
	exit;
}
if ( $s < 520 ) {
	goto LABEL_jsc;
}
say 'R';
exit;

LABEL_hxh:
# a<3821:gpz,s>1853:mtg,mfq
if ( $a < 3821 ) {
	goto LABEL_gpz;
}
if ( $s > 1853 ) {
	goto LABEL_mtg;
}
goto LABEL_mfq;

LABEL_pbz:
# a>2928:xtm,x<2843:vz,m<1108:dv,zg
if ( $a > 2928 ) {
	goto LABEL_xtm;
}
if ( $x < 2843 ) {
	goto LABEL_vz;
}
if ( $m < 1108 ) {
	goto LABEL_dv;
}
goto LABEL_zg;

LABEL_xr:
# m>182:A,s>1810:A,x<3330:A,R
if ( $m > 182 ) {
	say 'A';
	exit;
}
if ( $s > 1810 ) {
	say 'A';
	exit;
}
if ( $x < 3330 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_ps:
# x>2127:hnp,dgb
if ( $x > 2127 ) {
	goto LABEL_hnp;
}
goto LABEL_dgb;

LABEL_lqg:
# a<3277:zb,m<1525:mdd,qsz
if ( $a < 3277 ) {
	goto LABEL_zb;
}
if ( $m < 1525 ) {
	goto LABEL_mdd;
}
goto LABEL_qsz;

LABEL_jn:
# x>683:A,m>1020:A,R
if ( $x > 683 ) {
	say 'A';
	exit;
}
if ( $m > 1020 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_fhk:
# a<543:R,R
if ( $a < 543 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_gvp:
# m>2630:A,m<1098:R,x>1224:A,A
if ( $m > 2630 ) {
	say 'A';
	exit;
}
if ( $m < 1098 ) {
	say 'R';
	exit;
}
if ( $x > 1224 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_ptm:
# x>1764:A,tj
if ( $x > 1764 ) {
	say 'A';
	exit;
}
goto LABEL_tj;

LABEL_sq:
# m>3289:A,a<312:xt,x>2449:A,fxr
if ( $m > 3289 ) {
	say 'A';
	exit;
}
if ( $a < 312 ) {
	goto LABEL_xt;
}
if ( $x > 2449 ) {
	say 'A';
	exit;
}
goto LABEL_fxr;

LABEL_khp:
# m>3526:A,A
if ( $m > 3526 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_dc:
# x<2210:A,m<1269:bqk,A
if ( $x < 2210 ) {
	say 'A';
	exit;
}
if ( $m < 1269 ) {
	goto LABEL_bqk;
}
say 'A';
exit;

LABEL_qt:
# s>278:R,m>2866:R,s>172:R,R
if ( $s > 278 ) {
	say 'R';
	exit;
}
if ( $m > 2866 ) {
	say 'R';
	exit;
}
if ( $s > 172 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_gm:
# x<363:A,m>3188:A,A
if ( $x < 363 ) {
	say 'A';
	exit;
}
if ( $m > 3188 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_shn:
# m<2469:R,s<3668:mbz,R
if ( $m < 2469 ) {
	say 'R';
	exit;
}
if ( $s < 3668 ) {
	goto LABEL_mbz;
}
say 'R';
exit;

LABEL_vhg:
# x<608:A,m<1535:R,m<1981:R,R
if ( $x < 608 ) {
	say 'A';
	exit;
}
if ( $m < 1535 ) {
	say 'R';
	exit;
}
if ( $m < 1981 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_hds:
# s>2670:xv,blj
if ( $s > 2670 ) {
	goto LABEL_xv;
}
goto LABEL_blj;

LABEL_ffr:
# a>2824:mk,s>3257:br,pl
if ( $a > 2824 ) {
	goto LABEL_mk;
}
if ( $s > 3257 ) {
	goto LABEL_br;
}
goto LABEL_pl;

LABEL_td:
# m<3587:R,s>3340:A,a<3441:zv,hdq
if ( $m < 3587 ) {
	say 'R';
	exit;
}
if ( $s > 3340 ) {
	say 'A';
	exit;
}
if ( $a < 3441 ) {
	goto LABEL_zv;
}
goto LABEL_hdq;

LABEL_sgx:
# s>2973:fm,cvm
if ( $s > 2973 ) {
	goto LABEL_fm;
}
goto LABEL_cvm;

LABEL_tbm:
# a<3447:R,x<2836:A,x>2953:A,R
if ( $a < 3447 ) {
	say 'R';
	exit;
}
if ( $x < 2836 ) {
	say 'A';
	exit;
}
if ( $x > 2953 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_mk:
# m>2029:mls,s>3309:sx,tnr
if ( $m > 2029 ) {
	goto LABEL_mls;
}
if ( $s > 3309 ) {
	goto LABEL_sx;
}
goto LABEL_tnr;

LABEL_kfx:
# s>1999:R,s<1809:A,s<1887:A,A
if ( $s > 1999 ) {
	say 'R';
	exit;
}
if ( $s < 1809 ) {
	say 'A';
	exit;
}
if ( $s < 1887 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_tl:
# s<3243:A,m>724:R,s>3595:A,A
if ( $s < 3243 ) {
	say 'A';
	exit;
}
if ( $m > 724 ) {
	say 'R';
	exit;
}
if ( $s > 3595 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_cdm:
# a<1934:R,x>1474:A,R
if ( $a < 1934 ) {
	say 'R';
	exit;
}
if ( $x > 1474 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_ksc:
# x>2830:zj,R
if ( $x > 2830 ) {
	goto LABEL_zj;
}
say 'R';
exit;

LABEL_ngp:
# m<639:A,m<931:R,A
if ( $m < 639 ) {
	say 'A';
	exit;
}
if ( $m < 931 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_jmb:
# a>414:A,R
if ( $a > 414 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_kb:
# a<3227:A,a<3254:R,s>1475:bvm,dd
if ( $a < 3227 ) {
	say 'A';
	exit;
}
if ( $a < 3254 ) {
	say 'R';
	exit;
}
if ( $s > 1475 ) {
	goto LABEL_bvm;
}
goto LABEL_dd;

LABEL_sm:
# x>1966:A,s>3208:A,fhk
if ( $x > 1966 ) {
	say 'A';
	exit;
}
if ( $s > 3208 ) {
	say 'A';
	exit;
}
goto LABEL_fhk;

LABEL_br:
# a>2604:zr,x<1844:nj,bn
if ( $a > 2604 ) {
	goto LABEL_zr;
}
if ( $x < 1844 ) {
	goto LABEL_nj;
}
goto LABEL_bn;

LABEL_szc:
# x>2026:cmt,nl
if ( $x > 2026 ) {
	goto LABEL_cmt;
}
goto LABEL_nl;

LABEL_ptb:
# x>3345:A,A
if ( $x > 3345 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_hfr:
# s>3267:R,s>3108:A,x>898:R,A
if ( $s > 3267 ) {
	say 'R';
	exit;
}
if ( $s > 3108 ) {
	say 'A';
	exit;
}
if ( $x > 898 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_qzt:
# a>452:A,A
if ( $a > 452 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_bvb:
# x>3335:A,m>726:R,R
if ( $x > 3335 ) {
	say 'A';
	exit;
}
if ( $m > 726 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_gh:
# s>2919:R,A
if ( $s > 2919 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_frb:
# x<2808:A,s>2187:R,x>3086:A,R
if ( $x < 2808 ) {
	say 'A';
	exit;
}
if ( $s > 2187 ) {
	say 'R';
	exit;
}
if ( $x > 3086 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_nj:
# s<3562:fj,zdd
if ( $s < 3562 ) {
	goto LABEL_fj;
}
goto LABEL_zdd;

LABEL_gfn:
# x>1559:lzh,a<3447:pj,s<2150:pcz,mm
if ( $x > 1559 ) {
	goto LABEL_lzh;
}
if ( $a < 3447 ) {
	goto LABEL_pj;
}
if ( $s < 2150 ) {
	goto LABEL_pcz;
}
goto LABEL_mm;

LABEL_kpv:
# s>1913:A,A
if ( $s > 1913 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_bd:
# x>3053:zn,s<719:pqb,a>2965:mkc,vr
if ( $x > 3053 ) {
	goto LABEL_zn;
}
if ( $s < 719 ) {
	goto LABEL_pqb;
}
if ( $a > 2965 ) {
	goto LABEL_mkc;
}
goto LABEL_vr;

LABEL_dv:
# s>1488:R,R
if ( $s > 1488 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_vr:
# a<2767:rbh,a<2894:pb,m<2321:pbz,xd
if ( $a < 2767 ) {
	goto LABEL_rbh;
}
if ( $a < 2894 ) {
	goto LABEL_pb;
}
if ( $m < 2321 ) {
	goto LABEL_pbz;
}
goto LABEL_xd;

LABEL_xff:
# a>3469:R,A
if ( $a > 3469 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_rl:
# a<2707:R,x>1355:bpn,A
if ( $a < 2707 ) {
	say 'R';
	exit;
}
if ( $x > 1355 ) {
	goto LABEL_bpn;
}
say 'A';
exit;

LABEL_nq:
# m<1201:mmc,m<1568:nmf,x<1120:dtq,sck
if ( $m < 1201 ) {
	goto LABEL_mmc;
}
if ( $m < 1568 ) {
	goto LABEL_nmf;
}
if ( $x < 1120 ) {
	goto LABEL_dtq;
}
goto LABEL_sck;

LABEL_xgx:
# m<574:R,x>1164:A,a>3805:R,A
if ( $m < 574 ) {
	say 'R';
	exit;
}
if ( $x > 1164 ) {
	say 'A';
	exit;
}
if ( $a > 3805 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_qcm:
# x>2564:A,x<2198:R,m>1241:R,A
if ( $x > 2564 ) {
	say 'A';
	exit;
}
if ( $x < 2198 ) {
	say 'R';
	exit;
}
if ( $m > 1241 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_tb:
# m>551:R,m>206:R,m>71:A,A
if ( $m > 551 ) {
	say 'R';
	exit;
}
if ( $m > 206 ) {
	say 'R';
	exit;
}
if ( $m > 71 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_nrr:
# x<2955:A,m>2499:R,m<1664:R,A
if ( $x < 2955 ) {
	say 'A';
	exit;
}
if ( $m > 2499 ) {
	say 'R';
	exit;
}
if ( $m < 1664 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_fv:
# s>3065:R,m>744:R,A
if ( $s > 3065 ) {
	say 'R';
	exit;
}
if ( $m > 744 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_mf:
# s>695:dls,a<3530:pp,cmk
if ( $s > 695 ) {
	goto LABEL_dls;
}
if ( $a < 3530 ) {
	goto LABEL_pp;
}
goto LABEL_cmk;

LABEL_gp:
# m>1636:A,a>2986:A,A
if ( $m > 1636 ) {
	say 'A';
	exit;
}
if ( $a > 2986 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_fdg:
# a<3799:A,R
if ( $a < 3799 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_xjp:
# m<978:bjn,x>755:rx,dq
if ( $m < 978 ) {
	goto LABEL_bjn;
}
if ( $x > 755 ) {
	goto LABEL_rx;
}
goto LABEL_dq;

LABEL_dbc:
# s>340:R,a>3588:R,A
if ( $s > 340 ) {
	say 'R';
	exit;
}
if ( $a > 3588 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_qsz:
# s>1368:ch,m>2826:zd,dm
if ( $s > 1368 ) {
	goto LABEL_ch;
}
if ( $m > 2826 ) {
	goto LABEL_zd;
}
goto LABEL_dm;

LABEL_bs:
# x>938:A,A
if ( $x > 938 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_pjs:
# s>3520:mh,s>3245:sg,m>2522:A,A
if ( $s > 3520 ) {
	goto LABEL_mh;
}
if ( $s > 3245 ) {
	goto LABEL_sg;
}
if ( $m > 2522 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_mfm:
# m>687:A,m<414:A,a>815:R,R
if ( $m > 687 ) {
	say 'A';
	exit;
}
if ( $m < 414 ) {
	say 'A';
	exit;
}
if ( $a > 815 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_jkr:
# s>3843:R,mzq
if ( $s > 3843 ) {
	say 'R';
	exit;
}
goto LABEL_mzq;

LABEL_tlq:
# a>711:npd,qqk
if ( $a > 711 ) {
	goto LABEL_npd;
}
goto LABEL_qqk;

LABEL_qq:
# a<3021:dmg,m<1998:R,a>3061:ln,frq
if ( $a < 3021 ) {
	goto LABEL_dmg;
}
if ( $m < 1998 ) {
	say 'R';
	exit;
}
if ( $a > 3061 ) {
	goto LABEL_ln;
}
goto LABEL_frq;

LABEL_mxm:
# s>2536:A,s<1125:tpx,fr
if ( $s > 2536 ) {
	say 'A';
	exit;
}
if ( $s < 1125 ) {
	goto LABEL_tpx;
}
goto LABEL_fr;

LABEL_dz:
# x>3321:A,a<3383:R,A
if ( $x > 3321 ) {
	say 'A';
	exit;
}
if ( $a < 3383 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_sqn:
# m<1108:A,x<2454:R,A
if ( $m < 1108 ) {
	say 'A';
	exit;
}
if ( $x < 2454 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_bbv:
# x>1695:R,A
if ( $x > 1695 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_fzb:
# a>2748:R,m>727:A,A
if ( $a > 2748 ) {
	say 'R';
	exit;
}
if ( $m > 727 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_tj:
# x>994:A,x<569:R,A
if ( $x > 994 ) {
	say 'A';
	exit;
}
if ( $x < 569 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_rd:
# m>3082:vx,a>2081:vn,xn
if ( $m > 3082 ) {
	goto LABEL_vx;
}
if ( $a > 2081 ) {
	goto LABEL_vn;
}
goto LABEL_xn;

LABEL_tq:
# x>2808:tb,trq
if ( $x > 2808 ) {
	goto LABEL_tb;
}
goto LABEL_trq;

LABEL_lp:
# s<651:A,m<1731:R,x>3723:R,R
if ( $s < 651 ) {
	say 'A';
	exit;
}
if ( $m < 1731 ) {
	say 'R';
	exit;
}
if ( $x > 3723 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_pb:
# a>2809:R,a<2785:R,x>2882:nrr,lxx
if ( $a > 2809 ) {
	say 'R';
	exit;
}
if ( $a < 2785 ) {
	say 'R';
	exit;
}
if ( $x > 2882 ) {
	goto LABEL_nrr;
}
goto LABEL_lxx;

LABEL_ndx:
# x>3705:pkl,m<2521:R,m<3214:R,xjr
if ( $x > 3705 ) {
	goto LABEL_pkl;
}
if ( $m < 2521 ) {
	say 'R';
	exit;
}
if ( $m < 3214 ) {
	say 'R';
	exit;
}
goto LABEL_xjr;

LABEL_khh:
# m>569:A,s>941:R,s<347:A,R
if ( $m > 569 ) {
	say 'A';
	exit;
}
if ( $s > 941 ) {
	say 'R';
	exit;
}
if ( $s < 347 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_xc:
# a>3210:A,m<987:R,s<1171:R,A
if ( $a > 3210 ) {
	say 'A';
	exit;
}
if ( $m < 987 ) {
	say 'R';
	exit;
}
if ( $s < 1171 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_vl:
# m<2436:R,m>2674:A,A
if ( $m < 2436 ) {
	say 'R';
	exit;
}
if ( $m > 2674 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_mbr:
# a<376:A,R
if ( $a < 376 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_ffv:
# x>1742:R,a<3619:A,s<529:R,A
if ( $x > 1742 ) {
	say 'R';
	exit;
}
if ( $a < 3619 ) {
	say 'A';
	exit;
}
if ( $s < 529 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_lvr:
# x>331:R,m>3324:klk,s<3015:A,sgg
if ( $x > 331 ) {
	say 'R';
	exit;
}
if ( $m > 3324 ) {
	goto LABEL_klk;
}
if ( $s < 3015 ) {
	say 'A';
	exit;
}
goto LABEL_sgg;

LABEL_sqp:
# s<3137:jqr,a>130:pgh,s<3505:A,frs
if ( $s < 3137 ) {
	goto LABEL_jqr;
}
if ( $a > 130 ) {
	goto LABEL_pgh;
}
if ( $s < 3505 ) {
	say 'A';
	exit;
}
goto LABEL_frs;

LABEL_lbd:
# a<2568:lsh,x<1405:A,ffs
if ( $a < 2568 ) {
	goto LABEL_lsh;
}
if ( $x < 1405 ) {
	say 'A';
	exit;
}
goto LABEL_ffs;

LABEL_qh:
# a>3400:gfn,nh
if ( $a > 3400 ) {
	goto LABEL_gfn;
}
goto LABEL_nh;

LABEL_xj:
# x>2810:A,m<1464:R,qt
if ( $x > 2810 ) {
	say 'A';
	exit;
}
if ( $m < 1464 ) {
	say 'R';
	exit;
}
goto LABEL_qt;

LABEL_jz:
# x>3349:R,x>2888:R,x>2581:R,R
if ( $x > 3349 ) {
	say 'R';
	exit;
}
if ( $x > 2888 ) {
	say 'R';
	exit;
}
if ( $x > 2581 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_jgd:
# s>3243:zzg,R
if ( $s > 3243 ) {
	goto LABEL_zzg;
}
say 'R';
exit;

LABEL_vbr:
# a<3686:R,R
if ( $a < 3686 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_hk:
# m>1142:R,m>991:A,A
if ( $m > 1142 ) {
	say 'R';
	exit;
}
if ( $m > 991 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_vx:
# a<1949:R,s>1360:A,kc
if ( $a < 1949 ) {
	say 'R';
	exit;
}
if ( $s > 1360 ) {
	say 'A';
	exit;
}
goto LABEL_kc;

LABEL_tnr:
# m<1182:A,x<2322:gp,a>3057:R,hr
if ( $m < 1182 ) {
	say 'A';
	exit;
}
if ( $x < 2322 ) {
	goto LABEL_gp;
}
if ( $a > 3057 ) {
	say 'R';
	exit;
}
goto LABEL_hr;

LABEL_ffs:
# m<1701:A,a>2635:R,A
if ( $m < 1701 ) {
	say 'A';
	exit;
}
if ( $a > 2635 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_klj:
# x<766:R,a<671:A,x>1199:R,A
if ( $x < 766 ) {
	say 'R';
	exit;
}
if ( $a < 671 ) {
	say 'A';
	exit;
}
if ( $x > 1199 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_zb:
# s>2131:ffr,x<2574:kdf,bd
if ( $s > 2131 ) {
	goto LABEL_ffr;
}
if ( $x < 2574 ) {
	goto LABEL_kdf;
}
goto LABEL_bd;

LABEL_jhg:
# m>629:gvv,A
if ( $m > 629 ) {
	goto LABEL_gvv;
}
say 'A';
exit;

LABEL_dj:
# m>789:A,a>3518:A,A
if ( $m > 789 ) {
	say 'A';
	exit;
}
if ( $a > 3518 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_krn:
# m>739:ntr,s>2564:bsz,hzs
if ( $m > 739 ) {
	goto LABEL_ntr;
}
if ( $s > 2564 ) {
	goto LABEL_bsz;
}
goto LABEL_hzs;

LABEL_cmk:
# a<3817:jf,s<378:A,R
if ( $a < 3817 ) {
	goto LABEL_jf;
}
if ( $s < 378 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_xq:
# a>813:A,a<773:svl,mz
if ( $a > 813 ) {
	say 'A';
	exit;
}
if ( $a < 773 ) {
	goto LABEL_svl;
}
goto LABEL_mz;

LABEL_mzq:
# s>3727:R,a>992:A,x<888:A,A
if ( $s > 3727 ) {
	say 'R';
	exit;
}
if ( $a > 992 ) {
	say 'A';
	exit;
}
if ( $x < 888 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_vqn:
# x>2380:R,R
if ( $x > 2380 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_mrf:
# x<3017:ksc,s<1043:rc,m<319:txc,kbk
if ( $x < 3017 ) {
	goto LABEL_ksc;
}
if ( $s < 1043 ) {
	goto LABEL_rc;
}
if ( $m < 319 ) {
	goto LABEL_txc;
}
goto LABEL_kbk;

LABEL_qd:
# x<859:R,a>3387:tx,A
if ( $x < 859 ) {
	say 'R';
	exit;
}
if ( $a > 3387 ) {
	goto LABEL_tx;
}
say 'A';
exit;

LABEL_cnx:
# a<3613:A,R
if ( $a < 3613 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_fgb:
# x>3100:R,R
if ( $x > 3100 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_zjq:
# s<306:R,x>1811:A,R
if ( $s < 306 ) {
	say 'R';
	exit;
}
if ( $x > 1811 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_qjv:
# s>1035:qf,tn
if ( $s > 1035 ) {
	goto LABEL_qf;
}
goto LABEL_tn;

LABEL_xg:
# s>2609:A,R
if ( $s > 2609 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_xv:
# x<1079:tjh,s<2851:xl,sgx
if ( $x < 1079 ) {
	goto LABEL_tjh;
}
if ( $s < 2851 ) {
	goto LABEL_xl;
}
goto LABEL_sgx;

LABEL_lzh:
# x<1978:ktb,m<937:A,A
if ( $x < 1978 ) {
	goto LABEL_ktb;
}
if ( $m < 937 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_smz:
# a>534:zdt,x<2415:mv,m<2096:sqn,sq
if ( $a > 534 ) {
	goto LABEL_zdt;
}
if ( $x < 2415 ) {
	goto LABEL_mv;
}
if ( $m < 2096 ) {
	goto LABEL_sqn;
}
goto LABEL_sq;

LABEL_lxb:
# m<1590:mnn,s>488:R,x<3338:bpr,R
if ( $m < 1590 ) {
	goto LABEL_mnn;
}
if ( $s > 488 ) {
	say 'R';
	exit;
}
if ( $x < 3338 ) {
	goto LABEL_bpr;
}
say 'R';
exit;

LABEL_szr:
# a>292:R,A
if ( $a > 292 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_nf:
# m>2081:R,a>3524:R,m>1915:R,A
if ( $m > 2081 ) {
	say 'R';
	exit;
}
if ( $a > 3524 ) {
	say 'R';
	exit;
}
if ( $m > 1915 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_zxh:
# x<743:A,A
if ( $x < 743 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_bjn:
# s>1703:xgx,m>502:jjx,a>3863:bx,R
if ( $s > 1703 ) {
	goto LABEL_xgx;
}
if ( $m > 502 ) {
	goto LABEL_jjx;
}
if ( $a > 3863 ) {
	goto LABEL_bx;
}
say 'R';
exit;

LABEL_ts:
# s<1467:A,A
if ( $s < 1467 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_zfb:
# a>904:fsj,a>768:R,m<871:qpq,zxh
if ( $a > 904 ) {
	goto LABEL_fsj;
}
if ( $a > 768 ) {
	say 'R';
	exit;
}
if ( $m < 871 ) {
	goto LABEL_qpq;
}
goto LABEL_zxh;

LABEL_tzl:
# m<2629:dlk,s>2581:R,m>3179:R,prb
if ( $m < 2629 ) {
	goto LABEL_dlk;
}
if ( $s > 2581 ) {
	say 'R';
	exit;
}
if ( $m > 3179 ) {
	say 'R';
	exit;
}
goto LABEL_prb;

LABEL_bzf:
# x>762:R,m<3473:R,R
if ( $x > 762 ) {
	say 'R';
	exit;
}
if ( $m < 3473 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_zm:
# x<3028:rzl,s>1458:dg,R
if ( $x < 3028 ) {
	goto LABEL_rzl;
}
if ( $s > 1458 ) {
	goto LABEL_dg;
}
say 'R';
exit;

LABEL_gmq:
# m>981:xg,x>3655:A,A
if ( $m > 981 ) {
	goto LABEL_xg;
}
if ( $x > 3655 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_lbn:
# s<2515:A,A
if ( $s < 2515 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_lh:
# a<504:A,a<885:A,A
if ( $a < 504 ) {
	say 'A';
	exit;
}
if ( $a < 885 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_nl:
# x<1314:R,a>3420:hzr,a<3349:dx,R
if ( $x < 1314 ) {
	say 'R';
	exit;
}
if ( $a > 3420 ) {
	goto LABEL_hzr;
}
if ( $a < 3349 ) {
	goto LABEL_dx;
}
say 'R';
exit;

LABEL_ksm:
# m<3204:R,A
if ( $m < 3204 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_rpz:
# a>3225:ds,x<1030:gm,A
if ( $a > 3225 ) {
	goto LABEL_ds;
}
if ( $x < 1030 ) {
	goto LABEL_gm;
}
say 'A';
exit;

LABEL_xb:
# s<1673:R,s>2816:R,a>1439:A,A
if ( $s < 1673 ) {
	say 'R';
	exit;
}
if ( $s > 2816 ) {
	say 'R';
	exit;
}
if ( $a > 1439 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_msc:
# x<3802:cc,hc
if ( $x < 3802 ) {
	goto LABEL_cc;
}
goto LABEL_hc;

LABEL_vk:
# s>374:R,a>3515:A,A
if ( $s > 374 ) {
	say 'R';
	exit;
}
if ( $a > 3515 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_md:
# x<3062:tq,s>2920:ks,gmq
if ( $x < 3062 ) {
	goto LABEL_tq;
}
if ( $s > 2920 ) {
	goto LABEL_ks;
}
goto LABEL_gmq;

LABEL_ntr:
# s>2551:A,jn
if ( $s > 2551 ) {
	say 'A';
	exit;
}
goto LABEL_jn;

LABEL_pl:
# a<2619:lt,m<1624:hgl,vmx
if ( $a < 2619 ) {
	goto LABEL_lt;
}
if ( $m < 1624 ) {
	goto LABEL_hgl;
}
goto LABEL_vmx;

LABEL_cv:
# s>3403:R,x>3119:R,a<3335:A,A
if ( $s > 3403 ) {
	say 'R';
	exit;
}
if ( $x > 3119 ) {
	say 'R';
	exit;
}
if ( $a < 3335 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_pc:
# a<3417:ptb,x<3314:vdk,s<2948:pv,R
if ( $a < 3417 ) {
	goto LABEL_ptb;
}
if ( $x < 3314 ) {
	goto LABEL_vdk;
}
if ( $s < 2948 ) {
	goto LABEL_pv;
}
say 'R';
exit;

LABEL_qhk:
# m>795:A,s>1386:R,x>1037:A,A
if ( $m > 795 ) {
	say 'A';
	exit;
}
if ( $s > 1386 ) {
	say 'R';
	exit;
}
if ( $x > 1037 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_sn:
# s<3526:R,a>1248:R,A
if ( $s < 3526 ) {
	say 'R';
	exit;
}
if ( $a > 1248 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_mm:
# s>3019:st,x<576:A,mzt
if ( $s > 3019 ) {
	goto LABEL_st;
}
if ( $x < 576 ) {
	say 'A';
	exit;
}
goto LABEL_mzt;

LABEL_dd:
# x<2832:A,x<2929:R,A
if ( $x < 2832 ) {
	say 'A';
	exit;
}
if ( $x < 2929 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_tqn:
# m<3439:A,s<964:R,A
if ( $m < 3439 ) {
	say 'A';
	exit;
}
if ( $s < 964 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_nkc:
# x<2397:R,A
if ( $x < 2397 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_cb:
# x<1584:gfj,a>3337:nb,R
if ( $x < 1584 ) {
	goto LABEL_gfj;
}
if ( $a > 3337 ) {
	goto LABEL_nb;
}
say 'R';
exit;

LABEL_bv:
# m<152:A,a<3361:R,m<260:R,A
if ( $m < 152 ) {
	say 'A';
	exit;
}
if ( $a < 3361 ) {
	say 'R';
	exit;
}
if ( $m < 260 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_qmm:
# m>2633:ljk,s<1313:A,fpr
if ( $m > 2633 ) {
	goto LABEL_ljk;
}
if ( $s < 1313 ) {
	say 'A';
	exit;
}
goto LABEL_fpr;

LABEL_sx:
# x<1719:chx,a>3124:qcm,m>770:R,A
if ( $x < 1719 ) {
	goto LABEL_chx;
}
if ( $a > 3124 ) {
	goto LABEL_qcm;
}
if ( $m > 770 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_tx:
# m<2136:R,m>2482:R,a<3464:R,R
if ( $m < 2136 ) {
	say 'R';
	exit;
}
if ( $m > 2482 ) {
	say 'R';
	exit;
}
if ( $a < 3464 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_pqb:
# s>462:jnh,xj
if ( $s > 462 ) {
	goto LABEL_jnh;
}
goto LABEL_xj;

LABEL_nzc:
# a>654:A,s>780:R,R
if ( $a > 654 ) {
	say 'A';
	exit;
}
if ( $s > 780 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_rx:
# s<2123:A,x>1457:A,R
if ( $s < 2123 ) {
	say 'A';
	exit;
}
if ( $x > 1457 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_sls:
# a>3386:R,s<1305:A,x>3157:kh,A
if ( $a > 3386 ) {
	say 'R';
	exit;
}
if ( $s < 1305 ) {
	say 'A';
	exit;
}
if ( $x > 3157 ) {
	goto LABEL_kh;
}
say 'A';
exit;

LABEL_fvr:
# m<3311:A,A
if ( $m < 3311 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_npd:
# x<2000:bfv,s>2894:qcz,a>981:tzl,xq
if ( $x < 2000 ) {
	goto LABEL_bfv;
}
if ( $s > 2894 ) {
	goto LABEL_qcz;
}
if ( $a > 981 ) {
	goto LABEL_tzl;
}
goto LABEL_xq;

LABEL_kf:
# x<3407:R,x<3652:A,R
if ( $x < 3407 ) {
	say 'R';
	exit;
}
if ( $x < 3652 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_ss:
# x>2893:R,x<2690:A,a>3086:R,kj
if ( $x > 2893 ) {
	say 'R';
	exit;
}
if ( $x < 2690 ) {
	say 'A';
	exit;
}
if ( $a > 3086 ) {
	say 'R';
	exit;
}
goto LABEL_kj;

LABEL_qk:
# a>1375:jz,x>2829:lq,a<1229:R,pm
if ( $a > 1375 ) {
	goto LABEL_jz;
}
if ( $x > 2829 ) {
	goto LABEL_lq;
}
if ( $a < 1229 ) {
	say 'R';
	exit;
}
goto LABEL_pm;

LABEL_fqr:
# s>3038:qtq,x<2313:qd,a<3435:rds,msz
if ( $s > 3038 ) {
	goto LABEL_qtq;
}
if ( $x < 2313 ) {
	goto LABEL_qd;
}
if ( $a < 3435 ) {
	goto LABEL_rds;
}
goto LABEL_msz;

LABEL_xd:
# x>2842:A,s>1412:R,m<3387:R,R
if ( $x > 2842 ) {
	say 'A';
	exit;
}
if ( $s > 1412 ) {
	say 'R';
	exit;
}
if ( $m < 3387 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_dg:
# x>3300:A,x<3173:A,A
if ( $x > 3300 ) {
	say 'A';
	exit;
}
if ( $x < 3173 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_mbz:
# x<1950:A,A
if ( $x < 1950 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_zj:
# s<1270:R,x>2952:A,x>2894:A,A
if ( $s < 1270 ) {
	say 'R';
	exit;
}
if ( $x > 2952 ) {
	say 'A';
	exit;
}
if ( $x > 2894 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_ztn:
# x<2399:vmm,a<666:zjj,btl
if ( $x < 2399 ) {
	goto LABEL_vmm;
}
if ( $a < 666 ) {
	goto LABEL_zjj;
}
goto LABEL_btl;

LABEL_dq:
# a>3833:R,m<1170:tp,x<323:R,cf
if ( $a > 3833 ) {
	say 'R';
	exit;
}
if ( $m < 1170 ) {
	goto LABEL_tp;
}
if ( $x < 323 ) {
	say 'R';
	exit;
}
goto LABEL_cf;

LABEL_kk:
# x>2848:plf,jmb
if ( $x > 2848 ) {
	goto LABEL_plf;
}
goto LABEL_jmb;

LABEL_cqc:
# m<1984:R,a<3746:R,m>2346:bbv,R
if ( $m < 1984 ) {
	say 'R';
	exit;
}
if ( $a < 3746 ) {
	say 'R';
	exit;
}
if ( $m > 2346 ) {
	goto LABEL_bbv;
}
say 'R';
exit;

LABEL_cvm:
# x<1361:A,x>1476:A,R
if ( $x < 1361 ) {
	say 'A';
	exit;
}
if ( $x > 1476 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_nmf:
# s<1827:sk,qqx
if ( $s < 1827 ) {
	goto LABEL_sk;
}
goto LABEL_qqx;

LABEL_vbc:
# a>517:ng,mnb
if ( $a > 517 ) {
	goto LABEL_ng;
}
goto LABEL_mnb;

LABEL_kg:
# s<1832:A,a<3398:A,R
if ( $s < 1832 ) {
	say 'A';
	exit;
}
if ( $a < 3398 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_trq:
# s<2938:A,R
if ( $s < 2938 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_nbr:
# s<3428:A,R
if ( $s < 3428 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_nb:
# s>1037:R,x>2105:A,s<410:A,R
if ( $s > 1037 ) {
	say 'R';
	exit;
}
if ( $x > 2105 ) {
	say 'A';
	exit;
}
if ( $s < 410 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_bzs:
# s>3439:klj,s>3231:A,hcn
if ( $s > 3439 ) {
	goto LABEL_klj;
}
if ( $s > 3231 ) {
	say 'A';
	exit;
}
goto LABEL_hcn;

LABEL_prb:
# m>2901:A,s<2356:A,m>2759:A,R
if ( $m > 2901 ) {
	say 'A';
	exit;
}
if ( $s < 2356 ) {
	say 'A';
	exit;
}
if ( $m > 2759 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_gz:
# a<3504:qn,qmv
if ( $a < 3504 ) {
	goto LABEL_qn;
}
goto LABEL_qmv;

LABEL_sf:
# x>3584:R,a>673:drv,a>384:A,A
if ( $x > 3584 ) {
	say 'R';
	exit;
}
if ( $a > 673 ) {
	goto LABEL_drv;
}
if ( $a > 384 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_sh:
# m>1711:A,A
if ( $m > 1711 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_hr:
# x<3120:A,m>1725:R,s<2538:R,A
if ( $x < 3120 ) {
	say 'A';
	exit;
}
if ( $m > 1725 ) {
	say 'R';
	exit;
}
if ( $s < 2538 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_mlz:
# x>1121:A,R
if ( $x > 1121 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_zr:
# x>2228:ff,A
if ( $x > 2228 ) {
	goto LABEL_ff;
}
say 'A';
exit;

LABEL_bvx:
# m<3203:A,R
if ( $m < 3203 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_dtq:
# x>669:lsk,A
if ( $x > 669 ) {
	goto LABEL_lsk;
}
say 'A';
exit;

LABEL_jf:
# s<434:R,x>2922:R,m<2086:R,R
if ( $s < 434 ) {
	say 'R';
	exit;
}
if ( $x > 2922 ) {
	say 'R';
	exit;
}
if ( $m < 2086 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_ff:
# a<2720:R,s>3716:A,s>3513:R,R
if ( $a < 2720 ) {
	say 'R';
	exit;
}
if ( $s > 3716 ) {
	say 'A';
	exit;
}
if ( $s > 3513 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_mhh:
# s<731:prf,kgj
if ( $s < 731 ) {
	goto LABEL_prf;
}
goto LABEL_kgj;

LABEL_ljt:
# a>3420:A,s<1675:A,A
if ( $a > 3420 ) {
	say 'A';
	exit;
}
if ( $s < 1675 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_ktb:
# a>3433:R,a>3412:A,R
if ( $a > 3433 ) {
	say 'R';
	exit;
}
if ( $a > 3412 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_mzl:
# m>2308:sz,x>505:vhg,m<1383:A,A
if ( $m > 2308 ) {
	goto LABEL_sz;
}
if ( $x > 505 ) {
	goto LABEL_vhg;
}
if ( $m < 1383 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_pt:
# m<3534:jct,x>1132:R,a<3434:A,A
if ( $m < 3534 ) {
	goto LABEL_jct;
}
if ( $x > 1132 ) {
	say 'R';
	exit;
}
if ( $a < 3434 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_pxs:
# a<888:jc,x<1590:R,s>630:A,R
if ( $a < 888 ) {
	goto LABEL_jc;
}
if ( $x < 1590 ) {
	say 'R';
	exit;
}
if ( $s > 630 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_fxd:
# x>1746:R,s>2931:A,x<1473:A,R
if ( $x > 1746 ) {
	say 'R';
	exit;
}
if ( $s > 2931 ) {
	say 'A';
	exit;
}
if ( $x < 1473 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_vz:
# m>1081:A,m<520:A,s<1514:R,R
if ( $m > 1081 ) {
	say 'A';
	exit;
}
if ( $m < 520 ) {
	say 'A';
	exit;
}
if ( $s < 1514 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_pqg:
# m<341:R,a>492:R,m<513:A,R
if ( $m < 341 ) {
	say 'R';
	exit;
}
if ( $a > 492 ) {
	say 'R';
	exit;
}
if ( $m < 513 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_jqr:
# s<2665:A,A
if ( $s < 2665 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_mdq:
# m>1424:R,a<497:ngp,A
if ( $m > 1424 ) {
	say 'R';
	exit;
}
if ( $a < 497 ) {
	goto LABEL_ngp;
}
say 'A';
exit;

LABEL_fdn:
# s<506:rfj,s<789:qrg,A
if ( $s < 506 ) {
	goto LABEL_rfj;
}
if ( $s < 789 ) {
	goto LABEL_qrg;
}
say 'A';
exit;

LABEL_dmm:
# m<274:A,A
if ( $m < 274 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_fsx:
# m<1699:R,x<1215:lh,m>1802:R,lbn
if ( $m < 1699 ) {
	say 'R';
	exit;
}
if ( $x < 1215 ) {
	goto LABEL_lh;
}
if ( $m > 1802 ) {
	say 'R';
	exit;
}
goto LABEL_lbn;

LABEL_lc:
# x>842:bs,x<785:mmg,A
if ( $x > 842 ) {
	goto LABEL_bs;
}
if ( $x < 785 ) {
	goto LABEL_mmg;
}
say 'A';
exit;

LABEL_jx:
# x>2421:R,a>3815:R,A
if ( $x > 2421 ) {
	say 'R';
	exit;
}
if ( $a > 3815 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_lq:
# s>817:A,R
if ( $s > 817 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_qlj:
# a>904:A,R
if ( $a > 904 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_qrg:
# a>896:R,R
if ( $a > 896 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_tcz:
# s>648:sf,ndx
if ( $s > 648 ) {
	goto LABEL_sf;
}
goto LABEL_ndx;

LABEL_jjp:
# s>1084:R,A
if ( $s > 1084 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_hp:
# x<1315:nbq,s>596:cqc,m>2358:cnx,qns
if ( $x < 1315 ) {
	goto LABEL_nbq;
}
if ( $s > 596 ) {
	goto LABEL_cqc;
}
if ( $m > 2358 ) {
	goto LABEL_cnx;
}
goto LABEL_qns;

LABEL_lm:
# a<1592:R,s<2691:A,x<2735:A,R
if ( $a < 1592 ) {
	say 'R';
	exit;
}
if ( $s < 2691 ) {
	say 'A';
	exit;
}
if ( $x < 2735 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_rdr:
# x>1537:zmh,m>3053:dpb,qxp
if ( $x > 1537 ) {
	goto LABEL_zmh;
}
if ( $m > 3053 ) {
	goto LABEL_dpb;
}
goto LABEL_qxp;

LABEL_vbg:
# x<2936:nzq,m>2444:nmb,x>3372:dl,fgb
if ( $x < 2936 ) {
	goto LABEL_nzq;
}
if ( $m > 2444 ) {
	goto LABEL_nmb;
}
if ( $x > 3372 ) {
	goto LABEL_dl;
}
goto LABEL_fgb;

LABEL_xp:
# a<3416:A,tz
if ( $a < 3416 ) {
	say 'A';
	exit;
}
goto LABEL_tz;

LABEL_pgh:
# x<1953:R,a<271:A,R
if ( $x < 1953 ) {
	say 'R';
	exit;
}
if ( $a < 271 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_rvv:
# s<3490:A,A
if ( $s < 3490 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_zdt:
# a<879:csn,a>1039:R,A
if ( $a < 879 ) {
	goto LABEL_csn;
}
if ( $a > 1039 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_mx:
# s<602:kpq,nzc
if ( $s < 602 ) {
	goto LABEL_kpq;
}
goto LABEL_nzc;

LABEL_bq:
# m>3798:R,s>401:zpf,lsf
if ( $m > 3798 ) {
	say 'R';
	exit;
}
if ( $s > 401 ) {
	goto LABEL_zpf;
}
goto LABEL_lsf;

LABEL_tr:
# a>1619:A,x<1673:R,s>1749:A,R
if ( $a > 1619 ) {
	say 'A';
	exit;
}
if ( $x < 1673 ) {
	say 'R';
	exit;
}
if ( $s > 1749 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_zzg:
# s>3380:A,R
if ( $s > 3380 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_cgx:
# m<528:A,m>1173:R,x<1284:dj,A
if ( $m < 528 ) {
	say 'A';
	exit;
}
if ( $m > 1173 ) {
	say 'R';
	exit;
}
if ( $x < 1284 ) {
	goto LABEL_dj;
}
say 'A';
exit;

LABEL_qxp:
# x>765:A,x>393:A,R
if ( $x > 765 ) {
	say 'A';
	exit;
}
if ( $x > 393 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_nc:
# a>3563:A,s>1570:R,khh
if ( $a > 3563 ) {
	say 'A';
	exit;
}
if ( $s > 1570 ) {
	say 'R';
	exit;
}
goto LABEL_khh;

LABEL_tbc:
# x>353:gqg,nbr
if ( $x > 353 ) {
	goto LABEL_gqg;
}
goto LABEL_nbr;

LABEL_njp:
# a>351:R,m>2453:ktc,x>2811:R,dht
if ( $a > 351 ) {
	say 'R';
	exit;
}
if ( $m > 2453 ) {
	goto LABEL_ktc;
}
if ( $x > 2811 ) {
	say 'R';
	exit;
}
goto LABEL_dht;

LABEL_ds:
# x>883:A,A
if ( $x > 883 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_lfc:
# x>1832:R,s>3439:A,s>3169:R,R
if ( $x > 1832 ) {
	say 'R';
	exit;
}
if ( $s > 3439 ) {
	say 'A';
	exit;
}
if ( $s > 3169 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_mt:
# m>1399:R,m>763:A,A
if ( $m > 1399 ) {
	say 'R';
	exit;
}
if ( $m > 763 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_vbt:
# s<3558:A,x<594:R,R
if ( $s < 3558 ) {
	say 'A';
	exit;
}
if ( $x < 594 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_fg:
# m>3746:R,a>2323:A,A
if ( $m > 3746 ) {
	say 'R';
	exit;
}
if ( $a > 2323 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_ctp:
# m>2809:R,m<2504:R,a<1765:R,R
if ( $m > 2809 ) {
	say 'R';
	exit;
}
if ( $m < 2504 ) {
	say 'R';
	exit;
}
if ( $a < 1765 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_vv:
# m>2151:R,A
if ( $m > 2151 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_rh:
# s>3304:R,s<3095:A,m<140:R,A
if ( $s > 3304 ) {
	say 'R';
	exit;
}
if ( $s < 3095 ) {
	say 'A';
	exit;
}
if ( $m < 140 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_kdf:
# a<2917:mp,xsq
if ( $a < 2917 ) {
	goto LABEL_mp;
}
goto LABEL_xsq;

LABEL_qn:
# x<1183:R,a<3486:A,a>3496:R,A
if ( $x < 1183 ) {
	say 'R';
	exit;
}
if ( $a < 3486 ) {
	say 'A';
	exit;
}
if ( $a > 3496 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_tz:
# x<3141:R,m>1397:R,s>937:A,R
if ( $x < 3141 ) {
	say 'R';
	exit;
}
if ( $m > 1397 ) {
	say 'R';
	exit;
}
if ( $s > 937 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_nls:
# m<2817:R,R
if ( $m < 2817 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_xjl:
# s<1978:R,x>939:A,R
if ( $s < 1978 ) {
	say 'R';
	exit;
}
if ( $x > 939 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_lnz:
# s>3386:mlz,x<1526:vd,m>864:A,A
if ( $s > 3386 ) {
	goto LABEL_mlz;
}
if ( $x < 1526 ) {
	goto LABEL_vd;
}
if ( $m > 864 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_mn:
# x>1476:td,x>743:pt,lvr
if ( $x > 1476 ) {
	goto LABEL_td;
}
if ( $x > 743 ) {
	goto LABEL_pt;
}
goto LABEL_lvr;

LABEL_hlm:
# x>3684:A,s>1106:R,m>1014:A,R
if ( $x > 3684 ) {
	say 'A';
	exit;
}
if ( $s > 1106 ) {
	say 'R';
	exit;
}
if ( $m > 1014 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_mtg:
# m>565:zh,x<3078:R,rt
if ( $m > 565 ) {
	goto LABEL_zh;
}
if ( $x < 3078 ) {
	say 'R';
	exit;
}
goto LABEL_rt;

LABEL_hcn:
# m<3119:R,m>3624:A,A
if ( $m < 3119 ) {
	say 'R';
	exit;
}
if ( $m > 3624 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_hzs:
# x<1009:R,s<2420:A,a>616:ctl,R
if ( $x < 1009 ) {
	say 'R';
	exit;
}
if ( $s < 2420 ) {
	say 'A';
	exit;
}
if ( $a > 616 ) {
	goto LABEL_ctl;
}
say 'R';
exit;

LABEL_rmc:
# m<3127:A,x>3366:R,A
if ( $m < 3127 ) {
	say 'A';
	exit;
}
if ( $x > 3366 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_hzd:
# m>3173:R,m>2552:qlj,kf
if ( $m > 3173 ) {
	say 'R';
	exit;
}
if ( $m > 2552 ) {
	goto LABEL_qlj;
}
goto LABEL_kf;

LABEL_jbc:
# x<1179:A,m<647:A,a>3418:A,A
if ( $x < 1179 ) {
	say 'A';
	exit;
}
if ( $m < 647 ) {
	say 'A';
	exit;
}
if ( $a > 3418 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_nvr:
# m<1005:sls,a<3380:zm,m>1305:xp,jvd
if ( $m < 1005 ) {
	goto LABEL_sls;
}
if ( $a < 3380 ) {
	goto LABEL_zm;
}
if ( $m > 1305 ) {
	goto LABEL_xp;
}
goto LABEL_jvd;

LABEL_fpr:
# m<1187:A,a<472:A,a>860:A,A
if ( $m < 1187 ) {
	say 'A';
	exit;
}
if ( $a < 472 ) {
	say 'A';
	exit;
}
if ( $a > 860 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_df:
# s>2631:A,A
if ( $s > 2631 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_gqg:
# a>232:R,R
if ( $a > 232 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_qns:
# m>1809:nf,a>3526:zjq,m<1690:msm,R
if ( $m > 1809 ) {
	goto LABEL_nf;
}
if ( $a > 3526 ) {
	goto LABEL_zjq;
}
if ( $m < 1690 ) {
	goto LABEL_msm;
}
say 'R';
exit;

LABEL_cp:
# m<755:A,a<1604:R,a<2017:R,A
if ( $m < 755 ) {
	say 'A';
	exit;
}
if ( $a < 1604 ) {
	say 'R';
	exit;
}
if ( $a < 2017 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_qmv:
# x<846:A,R
if ( $x < 846 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_bc:
# m>889:R,s<1465:R,hvg
if ( $m > 889 ) {
	say 'R';
	exit;
}
if ( $s < 1465 ) {
	say 'R';
	exit;
}
goto LABEL_hvg;

LABEL_ht:
# a>685:pxs,vc
if ( $a > 685 ) {
	goto LABEL_pxs;
}
goto LABEL_vc;

LABEL_hpt:
# x<2157:dbc,a<3716:vk,s>281:A,A
if ( $x < 2157 ) {
	goto LABEL_dbc;
}
if ( $a < 3716 ) {
	goto LABEL_vk;
}
if ( $s > 281 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_xrh:
# x>3051:ld,x<2974:A,s<625:R,R
if ( $x > 3051 ) {
	goto LABEL_ld;
}
if ( $x < 2974 ) {
	say 'A';
	exit;
}
if ( $s < 625 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_tp:
# s<1858:A,A
if ( $s < 1858 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_tcx:
# s<3127:R,x<705:A,m<1138:A,A
if ( $s < 3127 ) {
	say 'R';
	exit;
}
if ( $x < 705 ) {
	say 'A';
	exit;
}
if ( $m < 1138 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_vmx:
# x<2184:A,a>2696:zx,a<2659:A,R
if ( $x < 2184 ) {
	say 'A';
	exit;
}
if ( $a > 2696 ) {
	goto LABEL_zx;
}
if ( $a < 2659 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_mg:
# m>2756:R,A
if ( $m > 2756 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_zh:
# a<3910:R,A
if ( $a < 3910 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_kbk:
# m>444:A,s<1576:R,m>387:dz,kfx
if ( $m > 444 ) {
	say 'A';
	exit;
}
if ( $s < 1576 ) {
	say 'R';
	exit;
}
if ( $m > 387 ) {
	goto LABEL_dz;
}
goto LABEL_kfx;

LABEL_nzq:
# a<2309:R,nkc
if ( $a < 2309 ) {
	say 'R';
	exit;
}
goto LABEL_nkc;

LABEL_pm:
# a<1302:A,A
if ( $a < 1302 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_gfj:
# s>1127:A,m>840:R,m>406:A,A
if ( $s > 1127 ) {
	say 'A';
	exit;
}
if ( $m > 840 ) {
	say 'R';
	exit;
}
if ( $m > 406 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_pq:
# s>2315:prd,x>3516:msc,m>638:nvr,mrf
if ( $s > 2315 ) {
	goto LABEL_prd;
}
if ( $x > 3516 ) {
	goto LABEL_msc;
}
if ( $m > 638 ) {
	goto LABEL_nvr;
}
goto LABEL_mrf;

LABEL_vg:
# a>92:A,A
if ( $a > 92 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_lsk:
# x>883:A,R
if ( $x > 883 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_xjr:
# m>3705:A,m<3445:A,A
if ( $m > 3705 ) {
	say 'A';
	exit;
}
if ( $m < 3445 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_mdp:
# s>2716:R,m>2326:A,R
if ( $s > 2716 ) {
	say 'R';
	exit;
}
if ( $m > 2326 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_ng:
# a<902:bzs,s>3611:jkr,m>3139:bzf,mxr
if ( $a < 902 ) {
	goto LABEL_bzs;
}
if ( $s > 3611 ) {
	goto LABEL_jkr;
}
if ( $m > 3139 ) {
	goto LABEL_bzf;
}
goto LABEL_mxr;

LABEL_mkc:
# a>3147:kb,ss
if ( $a > 3147 ) {
	goto LABEL_kb;
}
goto LABEL_ss;

LABEL_vn:
# x>1404:A,m>2663:nls,s>2069:A,A
if ( $x > 1404 ) {
	say 'A';
	exit;
}
if ( $m > 2663 ) {
	goto LABEL_nls;
}
if ( $s > 2069 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_mnb:
# x<657:tbc,x<1083:hzn,x<1315:rvv,bvx
if ( $x < 657 ) {
	goto LABEL_tbc;
}
if ( $x < 1083 ) {
	goto LABEL_hzn;
}
if ( $x < 1315 ) {
	goto LABEL_rvv;
}
goto LABEL_bvx;

LABEL_gr:
# a<2816:A,gvp
if ( $a < 2816 ) {
	say 'A';
	exit;
}
goto LABEL_gvp;

LABEL_kpt:
# x<2223:R,x>2355:R,m>826:A,R
if ( $x < 2223 ) {
	say 'R';
	exit;
}
if ( $x > 2355 ) {
	say 'R';
	exit;
}
if ( $m > 826 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_kq:
# m<686:A,x<1726:A,A
if ( $m < 686 ) {
	say 'A';
	exit;
}
if ( $x < 1726 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_krq:
# a>3559:R,A
if ( $a > 3559 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_vrc:
# x>1988:kpt,x<1867:kq,A
if ( $x > 1988 ) {
	goto LABEL_kpt;
}
if ( $x < 1867 ) {
	goto LABEL_kq;
}
say 'A';
exit;

LABEL_lr:
# a>877:R,a<672:R,s<1840:A,R
if ( $a > 877 ) {
	say 'R';
	exit;
}
if ( $a < 672 ) {
	say 'R';
	exit;
}
if ( $s < 1840 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_kpq:
# x<2274:A,m<1226:A,R
if ( $x < 2274 ) {
	say 'A';
	exit;
}
if ( $m < 1226 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_lz:
# m>410:A,s<3265:R,A
if ( $m > 410 ) {
	say 'A';
	exit;
}
if ( $s < 3265 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_gq:
# s<734:A,A
if ( $s < 734 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_kgj:
# s<940:R,R
if ( $s < 940 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_jzf:
# a<494:szr,dxx
if ( $a < 494 ) {
	goto LABEL_szr;
}
goto LABEL_dxx;

LABEL_dxl:
# a<240:A,s<3664:R,a>393:A,R
if ( $a < 240 ) {
	say 'A';
	exit;
}
if ( $s < 3664 ) {
	say 'R';
	exit;
}
if ( $a > 393 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_kj:
# m>1586:A,s<1432:A,A
if ( $m > 1586 ) {
	say 'A';
	exit;
}
if ( $s < 1432 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_zv:
# s<2784:R,m<3845:A,R
if ( $s < 2784 ) {
	say 'R';
	exit;
}
if ( $m < 3845 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_mmc:
# m<489:A,x>800:cp,x<492:A,lv
if ( $m < 489 ) {
	say 'A';
	exit;
}
if ( $x > 800 ) {
	goto LABEL_cp;
}
if ( $x < 492 ) {
	say 'A';
	exit;
}
goto LABEL_lv;

LABEL_rfj:
# x<2731:R,a<932:R,R
if ( $x < 2731 ) {
	say 'R';
	exit;
}
if ( $a < 932 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_gt:
# a>535:A,m>2660:R,dxl
if ( $a > 535 ) {
	say 'A';
	exit;
}
if ( $m > 2660 ) {
	say 'R';
	exit;
}
goto LABEL_dxl;

LABEL_xz:
# s<919:A,a>3375:R,a<3323:R,R
if ( $s < 919 ) {
	say 'A';
	exit;
}
if ( $a > 3375 ) {
	say 'R';
	exit;
}
if ( $a < 3323 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_msm:
# x<1902:A,x>2051:R,R
if ( $x < 1902 ) {
	say 'A';
	exit;
}
if ( $x > 2051 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_kv:
# x<3257:mdp,pz
if ( $x < 3257 ) {
	goto LABEL_mdp;
}
goto LABEL_pz;

LABEL_hc:
# m<981:R,m>1233:vcc,A
if ( $m < 981 ) {
	say 'R';
	exit;
}
if ( $m > 1233 ) {
	goto LABEL_vcc;
}
say 'A';
exit;

LABEL_svl:
# m>2596:R,m<1427:A,s<2457:R,R
if ( $m > 2596 ) {
	say 'R';
	exit;
}
if ( $m < 1427 ) {
	say 'A';
	exit;
}
if ( $s < 2457 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_jbk:
# x>2665:R,fdg
if ( $x > 2665 ) {
	say 'R';
	exit;
}
goto LABEL_fdg;

LABEL_mnn:
# x>3181:R,a<2055:R,R
if ( $x > 3181 ) {
	say 'R';
	exit;
}
if ( $a < 2055 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_pp:
# s>379:R,prn
if ( $s > 379 ) {
	say 'R';
	exit;
}
goto LABEL_prn;

LABEL_zd:
# s>838:qjv,vj
if ( $s > 838 ) {
	goto LABEL_qjv;
}
goto LABEL_vj;

LABEL_bqk:
# a<659:A,R
if ( $a < 659 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_lxx:
# s>1514:R,s<1107:R,A
if ( $s > 1514 ) {
	say 'R';
	exit;
}
if ( $s < 1107 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_rr:
# m>917:A,A
if ( $m > 917 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_qb:
# m<866:A,x<3264:A,A
if ( $m < 866 ) {
	say 'A';
	exit;
}
if ( $x < 3264 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_gpz:
# m<586:A,x<2959:vbr,psk
if ( $m < 586 ) {
	say 'A';
	exit;
}
if ( $x < 2959 ) {
	goto LABEL_vbr;
}
goto LABEL_psk;

LABEL_nmb:
# m<3444:R,x<3463:gxq,fg
if ( $m < 3444 ) {
	say 'R';
	exit;
}
if ( $x < 3463 ) {
	goto LABEL_gxq;
}
goto LABEL_fg;

LABEL_dh:
# s>1463:R,m<1939:R,x<2802:A,R
if ( $s > 1463 ) {
	say 'R';
	exit;
}
if ( $m < 1939 ) {
	say 'R';
	exit;
}
if ( $x < 2802 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_dl:
# x>3628:ms,a<2300:R,m>972:R,rb
if ( $x > 3628 ) {
	goto LABEL_ms;
}
if ( $a < 2300 ) {
	say 'R';
	exit;
}
if ( $m > 972 ) {
	say 'R';
	exit;
}
goto LABEL_rb;

LABEL_qqk:
# a>342:sm,m<1336:vrc,m>3048:sqp,xgf
if ( $a > 342 ) {
	goto LABEL_sm;
}
if ( $m < 1336 ) {
	goto LABEL_vrc;
}
if ( $m > 3048 ) {
	goto LABEL_sqp;
}
goto LABEL_xgf;

LABEL_hl:
# a<1602:qk,hb
if ( $a < 1602 ) {
	goto LABEL_qk;
}
goto LABEL_hb;

LABEL_bx:
# x>1180:R,x>778:A,a>3924:R,A
if ( $x > 1180 ) {
	say 'R';
	exit;
}
if ( $x > 778 ) {
	say 'A';
	exit;
}
if ( $a > 3924 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_zmh:
# a>426:A,a>282:A,s>1983:R,R
if ( $a > 426 ) {
	say 'A';
	exit;
}
if ( $a > 282 ) {
	say 'A';
	exit;
}
if ( $s > 1983 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_zjp:
# s<2722:R,a<528:R,A
if ( $s < 2722 ) {
	say 'R';
	exit;
}
if ( $a < 528 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_tpx:
# m>3219:R,m<2950:A,a<1253:R,R
if ( $m > 3219 ) {
	say 'R';
	exit;
}
if ( $m < 2950 ) {
	say 'A';
	exit;
}
if ( $a < 1253 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_klk:
# m>3694:A,x<183:R,A
if ( $m > 3694 ) {
	say 'A';
	exit;
}
if ( $x < 183 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_rz:
# a<3506:lnz,cgx
if ( $a < 3506 ) {
	goto LABEL_lnz;
}
goto LABEL_cgx;

LABEL_bl:
# s<1061:A,R
if ( $s < 1061 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_rzl:
# x>2887:A,s<1195:A,a>3315:A,R
if ( $x > 2887 ) {
	say 'A';
	exit;
}
if ( $s < 1195 ) {
	say 'A';
	exit;
}
if ( $a > 3315 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_gjm:
# s>1424:A,R
if ( $s > 1424 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_qvp:
# m<250:R,x<3365:cv,lz
if ( $m < 250 ) {
	say 'R';
	exit;
}
if ( $x < 3365 ) {
	goto LABEL_cv;
}
goto LABEL_lz;

LABEL_ll:
# m>1291:km,x>1101:R,tcx
if ( $m > 1291 ) {
	goto LABEL_km;
}
if ( $x > 1101 ) {
	say 'R';
	exit;
}
goto LABEL_tcx;

LABEL_zdd:
# x>950:A,s<3747:R,s>3895:R,R
if ( $x > 950 ) {
	say 'A';
	exit;
}
if ( $s < 3747 ) {
	say 'R';
	exit;
}
if ( $s > 3895 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_pk:
# s>2497:R,A
if ( $s > 2497 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_jbq:
# a>150:R,x<1869:A,s>3035:A,A
if ( $a > 150 ) {
	say 'R';
	exit;
}
if ( $x < 1869 ) {
	say 'A';
	exit;
}
if ( $s > 3035 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_jbg:
# m>1413:fpl,m>832:bgs,jxk
if ( $m > 1413 ) {
	goto LABEL_fpl;
}
if ( $m > 832 ) {
	goto LABEL_bgs;
}
goto LABEL_jxk;

LABEL_xsq:
# a<3129:qq,m<1811:bj,rpz
if ( $a < 3129 ) {
	goto LABEL_qq;
}
if ( $m < 1811 ) {
	goto LABEL_bj;
}
goto LABEL_rpz;

LABEL_bk:
# m<801:R,s<1388:R,x>3521:A,A
if ( $m < 801 ) {
	say 'R';
	exit;
}
if ( $s < 1388 ) {
	say 'R';
	exit;
}
if ( $x > 3521 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_vh:
# m>1098:R,qb
if ( $m > 1098 ) {
	say 'R';
	exit;
}
goto LABEL_qb;

LABEL_cf:
# x>588:R,m<1337:A,x>456:R,R
if ( $x > 588 ) {
	say 'R';
	exit;
}
if ( $m < 1337 ) {
	say 'A';
	exit;
}
if ( $x > 456 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_cm:
# x<3470:R,a<767:R,a<841:R,R
if ( $x < 3470 ) {
	say 'R';
	exit;
}
if ( $a < 767 ) {
	say 'R';
	exit;
}
if ( $a < 841 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_hgl:
# a<2694:A,x>2481:fzb,s<2721:nvl,R
if ( $a < 2694 ) {
	say 'A';
	exit;
}
if ( $x > 2481 ) {
	goto LABEL_fzb;
}
if ( $s < 2721 ) {
	goto LABEL_nvl;
}
say 'R';
exit;

LABEL_ln:
# s>1320:R,s>587:R,A
if ( $s > 1320 ) {
	say 'R';
	exit;
}
if ( $s > 587 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_fxr:
# x>2433:R,a<402:R,x>2425:R,R
if ( $x > 2433 ) {
	say 'R';
	exit;
}
if ( $a < 402 ) {
	say 'R';
	exit;
}
if ( $x > 2425 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_jxk:
# x>2962:A,A
if ( $x > 2962 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_hjx:
# a<1824:A,a>2071:R,A
if ( $a < 1824 ) {
	say 'A';
	exit;
}
if ( $a > 2071 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_ph:
# s>1228:R,x<3787:lp,m<1465:gq,tv
if ( $s > 1228 ) {
	say 'R';
	exit;
}
if ( $x < 3787 ) {
	goto LABEL_lp;
}
if ( $m < 1465 ) {
	goto LABEL_gq;
}
goto LABEL_tv;

LABEL_gqt:
# m>3165:gjm,x>1383:xb,m>2542:R,pbs
if ( $m > 3165 ) {
	goto LABEL_gjm;
}
if ( $x > 1383 ) {
	goto LABEL_xb;
}
if ( $m > 2542 ) {
	say 'R';
	exit;
}
goto LABEL_pbs;

LABEL_dht:
# a>227:A,A
if ( $a > 227 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_txc:
# x<3296:bv,x<3371:xr,kg
if ( $x < 3296 ) {
	goto LABEL_bv;
}
if ( $x < 3371 ) {
	goto LABEL_xr;
}
goto LABEL_kg;

LABEL_prd:
# a>3385:pc,m<586:qvp,vh
if ( $a > 3385 ) {
	goto LABEL_pc;
}
if ( $m < 586 ) {
	goto LABEL_qvp;
}
goto LABEL_vh;

LABEL_lv:
# s<2096:R,s>3093:R,a<1943:R,A
if ( $s < 2096 ) {
	say 'R';
	exit;
}
if ( $s > 3093 ) {
	say 'R';
	exit;
}
if ( $a < 1943 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_in:
# a>2381:lqg,kt
if ( $a > 2381 ) {
	goto LABEL_lqg;
}
goto LABEL_kt;

LABEL_nnc:
# x<768:R,a<909:A,R
if ( $x < 768 ) {
	say 'R';
	exit;
}
if ( $a < 909 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_jck:
# x>3539:R,A
if ( $x > 3539 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_kmr:
# a<534:A,x>695:R,a>784:A,R
if ( $a < 534 ) {
	say 'A';
	exit;
}
if ( $x > 695 ) {
	say 'R';
	exit;
}
if ( $a > 784 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_km:
# x<1307:A,R
if ( $x < 1307 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_lnb:
# x<1064:btd,ht
if ( $x < 1064 ) {
	goto LABEL_btd;
}
goto LABEL_ht;

LABEL_fvf:
# x<1348:R,a>622:R,np
if ( $x < 1348 ) {
	say 'R';
	exit;
}
if ( $a > 622 ) {
	say 'R';
	exit;
}
goto LABEL_np;

LABEL_nt:
# s<3461:R,s>3804:A,A
if ( $s < 3461 ) {
	say 'R';
	exit;
}
if ( $s > 3804 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_rnf:
# m<3315:A,m>3648:R,R
if ( $m < 3315 ) {
	say 'A';
	exit;
}
if ( $m > 3648 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_rbp:
# m>1386:dh,x<2829:A,a<2063:xbm,bk
if ( $m > 1386 ) {
	goto LABEL_dh;
}
if ( $x < 2829 ) {
	say 'A';
	exit;
}
if ( $a < 2063 ) {
	goto LABEL_xbm;
}
goto LABEL_bk;

LABEL_mh:
# a<3931:A,a<3977:A,R
if ( $a < 3931 ) {
	say 'A';
	exit;
}
if ( $a < 3977 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_gxx:
# s>2790:A,m>3143:R,A
if ( $s > 2790 ) {
	say 'A';
	exit;
}
if ( $m > 3143 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_mdd:
# a>3604:jhm,a>3476:lf,x<2639:qh,pq
if ( $a > 3604 ) {
	goto LABEL_jhm;
}
if ( $a > 3476 ) {
	goto LABEL_lf;
}
if ( $x < 2639 ) {
	goto LABEL_qh;
}
goto LABEL_pq;

LABEL_vnz:
# a>3562:gh,m<899:tc,ll
if ( $a > 3562 ) {
	goto LABEL_gh;
}
if ( $m < 899 ) {
	goto LABEL_tc;
}
goto LABEL_ll;

LABEL_hdq:
# s<2919:A,R
if ( $s < 2919 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_czc:
# a<3340:R,A
if ( $a < 3340 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_hsz:
# s>1716:R,m<3459:R,R
if ( $s > 1716 ) {
	say 'R';
	exit;
}
if ( $m < 3459 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_sk:
# m<1435:A,m>1514:A,A
if ( $m < 1435 ) {
	say 'A';
	exit;
}
if ( $m > 1514 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_rlm:
# s>2276:A,x<3215:R,A
if ( $s > 2276 ) {
	say 'A';
	exit;
}
if ( $x < 3215 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_fm:
# s<3035:A,a<721:A,A
if ( $s < 3035 ) {
	say 'A';
	exit;
}
if ( $a < 721 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_qc:
# x>1032:R,s>3491:A,x<472:R,R
if ( $x > 1032 ) {
	say 'R';
	exit;
}
if ( $s > 3491 ) {
	say 'A';
	exit;
}
if ( $x < 472 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_ks:
# m>878:hxf,a>3523:xkl,m<331:rh,R
if ( $m > 878 ) {
	goto LABEL_hxf;
}
if ( $a > 3523 ) {
	goto LABEL_xkl;
}
if ( $m < 331 ) {
	goto LABEL_rh;
}
say 'R';
exit;

LABEL_pbs:
# a<1399:A,x>611:R,R
if ( $a < 1399 ) {
	say 'A';
	exit;
}
if ( $x > 611 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_pz:
# s>2498:zns,x>3535:R,m>2357:qzt,R
if ( $s > 2498 ) {
	goto LABEL_zns;
}
if ( $x > 3535 ) {
	say 'R';
	exit;
}
if ( $m > 2357 ) {
	goto LABEL_qzt;
}
say 'R';
exit;

LABEL_kn:
# a<2476:R,a>2568:A,R
if ( $a < 2476 ) {
	say 'R';
	exit;
}
if ( $a > 2568 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_jjx:
# s<1082:A,x>1394:R,a<3796:R,A
if ( $s < 1082 ) {
	say 'A';
	exit;
}
if ( $x > 1394 ) {
	say 'R';
	exit;
}
if ( $a < 3796 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_bpr:
# x<2816:A,a<2100:R,a>2147:R,R
if ( $x < 2816 ) {
	say 'A';
	exit;
}
if ( $a < 2100 ) {
	say 'R';
	exit;
}
if ( $a > 2147 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_nbq:
# s>827:R,x<811:A,R
if ( $s > 827 ) {
	say 'R';
	exit;
}
if ( $x < 811 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_jvd:
# a<3414:A,x<3179:tbm,s<1179:rtb,A
if ( $a < 3414 ) {
	say 'A';
	exit;
}
if ( $x < 3179 ) {
	goto LABEL_tbm;
}
if ( $s < 1179 ) {
	goto LABEL_rtb;
}
say 'A';
exit;

LABEL_jfh:
# x>2953:jck,rf
if ( $x > 2953 ) {
	goto LABEL_jck;
}
goto LABEL_rf;

LABEL_xbm:
# a<2003:R,m>805:R,A
if ( $a < 2003 ) {
	say 'R';
	exit;
}
if ( $m > 805 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_mxr:
# m<2849:A,s<3388:R,qc
if ( $m < 2849 ) {
	say 'A';
	exit;
}
if ( $s < 3388 ) {
	say 'R';
	exit;
}
goto LABEL_qc;

LABEL_qf:
# s<1147:khp,m>3428:A,a<3755:A,cvb
if ( $s < 1147 ) {
	goto LABEL_khp;
}
if ( $m > 3428 ) {
	say 'A';
	exit;
}
if ( $a < 3755 ) {
	say 'A';
	exit;
}
goto LABEL_cvb;

LABEL_kc:
# x>1142:R,s>808:A,A
if ( $x > 1142 ) {
	say 'R';
	exit;
}
if ( $s > 808 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_mz:
# x>2329:A,A
if ( $x > 2329 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_jtq:
# a>3533:nc,x<2279:gz,tmn
if ( $a > 3533 ) {
	goto LABEL_nc;
}
if ( $x < 2279 ) {
	goto LABEL_gz;
}
goto LABEL_tmn;

LABEL_xkl:
# s<3498:R,x<3655:R,m>579:A,R
if ( $s < 3498 ) {
	say 'R';
	exit;
}
if ( $x < 3655 ) {
	say 'R';
	exit;
}
if ( $m > 579 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_dk:
# m<2597:msd,s>3101:vbc,hds
if ( $m < 2597 ) {
	goto LABEL_msd;
}
if ( $s > 3101 ) {
	goto LABEL_vbc;
}
goto LABEL_hds;

LABEL_pmg:
# x<982:R,x<1279:A,x>1466:A,R
if ( $x < 982 ) {
	say 'R';
	exit;
}
if ( $x < 1279 ) {
	say 'A';
	exit;
}
if ( $x > 1466 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_sxq:
# x<522:R,R
if ( $x < 522 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_xtm:
# x<2736:A,m>1180:A,R
if ( $x < 2736 ) {
	say 'A';
	exit;
}
if ( $m > 1180 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_jhm:
# x>2234:hxh,xjp
if ( $x > 2234 ) {
	goto LABEL_hxh;
}
goto LABEL_xjp;

LABEL_dkd:
# a<3547:R,s>3418:R,m<205:A,A
if ( $a < 3547 ) {
	say 'R';
	exit;
}
if ( $s > 3418 ) {
	say 'R';
	exit;
}
if ( $m < 205 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_prf:
# x>104:R,s<361:R,a<175:R,R
if ( $x > 104 ) {
	say 'R';
	exit;
}
if ( $s < 361 ) {
	say 'R';
	exit;
}
if ( $a < 175 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_rtb:
# a>3441:A,x<3362:A,R
if ( $a > 3441 ) {
	say 'A';
	exit;
}
if ( $x < 3362 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_xk:
# x<2496:tlq,dxt
if ( $x < 2496 ) {
	goto LABEL_tlq;
}
goto LABEL_dxt;

LABEL_tmn:
# m<683:R,A
if ( $m < 683 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_ddg:
# s<3705:A,s>3809:R,A
if ( $s < 3705 ) {
	say 'A';
	exit;
}
if ( $s > 3809 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_tn:
# a>3545:jx,x>1940:R,a<3426:xz,tqn
if ( $a > 3545 ) {
	goto LABEL_jx;
}
if ( $x > 1940 ) {
	say 'R';
	exit;
}
if ( $a < 3426 ) {
	goto LABEL_xz;
}
goto LABEL_tqn;

LABEL_jc:
# s>401:A,A
if ( $s > 401 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_zns:
# m>1441:A,R
if ( $m > 1441 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_sd:
# x>1272:R,m>3566:R,A
if ( $x > 1272 ) {
	say 'R';
	exit;
}
if ( $m > 3566 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_hvg:
# m<504:A,s>1752:A,A
if ( $m < 504 ) {
	say 'A';
	exit;
}
if ( $s > 1752 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_hzr:
# s<1668:A,R
if ( $s < 1668 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_lk:
# a>356:vbt,s>3501:A,hfr
if ( $a > 356 ) {
	goto LABEL_vbt;
}
if ( $s > 3501 ) {
	say 'A';
	exit;
}
goto LABEL_hfr;

LABEL_dpb:
# m>3385:A,x>666:A,R
if ( $m > 3385 ) {
	say 'A';
	exit;
}
if ( $x > 666 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_hgt:
# a>433:jdh,sd
if ( $a > 433 ) {
	goto LABEL_jdh;
}
goto LABEL_sd;

LABEL_rf:
# x>2598:lm,m<2430:xkc,hjx
if ( $x > 2598 ) {
	goto LABEL_lm;
}
if ( $m < 2430 ) {
	goto LABEL_xkc;
}
goto LABEL_hjx;

LABEL_mls:
# a<3004:pr,a>3113:R,a>3043:A,A
if ( $a < 3004 ) {
	goto LABEL_pr;
}
if ( $a > 3113 ) {
	say 'R';
	exit;
}
if ( $a > 3043 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_dmg:
# a>2964:R,s<1321:A,x>964:A,R
if ( $a > 2964 ) {
	say 'R';
	exit;
}
if ( $s < 1321 ) {
	say 'A';
	exit;
}
if ( $x > 964 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_dn:
# s>1740:A,m>3131:R,A
if ( $s > 1740 ) {
	say 'A';
	exit;
}
if ( $m > 3131 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_js:
# m>950:cg,m<324:A,bvb
if ( $m > 950 ) {
	goto LABEL_cg;
}
if ( $m < 324 ) {
	say 'A';
	exit;
}
goto LABEL_bvb;

LABEL_np:
# m<3013:R,m>3155:R,R
if ( $m < 3013 ) {
	say 'R';
	exit;
}
if ( $m > 3155 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_kp:
# s<3049:jbk,a<3841:shn,x>1423:cq,pjs
if ( $s < 3049 ) {
	goto LABEL_jbk;
}
if ( $a < 3841 ) {
	goto LABEL_shn;
}
if ( $x > 1423 ) {
	goto LABEL_cq;
}
goto LABEL_pjs;

LABEL_vmm:
# s<1649:qmm,m<2417:gsr,rdr
if ( $s < 1649 ) {
	goto LABEL_qmm;
}
if ( $m < 2417 ) {
	goto LABEL_gsr;
}
goto LABEL_rdr;

LABEL_kh:
# s<1884:A,m>825:A,a>3341:A,A
if ( $s < 1884 ) {
	say 'A';
	exit;
}
if ( $m > 825 ) {
	say 'A';
	exit;
}
if ( $a > 3341 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_jnh:
# a>2750:R,a>2615:R,xll
if ( $a > 2750 ) {
	say 'R';
	exit;
}
if ( $a > 2615 ) {
	say 'R';
	exit;
}
goto LABEL_xll;

LABEL_pj:
# x>623:jbc,x>325:R,x>190:zhz,ljt
if ( $x > 623 ) {
	goto LABEL_jbc;
}
if ( $x > 325 ) {
	say 'R';
	exit;
}
if ( $x > 190 ) {
	goto LABEL_zhz;
}
goto LABEL_ljt;

LABEL_sr:
# m>754:R,R
if ( $m > 754 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_xgf:
# x<2091:jbq,m<2015:R,s>3106:A,R
if ( $x < 2091 ) {
	goto LABEL_jbq;
}
if ( $m < 2015 ) {
	say 'R';
	exit;
}
if ( $s > 3106 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_bfv:
# s<2825:R,m<2639:A,a<866:lfc,A
if ( $s < 2825 ) {
	say 'R';
	exit;
}
if ( $m < 2639 ) {
	say 'A';
	exit;
}
if ( $a < 866 ) {
	goto LABEL_lfc;
}
say 'A';
exit;

LABEL_cmt:
# x<3271:A,a>3416:hsz,s<1910:czc,A
if ( $x < 3271 ) {
	say 'A';
	exit;
}
if ( $a > 3416 ) {
	goto LABEL_hsz;
}
if ( $s < 1910 ) {
	goto LABEL_czc;
}
say 'A';
exit;

LABEL_sz:
# m>2962:A,x<403:R,s<608:R,A
if ( $m > 2962 ) {
	say 'A';
	exit;
}
if ( $x < 403 ) {
	say 'R';
	exit;
}
if ( $s < 608 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_mzt:
# x>1079:R,m>748:R,x<883:A,A
if ( $x > 1079 ) {
	say 'R';
	exit;
}
if ( $m > 748 ) {
	say 'R';
	exit;
}
if ( $x < 883 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_mfx:
# s>2396:A,x<2183:R,R
if ( $s > 2396 ) {
	say 'A';
	exit;
}
if ( $x < 2183 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_bpn:
# m<1985:A,A
if ( $m < 1985 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_sgg:
# s>3658:A,A
if ( $s > 3658 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_rt:
# s<3055:R,x<3432:A,x>3756:R,R
if ( $s < 3055 ) {
	say 'R';
	exit;
}
if ( $x < 3432 ) {
	say 'A';
	exit;
}
if ( $x > 3756 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_mmg:
# a>437:R,x<716:R,a>227:R,A
if ( $a > 437 ) {
	say 'R';
	exit;
}
if ( $x < 716 ) {
	say 'R';
	exit;
}
if ( $a > 227 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_fsj:
# a<1063:R,m<1035:R,a>1107:A,A
if ( $a < 1063 ) {
	say 'R';
	exit;
}
if ( $m < 1035 ) {
	say 'R';
	exit;
}
if ( $a > 1107 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_pv:
# m>746:A,x>3612:R,a>3447:A,R
if ( $m > 746 ) {
	say 'A';
	exit;
}
if ( $x > 3612 ) {
	say 'R';
	exit;
}
if ( $a > 3447 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_pkl:
# x>3867:A,x<3785:A,x>3823:A,A
if ( $x > 3867 ) {
	say 'A';
	exit;
}
if ( $x < 3785 ) {
	say 'A';
	exit;
}
if ( $x > 3823 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_rds:
# m>2024:rlm,x<3330:frb,A
if ( $m > 2024 ) {
	goto LABEL_rlm;
}
if ( $x < 3330 ) {
	goto LABEL_frb;
}
say 'A';
exit;

LABEL_frq:
# m<3236:A,R
if ( $m < 3236 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_qgb:
# m<2650:A,s<1803:dn,s<1901:A,rmc
if ( $m < 2650 ) {
	say 'A';
	exit;
}
if ( $s < 1803 ) {
	goto LABEL_dn;
}
if ( $s < 1901 ) {
	say 'A';
	exit;
}
goto LABEL_rmc;

LABEL_tv:
# a<2788:R,s>752:A,x<3927:R,A
if ( $a < 2788 ) {
	say 'R';
	exit;
}
if ( $s > 752 ) {
	say 'A';
	exit;
}
if ( $x < 3927 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_dxt:
# s>3004:dvh,kv
if ( $s > 3004 ) {
	goto LABEL_dvh;
}
goto LABEL_kv;

LABEL_fj:
# x>1215:A,x>565:R,R
if ( $x > 1215 ) {
	say 'A';
	exit;
}
if ( $x > 565 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_vcc:
# m<1348:A,x<3921:R,A
if ( $m < 1348 ) {
	say 'A';
	exit;
}
if ( $x < 3921 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_drv:
# s<819:R,A
if ( $s < 819 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_lf:
# s<2369:jtq,x>2551:md,a<3528:rz,vnz
if ( $s < 2369 ) {
	goto LABEL_jtq;
}
if ( $x > 2551 ) {
	goto LABEL_md;
}
if ( $a < 3528 ) {
	goto LABEL_rz;
}
goto LABEL_vnz;

LABEL_gsr:
# a<494:A,x>1443:lr,m>1606:nnc,xjl
if ( $a < 494 ) {
	say 'A';
	exit;
}
if ( $x > 1443 ) {
	goto LABEL_lr;
}
if ( $m > 1606 ) {
	goto LABEL_nnc;
}
goto LABEL_xjl;

LABEL_vdk:
# x<3083:A,A
if ( $x < 3083 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_lsf:
# m<3737:A,s<141:A,A
if ( $m < 3737 ) {
	say 'A';
	exit;
}
if ( $s < 141 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_hb:
# m<2003:kbz,ctp
if ( $m < 2003 ) {
	goto LABEL_kbz;
}
goto LABEL_ctp;

LABEL_cc:
# m>736:hlm,R
if ( $m > 736 ) {
	goto LABEL_hlm;
}
say 'R';
exit;

LABEL_xrk:
# m>425:R,s>2668:A,A
if ( $m > 425 ) {
	say 'R';
	exit;
}
if ( $s > 2668 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_sck:
# m>1720:R,s>2392:fxd,sb
if ( $m > 1720 ) {
	say 'R';
	exit;
}
if ( $s > 2392 ) {
	goto LABEL_fxd;
}
goto LABEL_sb;

LABEL_sb:
# x<1612:R,m<1648:R,R
if ( $x < 1612 ) {
	say 'R';
	exit;
}
if ( $m < 1648 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_bsz:
# s<2798:xrk,x<559:pqg,dmm
if ( $s < 2798 ) {
	goto LABEL_xrk;
}
if ( $x < 559 ) {
	goto LABEL_pqg;
}
goto LABEL_dmm;

LABEL_msd:
# s>2998:ljz,m<1357:krn,m<1917:kbn,jzf
if ( $s > 2998 ) {
	goto LABEL_ljz;
}
if ( $m < 1357 ) {
	goto LABEL_krn;
}
if ( $m < 1917 ) {
	goto LABEL_kbn;
}
goto LABEL_jzf;

LABEL_ljk:
# x>1194:R,x<662:R,R
if ( $x > 1194 ) {
	say 'R';
	exit;
}
if ( $x < 662 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_jsc:
# a<349:R,s>319:A,m>1497:A,A
if ( $a < 349 ) {
	say 'R';
	exit;
}
if ( $s > 319 ) {
	say 'A';
	exit;
}
if ( $m > 1497 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_hnp:
# s>1977:jfh,a<1962:hl,a<2222:zz,vbg
if ( $s > 1977 ) {
	goto LABEL_jfh;
}
if ( $a < 1962 ) {
	goto LABEL_hl;
}
if ( $a < 2222 ) {
	goto LABEL_zz;
}
goto LABEL_vbg;

LABEL_zx:
# m<2818:R,R
if ( $m < 2818 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_zlf:
# a<446:R,x>1241:R,R
if ( $a < 446 ) {
	say 'R';
	exit;
}
if ( $x > 1241 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_vj:
# m<3222:hpt,m<3705:ffv,m<3883:bq,ptm
if ( $m < 3222 ) {
	goto LABEL_hpt;
}
if ( $m < 3705 ) {
	goto LABEL_ffv;
}
if ( $m < 3883 ) {
	goto LABEL_bq;
}
goto LABEL_ptm;

LABEL_cvb:
# m<3215:R,A
if ( $m < 3215 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_hzn:
# m>3285:R,m<2851:mg,a>245:mbr,nt
if ( $m > 3285 ) {
	say 'R';
	exit;
}
if ( $m < 2851 ) {
	goto LABEL_mg;
}
if ( $a > 245 ) {
	goto LABEL_mbr;
}
goto LABEL_nt;

LABEL_pr:
# m>2749:A,s<3353:R,R
if ( $m > 2749 ) {
	say 'A';
	exit;
}
if ( $s < 3353 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_zjj:
# s<1735:jbg,a<236:kxv,s>1917:mdq,mt
if ( $s < 1735 ) {
	goto LABEL_jbg;
}
if ( $a < 236 ) {
	goto LABEL_kxv;
}
if ( $s > 1917 ) {
	goto LABEL_mdq;
}
goto LABEL_mt;

LABEL_kbz:
# m>1072:R,R
if ( $m > 1072 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_frs:
# m<3639:A,A
if ( $m < 3639 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_qpq:
# s>3340:A,A
if ( $s > 3340 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_zhz:
# s>2384:A,a<3425:A,R
if ( $s > 2384 ) {
	say 'A';
	exit;
}
if ( $a < 3425 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_vp:
# a<1494:gqt,x<1390:xfs,bh
if ( $a < 1494 ) {
	goto LABEL_gqt;
}
if ( $x < 1390 ) {
	goto LABEL_xfs;
}
goto LABEL_bh;

LABEL_xn:
# x>1056:cdm,A
if ( $x > 1056 ) {
	goto LABEL_cdm;
}
say 'A';
exit;

LABEL_kxv:
# m>2357:A,s<1937:A,A
if ( $m > 2357 ) {
	say 'A';
	exit;
}
if ( $s < 1937 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_jct:
# m<3233:A,a>3464:R,A
if ( $m < 3233 ) {
	say 'A';
	exit;
}
if ( $a > 3464 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_pcz:
# a<3458:A,x>684:qhk,xff
if ( $a < 3458 ) {
	say 'A';
	exit;
}
if ( $x > 684 ) {
	goto LABEL_qhk;
}
goto LABEL_xff;

LABEL_tfm:
# s<3188:R,s>3536:ddg,m<769:A,hk
if ( $s < 3188 ) {
	say 'R';
	exit;
}
if ( $s > 3536 ) {
	goto LABEL_ddg;
}
if ( $m < 769 ) {
	say 'A';
	exit;
}
goto LABEL_hk;

LABEL_plf:
# s>603:A,a>529:A,m<873:R,R
if ( $s > 603 ) {
	say 'A';
	exit;
}
if ( $a > 529 ) {
	say 'A';
	exit;
}
if ( $m < 873 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_cl:
# a<672:A,m>3434:R,R
if ( $a < 672 ) {
	say 'A';
	exit;
}
if ( $m > 3434 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_dm:
# x>2258:mf,hp
if ( $x > 2258 ) {
	goto LABEL_mf;
}
goto LABEL_hp;

LABEL_tc:
# m<571:dkd,x>1248:tl,a<3550:fv,R
if ( $m < 571 ) {
	goto LABEL_dkd;
}
if ( $x > 1248 ) {
	goto LABEL_tl;
}
if ( $a < 3550 ) {
	goto LABEL_fv;
}
say 'R';
exit;

LABEL_cg:
# s<1749:R,m>1649:A,R
if ( $s < 1749 ) {
	say 'R';
	exit;
}
if ( $m > 1649 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_nh:
# s>2067:tfm,cb
if ( $s > 2067 ) {
	goto LABEL_tfm;
}
goto LABEL_cb;

LABEL_gd:
# m>2813:mxm,s<1973:clg,zlv
if ( $m > 2813 ) {
	goto LABEL_mxm;
}
if ( $s < 1973 ) {
	goto LABEL_clg;
}
goto LABEL_zlv;

LABEL_zpf:
# s>611:A,x>2005:A,a>3586:R,R
if ( $s > 611 ) {
	say 'A';
	exit;
}
if ( $x > 2005 ) {
	say 'A';
	exit;
}
if ( $a > 3586 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_crx:
# m>1372:cm,x>3544:mcm,s<1761:mfm,R
if ( $m > 1372 ) {
	goto LABEL_cm;
}
if ( $x > 3544 ) {
	goto LABEL_mcm;
}
if ( $s < 1761 ) {
	goto LABEL_mfm;
}
say 'R';
exit;

LABEL_pvx:
# x>412:sxq,tlh
if ( $x > 412 ) {
	goto LABEL_sxq;
}
goto LABEL_tlh;

LABEL_hxf:
# m<1165:R,s<3478:R,x<3387:R,A
if ( $m < 1165 ) {
	say 'R';
	exit;
}
if ( $s < 3478 ) {
	say 'R';
	exit;
}
if ( $x < 3387 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_ld:
# s<541:R,R
if ( $s < 541 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_hvb:
# m>2487:xf,R
if ( $m > 2487 ) {
	goto LABEL_xf;
}
say 'R';
exit;

LABEL_bgs:
# m>1139:A,s<1410:R,a<247:R,A
if ( $m > 1139 ) {
	say 'A';
	exit;
}
if ( $s < 1410 ) {
	say 'R';
	exit;
}
if ( $a < 247 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_csv:
# m<1406:kk,a<727:njp,x>2888:xrh,fdn
if ( $m < 1406 ) {
	goto LABEL_kk;
}
if ( $a < 727 ) {
	goto LABEL_njp;
}
if ( $x > 2888 ) {
	goto LABEL_xrh;
}
goto LABEL_fdn;

LABEL_vd:
# x<712:R,s>3036:R,R
if ( $x < 712 ) {
	say 'R';
	exit;
}
if ( $s > 3036 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_bvm:
# m<1633:A,a>3264:R,R
if ( $m < 1633 ) {
	say 'A';
	exit;
}
if ( $a > 3264 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_xfs:
# s<1729:jjp,s>3009:R,a<1591:rnf,R
if ( $s < 1729 ) {
	goto LABEL_jjp;
}
if ( $s > 3009 ) {
	say 'R';
	exit;
}
if ( $a < 1591 ) {
	goto LABEL_rnf;
}
say 'R';
exit;

LABEL_lt:
# a<2497:df,s>2781:vv,m<1694:mfx,ct
if ( $a < 2497 ) {
	goto LABEL_df;
}
if ( $s > 2781 ) {
	goto LABEL_vv;
}
if ( $m < 1694 ) {
	goto LABEL_mfx;
}
goto LABEL_ct;

LABEL_rbh:
# x<2891:A,s>1660:A,a<2615:kn,A
if ( $x < 2891 ) {
	say 'A';
	exit;
}
if ( $s > 1660 ) {
	say 'A';
	exit;
}
if ( $a < 2615 ) {
	goto LABEL_kn;
}
say 'A';
exit;

LABEL_mp:
# s<885:rl,a>2713:gr,lbd
if ( $s < 885 ) {
	goto LABEL_rl;
}
if ( $a > 2713 ) {
	goto LABEL_gr;
}
goto LABEL_lbd;

LABEL_knn:
# s>1107:ztn,x<2166:lnb,vt
if ( $s > 1107 ) {
	goto LABEL_ztn;
}
if ( $x < 2166 ) {
	goto LABEL_lnb;
}
goto LABEL_vt;

LABEL_dlk:
# x>2261:A,x>2129:R,x>2072:R,A
if ( $x > 2261 ) {
	say 'A';
	exit;
}
if ( $x > 2129 ) {
	say 'R';
	exit;
}
if ( $x > 2072 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_dgb:
# m<1995:nq,a>1664:rd,a<1348:gd,vp
if ( $m < 1995 ) {
	goto LABEL_nq;
}
if ( $a > 1664 ) {
	goto LABEL_rd;
}
if ( $a < 1348 ) {
	goto LABEL_gd;
}
goto LABEL_vp;

LABEL_mv:
# a<268:vg,x<2362:A,s>559:R,vqn
if ( $a < 268 ) {
	goto LABEL_vg;
}
if ( $x < 2362 ) {
	say 'A';
	exit;
}
if ( $s > 559 ) {
	say 'R';
	exit;
}
goto LABEL_vqn;

LABEL_kt:
# a>1146:ps,s<2172:knn,x>1653:xk,dk
if ( $a > 1146 ) {
	goto LABEL_ps;
}
if ( $s < 2172 ) {
	goto LABEL_knn;
}
if ( $x > 1653 ) {
	goto LABEL_xk;
}
goto LABEL_dk;

LABEL_kjt:
# m>2495:cl,x<2239:dc,mx
if ( $m > 2495 ) {
	goto LABEL_cl;
}
if ( $x < 2239 ) {
	goto LABEL_dc;
}
goto LABEL_mx;

LABEL_nvl:
# x>1280:R,s>2377:R,R
if ( $x > 1280 ) {
	say 'R';
	exit;
}
if ( $s > 2377 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_bn:
# a>2486:R,x<2690:sh,A
if ( $a > 2486 ) {
	say 'R';
	exit;
}
if ( $x < 2690 ) {
	goto LABEL_sh;
}
say 'A';
exit;

LABEL_jdh:
# a>842:A,x>1214:A,m>3586:R,A
if ( $a > 842 ) {
	say 'A';
	exit;
}
if ( $x > 1214 ) {
	say 'A';
	exit;
}
if ( $m > 3586 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_qcz:
# s>3420:R,A
if ( $s > 3420 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_clg:
# s<688:R,vl
if ( $s < 688 ) {
	say 'R';
	exit;
}
goto LABEL_vl;

LABEL_chx:
# m>848:A,A
if ( $m > 848 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_sg:
# x>651:A,A
if ( $x > 651 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_zlv:
# s<2655:A,s>3252:sn,s<2901:A,R
if ( $s < 2655 ) {
	say 'A';
	exit;
}
if ( $s > 3252 ) {
	goto LABEL_sn;
}
if ( $s < 2901 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_bh:
# a>1576:tr,a<1546:R,x<1711:fvr,kpv
if ( $a > 1576 ) {
	goto LABEL_tr;
}
if ( $a < 1546 ) {
	say 'R';
	exit;
}
if ( $x < 1711 ) {
	goto LABEL_fvr;
}
goto LABEL_kpv;

LABEL_fkf:
# x>546:A,ksm
if ( $x > 546 ) {
	say 'A';
	exit;
}
goto LABEL_ksm;

LABEL_dxx:
# a>905:A,A
if ( $a > 905 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_jt:
# x>1660:R,R
if ( $x > 1660 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_gvv:
# x<3220:A,A
if ( $x < 3220 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_blj:
# s>2421:pmg,x<842:fkf,m<3248:fvf,hgt
if ( $s > 2421 ) {
	goto LABEL_pmg;
}
if ( $x < 842 ) {
	goto LABEL_fkf;
}
if ( $m < 3248 ) {
	goto LABEL_fvf;
}
goto LABEL_hgt;

LABEL_xf:
# x<3424:R,x<3546:A,s>839:R,A
if ( $x < 3424 ) {
	say 'R';
	exit;
}
if ( $x < 3546 ) {
	say 'A';
	exit;
}
if ( $s > 839 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_kbn:
# x<963:pk,fsx
if ( $x < 963 ) {
	goto LABEL_pk;
}
goto LABEL_fsx;

LABEL_ljz:
# a>575:zfb,lk
if ( $a > 575 ) {
	goto LABEL_zfb;
}
goto LABEL_lk;

LABEL_qqx:
# a<1756:R,s<2864:A,a<2156:A,R
if ( $a < 1756 ) {
	say 'R';
	exit;
}
if ( $s < 2864 ) {
	say 'A';
	exit;
}
if ( $a < 2156 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_dls:
# a<3555:A,x<3232:A,m<1998:bl,R
if ( $a < 3555 ) {
	say 'A';
	exit;
}
if ( $x < 3232 ) {
	say 'A';
	exit;
}
if ( $m < 1998 ) {
	goto LABEL_bl;
}
say 'R';
exit;

LABEL_msz:
# a<3499:qnq,s>2353:krq,a>3546:A,A
if ( $a < 3499 ) {
	goto LABEL_qnq;
}
if ( $s > 2353 ) {
	goto LABEL_krq;
}
if ( $a > 3546 ) {
	say 'A';
	exit;
}
say 'A';
exit;

LABEL_btd:
# x>678:lc,a>482:pvx,x<257:mhh,mzl
if ( $x > 678 ) {
	goto LABEL_lc;
}
if ( $a > 482 ) {
	goto LABEL_pvx;
}
if ( $x < 257 ) {
	goto LABEL_mhh;
}
goto LABEL_mzl;

LABEL_tjh:
# s<2953:gxx,kmr
if ( $s < 2953 ) {
	goto LABEL_gxx;
}
goto LABEL_kmr;

LABEL_psk:
# x<3637:R,R
if ( $x < 3637 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_xl:
# s>2768:R,m>3161:R,zjp
if ( $s > 2768 ) {
	say 'R';
	exit;
}
if ( $m > 3161 ) {
	say 'R';
	exit;
}
goto LABEL_zjp;

LABEL_zg:
# a<2914:R,a<2920:A,R
if ( $a < 2914 ) {
	say 'R';
	exit;
}
if ( $a < 2920 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_ch:
# a>3595:kp,m<2854:fqr,s<2250:szc,mn
if ( $a > 3595 ) {
	goto LABEL_kp;
}
if ( $m < 2854 ) {
	goto LABEL_fqr;
}
if ( $s < 2250 ) {
	goto LABEL_szc;
}
goto LABEL_mn;

LABEL_qnq:
# x<3299:A,m<1979:R,a>3470:R,R
if ( $x < 3299 ) {
	say 'A';
	exit;
}
if ( $m < 1979 ) {
	say 'R';
	exit;
}
if ( $a > 3470 ) {
	say 'R';
	exit;
}
say 'R';
exit;

LABEL_fpl:
# m<2606:R,a<272:A,x>3396:R,A
if ( $m < 2606 ) {
	say 'R';
	exit;
}
if ( $a < 272 ) {
	say 'A';
	exit;
}
if ( $x > 3396 ) {
	say 'R';
	exit;
}
say 'A';
exit;

LABEL_ct:
# s>2351:A,R
if ( $s > 2351 ) {
	say 'A';
	exit;
}
say 'R';
exit;

LABEL_rc:
# s<587:A,R
if ( $s < 587 ) {
	say 'A';
	exit;
}
say 'R';
exit;

