v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 20 -20 20 -10 {lab=GND}
N 20 -50 20 -20 {lab=GND}
N 20 -80 40 -80 {lab=GND}
N 40 -80 40 -20 {lab=GND}
N 20 -20 40 -20 {lab=GND}
N -50 -80 -20 -80 {lab=#net1}
N -120 -80 -110 -80 {lab=VDD}
N -120 -210 -120 -80 {lab=VDD}
N -120 -210 20 -210 {lab=VDD}
N 20 -340 20 -210 {lab=VDD}
N 20 -210 20 -190 {lab=VDD}
N 20 -130 20 -110 {lab=#net2}
N -280 -340 20 -340 {lab=VDD}
N -280 -20 -280 -10 {lab=GND}
N -280 -50 -280 -20 {lab=GND}
N -280 -80 -260 -80 {lab=GND}
N -260 -80 -260 -20 {lab=GND}
N -280 -20 -260 -20 {lab=GND}
N -350 -80 -320 -80 {lab=#net3}
N -420 -80 -410 -80 {lab=VDD}
N -420 -210 -420 -80 {lab=VDD}
N -420 -210 -280 -210 {lab=VDD}
N -280 -210 -280 -190 {lab=VDD}
N -280 -130 -280 -110 {lab=#net4}
N -560 -20 -560 -10 {lab=GND}
N -560 -50 -560 -20 {lab=GND}
N -560 -80 -540 -80 {lab=GND}
N -540 -80 -540 -20 {lab=GND}
N -560 -20 -540 -20 {lab=GND}
N -630 -80 -600 -80 {lab=#net5}
N -700 -80 -690 -80 {lab=VDD}
N -700 -210 -700 -80 {lab=VDD}
N -700 -210 -560 -210 {lab=VDD}
N -560 -210 -560 -190 {lab=VDD}
N -560 -130 -560 -110 {lab=#net6}
N -280 -340 -280 -210 {lab=VDD}
N -560 -340 -280 -340 {lab=VDD}
N -560 -340 -560 -210 {lab=VDD}
N -730 -340 -730 -320 {lab=VDD}
N -730 -260 -730 -240 {lab=GND}
C {sg13g2_pr/npn13G2l.sym} 0 -80 0 0 {name=Q2
model=npn13G2l
spiceprefix=X
Nx=\{Nx_var\}
El=\{El_var\}
}
C {gnd.sym} 20 -10 0 0 {name=l2 lab=GND}
C {vsource.sym} -730 -290 0 0 {name=V1 value=3.3 savecurrent=false}
C {vsource.sym} -80 -80 3 1 {name=Vib_l value=0 savecurrent=false}
C {vsource.sym} 20 -160 0 1 {name=Vic_l value=0 savecurrent=false}
C {sg13g2_pr/npn13G2.sym} -300 -80 0 0 {name=Q1
model=npn13G2
spiceprefix=x
Nx=\{Nx_var\}
}
C {gnd.sym} -280 -10 0 0 {name=l1 lab=GND}
C {vsource.sym} -380 -80 3 1 {name=Vib value=0 savecurrent=false}
C {vsource.sym} -280 -160 0 1 {name=Vic value=0 savecurrent=false}
C {gnd.sym} -560 -10 0 0 {name=l3 lab=GND}
C {vsource.sym} -660 -80 3 1 {name=Vib_v value=0 savecurrent=false}
C {vsource.sym} -560 -160 0 1 {name=Vic_v value=0 savecurrent=false}
C {gnd.sym} -730 -240 0 0 {name=l4 lab=GND}
C {vdd.sym} -280 -340 0 0 {name=l5 lab=VDD}
C {vdd.sym} -730 -340 0 0 {name=l6 lab=VDD}
C {code.sym} 160 -320 0 0 {name=s1 only_toplevel=false value=
"
.lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerHBT.lib hbt_typ

.param El_var = 1 temper = 27 Nx_var = 1
.temp \{temper\}
.op
.control
;control of changing params Nx (number of emitter in a row)
set plotib = ' ';
set plotib_l = ' ';
set plotib_v = ' ';
set plotic = ' ';
set plotic_l = ' ';
set plotic_v = ' ';
set plotbeta = ' ';
set plotbeta_v = ' ';
set plotbeta_l = ' ';
let Nx_1 = 1

repeat 10; 
	alterparam Nx_var = $&Nx_1
	reset 
	dc V1 0.1 1.6 0.05
	if Nx_var < 5
		set plotib_l = ( $plotib_l (\{$curplot\}.I(Vib_l)) );
		set plotic_l = ( $plotic_l (\{$curplot\}.I(Vic_l)) );
		set plotbeta_l = ( $plotbeta_l \{$curplot\}.I(vic_l)/\{$curplot\}.I(vib_l) );
	if Nx_var < 9
		set plotib_v = ( $plotib_v (\{$curplot\}.I(Vib_v)) );
		set plotic_v = ( $plotic_v (\{$curplot\}.I(Vic_v)) );
		set plotbeta_v = ( $plotbeta_v \{$curplot\}.I(vic_v)/\{$curplot\}.I(vib_v) );
	set plotib =   ( $plotib (\{$curplot\}.I(Vib)) );
	set plotic =   ( $plotic   (\{$curplot\}.I(Vic)) );
	set plotbeta =   ( $plotbeta \{$curplot\}.I(vic)/\{$curplot\}.I(vib) );
	let Nx_1 = Nx_1 + 1 
end;

plot loglog $plotib $plotib_l $plotib_v;
plot loglog $plotic $plotic_l $plotic_v;
plot loglog $plotbeta $plotbeta_l $plotbeta_v;
plot loglog ($plotbeta) vs ($plotic);
;set wr_singlescale;
;set wr_vecnames;
;wrdata gummel_npn13g2_Nx.txt $plotib $plotic $plotbeta;
;wrdata gummel_npn13g2l_Nx.txt $plotib_l $plotic_l $plotbeta_l;
;wrdata gummel_npn13g2v_Nx.txt $plotib_v $plotic_v $plotbeta_v;

.endc

.save all
"}
C {sg13g2_pr/npn13G2v.sym} -580 -80 0 0 {name=Q4
model=npn13G2v
spiceprefix=X
Nx=1
}
