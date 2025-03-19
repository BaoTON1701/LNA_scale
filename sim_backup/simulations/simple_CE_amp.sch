v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1000 -410 1000 -360 {lab=GND}
N 870 -510 870 -470 {lab=VDD}
N 870 -320 870 -290 {lab=#net1}
N 870 -110 870 -100 {lab=GND}
N 780 -190 780 -170 {lab=in}
N 780 -110 870 -110 {lab=GND}
N 870 -230 870 -110 {lab=GND}
N 780 -260 780 -250 {lab=#net2}
N 780 -260 830 -260 {lab=#net2}
N 870 -380 900 -380 {lab=out}
N 870 -410 870 -380 {lab=out}
N 870 -260 890 -260 {lab=GND}
N 890 -260 890 -110 {lab=GND}
N 870 -110 890 -110 {lab=GND}
N 870 -380 870 -370 {lab=out}
N 1000 -510 1000 -470 {lab=VDD}
C {sg13g2_pr/npn13G2l.sym} 850 -260 0 0 {name=Q1
model=npn13G2l
spiceprefix=X
Nx=1
El=2.5
}
C {vsource.sym} 780 -220 0 0 {name=V1 value=0.8 savecurrent=false}
C {vsource_arith.sym} 780 -140 0 1 {name=E1 VOL=0.05*sin(2*3.14*1e5*time)}
C {res.sym} 870 -440 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {vdd.sym} 870 -510 0 0 {name=l1 lab=VDD}
C {gnd.sym} 870 -100 0 0 {name=l2 lab=GND}
C {vsource.sym} 1000 -440 0 0 {name=V2 value="3.3" savecurrent=false}
C {vdd.sym} 1000 -510 0 0 {name=l3 lab=VDD}
C {gnd.sym} 1000 -360 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 900 -380 0 1 {name=p1 sig_type=std_logic lab=out}
C {vsource.sym} 870 -340 0 0 {name=VIC value=0 savecurrent=false}
C {lab_pin.sym} 780 -180 0 0 {name=p3 sig_type=std_logic lab=in}
C {code_shown.sym} 40 -120 0 0 {name=Model only_toplevel=false value=".lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerHBT.lib hbt_typ"}
C {code_shown.sym} 20 -390 0 0 {name=SPICE1 only_toplevel=false value=".control 
	tran 10u 20u
	set nolegend;
	plot (out ) title 'Voltage Gain'
	;plot I(VIC) title 'Ic v. time' ylabel 'Ic' 
 	;plot (-I(E1)) title 'Ib v. time' ylabel 'Ib'
	;plot I(VIC)/(-I(E1)) title 'beta v. time'
	;plot I(VIC)/ (in) title 'gm v. time'

.endc
.save all"}
C {title.sym} 90 -40 0 0 {name=l5 author="Bao TON"}
