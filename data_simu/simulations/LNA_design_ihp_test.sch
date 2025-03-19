v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -1460 -600 -1460 -580 {lab=GND}
N -1320 -410 -1320 -370 {lab=GND}
N -1320 -680 -1320 -640 {lab=VDD}
N -1320 -440 -1300 -440 {lab=GND}
N -1300 -440 -1300 -430 {lab=GND}
N -1600 -220 -1600 -200 {lab=GND}
N -1600 -300 -1600 -280 {lab=#net1}
N -1320 -580 -1320 -470 {lab=#net2}
N -1700 -310 -1700 -300 {lab=#net1}
N -1700 -300 -1600 -300 {lab=#net1}
N -1700 -440 -1700 -370 {lab=#net3}
N -1700 -440 -1360 -440 {lab=#net3}
C {code_shown.sym} -2490 -420 0 0 {name=Model only_toplevel=false value=".lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerHBT.lib hbt_typ"}
C {code_shown.sym} -2460 -780 0 0 {name=NGSPICE_CONTROL 
only_toplevel=false 
value=
"
.param temper = 27
.param vin = 0.05
.param Rc = 875
.temp \{temper\}
.op
.control
tran 100p 500n
;ac dec 10 10 1Meg

plot vout


.endc


.save all
"}
C {gnd.sym} -1460 -580 0 0 {name=l1 lab=GND}
C {vsource.sym} -1460 -630 0 0 {name=VCC value="3.3" savecurrent=false}
C {vdd.sym} -1460 -660 0 0 {name=l2 lab=VDD}
C {res.sym} -1320 -610 0 0 {name=R2
value=\{Rc\}
footprint=1206
device=resistor
m=1}
C {gnd.sym} -1300 -430 0 0 {name=l4 lab=GND}
C {vdd.sym} -1320 -680 0 0 {name=l7 lab=VDD}
C {gnd.sym} -1600 -200 0 0 {name=l15 lab=GND}
C {vsource.sym} -1600 -250 0 0 {name=VCM value="1.65" savecurrent=false}
C {vsource_arith.sym} -820 -690 0 0 {name=E1 VOL=" 'sin(2*3.14*100*time)' "}
C {noconn.sym} -820 -720 0 0 {name=l6}
C {noconn.sym} -820 -660 0 0 {name=l8}
C {vsource.sym} -1700 -340 0 0 {name=V1 value="0.5 ac 1" savecurrent=false}
C {sg13g2_pr/npn13G2v.sym} -1340 -440 0 0 {name=Q1
model=npn13G2v
spiceprefix=X
Nx=1
El=2.5e-6
}
C {gnd.sym} -1320 -370 0 0 {name=l3 lab=GND}
