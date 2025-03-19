v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 -50 90 -50 {lab=a}
N -40 -100 130 -100 {lab=VDD}
N 130 -100 130 -50 {lab=VDD}
N -40 -100 -40 -50 {lab=VDD}
N -40 330 -40 340 {lab=GND}
N 130 60 130 80 {lab=#net1}
N -180 -40 -180 -10 {lab=GND}
N -40 -20 -40 80 {lab=a}
N 70 110 90 110 {lab=#net1}
N 70 60 70 110 {lab=#net1}
N -0 110 70 110 {lab=#net1}
N 70 60 130 60 {lab=#net1}
N 130 -20 130 60 {lab=#net1}
N -40 140 -40 190 {lab=b}
N -40 340 130 340 {lab=GND}
N -130 110 -40 110 {lab=GND}
N -130 340 -40 340 {lab=GND}
N 130 110 190 110 {lab=GND}
N 130 340 190 340 {lab=GND}
N -40 250 -40 270 {lab=#net2}
N -130 110 -130 340 {lab=GND}
N 130 140 130 340 {lab=GND}
N 190 110 190 340 {lab=GND}
N 0 -50 0 -20 {lab=a}
N -40 -20 0 -20 {lab=a}
C {vdd.sym} 50 -100 0 0 {name=l1 lab=VDD}
C {sg13g2_pr/sg13_hv_pmos.sym} 110 -50 0 0 {name=M1
l=0.45u
w=1.0u
ng=1
m=5
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -20 -50 0 1 {name=M2
l=0.45u
w=1.0u
ng=1
m=5
model=sg13_hv_pmos
spiceprefix=X
}
C {gnd.sym} 50 340 0 0 {name=l3 lab=GND}
C {res.sym} -40 300 0 0 {name=R1
value=100
footprint=1206
device=resistor
m=1}
C {vsource.sym} -180 -70 0 0 {name=V1 value=3 savecurrent=false}
C {vdd.sym} -180 -100 0 0 {name=l4 lab=VDD}
C {gnd.sym} -180 -10 0 0 {name=l5 lab=GND}
C {code_shown.sym} 290 120 0 0 {name=Model only_toplevel=false value="
.lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerMOShv.lib mos_tt
.lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerHBT.lib hbt_typ
"}
C {code_shown.sym} 270 -340 0 0 {name=ngspice_control only_toplevel=false 
value="
.temp 27 
.param Nx2=1 El2=2.5 Nx1=1 El1=2.5
.control 
set plotiptat = ' ';

let num1 = 1
let num0 = 0
repeat 4
	alterparam Nx2 = $&num1;
	echo 'Nx2 = $&num1'
	reset
	dc temp 0 150 1
	set plotiptat = ( $plotiptat \{$curplot\}.I(Vtest) )
	let num1 = num1 + 1
end
plot $plotiptat


.endc
.save all
"
"}
C {sg13g2_pr/npn13G2l.sym} 110 110 0 0 {name=Q1
model=npn13G2l
spiceprefix=X
Nx=\{Nx1\}
El=\{El1\}
}
C {sg13g2_pr/npn13G2l.sym} -20 110 0 1 {name=Q2
model=npn13G2l
spiceprefix=X
Nx=\{Nx2\}
El=\{El2\}
}
C {vsource.sym} -40 220 0 0 {name=Vtest value=0 savecurrent=false}
C {lab_pin.sym} -40 40 0 0 {name=p1 sig_type=std_logic lab=a}
C {lab_pin.sym} -40 160 0 0 {name=p2 sig_type=std_logic lab=b}
