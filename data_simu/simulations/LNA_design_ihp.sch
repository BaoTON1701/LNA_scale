v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
L 4 -1400 -1120 -1140 -1120 {}
L 4 -1150 -1030 -1150 -820 {}
L 4 -1410 -820 -1150 -820 {}
L 4 -1410 -1030 -1410 -820 {}
L 4 -1080 -1030 -700 -1030 {}
L 4 -700 -1030 -700 -830 {}
L 4 -1080 -820 -700 -820 {}
L 4 -1080 -1030 -1080 -830 {}
L 4 -1530 -1030 -1530 -810 {}
L 4 -1710 -810 -1530 -810 {}
L 4 -1710 -1030 -1710 -810 {}
L 4 -1710 -1030 -1530 -1030 {}
L 4 -1480 -760 -1000 -760 {}
L 4 -730 -760 -730 -310 {}
L 4 -1480 -310 -1000 -310 {}
L 4 -1480 -760 -1480 -310 {}
L 4 -1510 -780 -1240 -780 {}
L 4 -1000 -310 -730 -310 {}
T {Power block} -1340 -810 0 0 0.4 0.4 {}
T {Input block} -950 -810 0 0 0.4 0.4 {}
T {Current source block} -1220 -780 0 0 0.4 0.4 {}
N -1360 -920 -1360 -900 {lab=GND}
N -1320 -410 -1320 -370 {lab=IEE}
N -1320 -680 -1320 -640 {lab=VDD}
N -1390 -440 -1360 -440 {lab=Vin1}
N -1320 -440 -1300 -440 {lab=GND}
N -1300 -440 -1300 -430 {lab=GND}
N -1320 -540 -1320 -470 {lab=Vout1}
N -1170 -410 -1170 -370 {lab=IEE}
N -1170 -680 -1170 -640 {lab=VDD}
N -1190 -440 -1170 -440 {lab=GND}
N -1190 -440 -1190 -430 {lab=GND}
N -1170 -510 -1170 -470 {lab=Vout2}
N -1130 -440 -1110 -440 {lab=Vin2}
N -1110 -440 -1110 -400 {lab=Vin2}
N -1390 -400 -1110 -400 {lab=Vin2}
N -1220 -920 -1220 -900 {lab=GND}
N -1220 -1000 -1220 -980 {lab=#net1}
N -1080 -830 -1080 -820 {lab=#net2}
N -700 -830 -700 -820 {lab=#net3}
N -1620 -1000 -1620 -980 {lab=IEE}
N -1620 -920 -1620 -900 {lab=GND}
N -1320 -540 -1080 -540 {lab=Vout1}
N -1320 -580 -1320 -540 {lab=Vout1}
N -1170 -510 -1080 -510 {lab=Vout2}
N -1170 -580 -1170 -510 {lab=Vout2}
N -1240 -370 -1170 -370 {lab=IEE}
N -1240 -370 -1240 -340 {lab=IEE}
N -1320 -370 -1240 -370 {lab=IEE}
N -940 -450 -940 -400 {lab=GND}
N -900 -400 -860 -400 {lab=GND}
N -860 -450 -860 -400 {lab=GND}
N -900 -400 -900 -370 {lab=GND}
N -940 -400 -900 -400 {lab=GND}
N -940 -550 -940 -510 {lab=Vout1}
N -860 -550 -860 -510 {lab=Vout2}
N -1040 -930 -1040 -920 {lab=#net1}
N -940 -920 -850 -920 {lab=#net1}
N -850 -930 -850 -920 {lab=#net1}
N -940 -920 -940 -870 {lab=#net1}
N -1040 -920 -940 -920 {lab=#net1}
N -1040 -1010 -1040 -990 {lab=Vin1}
N -850 -1010 -850 -990 {lab=Vin2}
N -1220 -1000 -1120 -1000 {lab=#net1}
N -1120 -1000 -1120 -870 {lab=#net1}
N -1120 -870 -940 -870 {lab=#net1}
C {code_shown.sym} -2160 -430 0 0 {name=Model only_toplevel=false value=".lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerHBT.lib hbt_typ"}
C {code_shown.sym} -1970 -780 0 0 {name=NGSPICE_CONTROL 
only_toplevel=false 
value=
"
.param temper = 27
.param vin = 0.05
.param Rc = 875
.temp \{temper\}
.op
.control
tran 1n 10u
;ac dec 10 10 1Meg

plot vout


.endc


.save all
"}
C {gnd.sym} -1360 -900 0 0 {name=l1 lab=GND}
C {vsource.sym} -1360 -950 0 0 {name=VCC value="3.3" savecurrent=false}
C {vdd.sym} -1360 -980 0 0 {name=l2 lab=VDD}
C {sg13g2_pr/npn13G2l.sym} -1340 -440 0 0 {name=Q1
model=npn13G2l
spiceprefix=X
Nx=1
El=2.5
}
C {res.sym} -1320 -610 0 0 {name=R2
value=\{Rc\}
footprint=1206
device=resistor
m=1}
C {gnd.sym} -1300 -430 0 0 {name=l4 lab=GND}
C {vdd.sym} -1320 -680 0 0 {name=l7 lab=VDD}
C {sg13g2_pr/npn13G2l.sym} -1150 -440 0 1 {name=Q2
model=npn13G2l
spiceprefix=X
Nx=1
El=2.5
}
C {res.sym} -1170 -610 0 1 {name=R4
value=\{Rc\}
footprint=1206
device=resistor
m=1}
C {gnd.sym} -1190 -430 0 1 {name=l12 lab=GND}
C {vdd.sym} -1170 -680 0 1 {name=l14 lab=VDD}
C {gnd.sym} -1220 -900 0 0 {name=l15 lab=GND}
C {vsource.sym} -1220 -950 0 0 {name=VCM value="1.65" savecurrent=false}
C {opin.sym} -1040 -1010 0 0 {name=p12 lab=Vin1}
C {opin.sym} -850 -1010 0 0 {name=p13 lab=Vin2}
C {ipin.sym} -1390 -440 0 0 {name=p4 lab=Vin1}
C {ipin.sym} -1390 -400 0 0 {name=p5 lab=Vin2}
C {isource.sym} -1620 -950 0 0 {name=IEE value=4m}
C {gnd.sym} -1620 -900 0 0 {name=l3 lab=GND}
C {opin.sym} -1080 -540 0 0 {name=p2 lab=Vout1}
C {opin.sym} -1080 -510 0 0 {name=p3 lab=Vout2}
C {iopin.sym} -1240 -340 0 0 {name=p6 lab=IEE}
C {res.sym} -940 -480 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -860 -480 0 0 {name=R3
value=1k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -900 -370 0 0 {name=l5 lab=GND}
C {ipin.sym} -940 -550 0 0 {name=p7 lab=Vout1}
C {ipin.sym} -860 -550 0 0 {name=p8 lab=Vout2}
C {vsource_arith.sym} -820 -690 0 0 {name=E1 VOL=" 'sin(2*3.14*100*time)' "}
C {noconn.sym} -820 -720 0 0 {name=l6}
C {noconn.sym} -820 -660 0 0 {name=l8}
C {vsource.sym} -1040 -960 0 0 {name=V1 value="0.5 ac 1" savecurrent=false}
C {vsource.sym} -850 -960 0 0 {name=V2 value="0.5 ac 1" savecurrent=false}
C {opin.sym} -1620 -1000 0 0 {name=p14 lab=IEE}
