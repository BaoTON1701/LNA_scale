v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 210 70 210 120 {lab=#net1}
N 270 120 330 120 {lab=#net1}
N 330 70 330 120 {lab=#net1}
N 270 120 270 130 {lab=#net1}
N 210 120 270 120 {lab=#net1}
N 210 -220 210 -200 {lab=VDD}
N 210 -220 330 -220 {lab=VDD}
N 330 -220 330 -200 {lab=VDD}
N 30 -160 30 -120 {lab=VDD}
N 30 -60 30 10 {lab=GND}
N 10 160 120 160 {lab=#net2}
N 10 160 10 190 {lab=#net2}
N -100 160 10 160 {lab=#net2}
N 370 40 370 90 {lab=vin2}
N 120 90 370 90 {lab=vin2}
N 120 90 120 100 {lab=vin2}
N -100 40 -100 100 {lab=vin1}
N -100 40 170 40 {lab=vin1}
N 210 40 230 40 {lab=GND}
N 310 40 330 40 {lab=GND}
N 190 -120 210 -120 {lab=vout1}
N 210 -140 210 -120 {lab=vout1}
N 330 -120 360 -120 {lab=vout2}
N 330 -140 330 -120 {lab=vout2}
N 210 -120 210 -100 {lab=vout1}
N 210 -40 210 10 {lab=#net3}
N 330 -120 330 10 {lab=vout2}
C {vsource.sym} 30 -90 0 0 {name=V1 value=VCC savecurrent=false}
C {vdd.sym} 30 -160 0 0 {name=l1 lab=VDD}
C {gnd.sym} 30 10 0 0 {name=l2 lab=GND}
C {sg13g2_pr/npn13G2v.sym} 190 40 0 0 {name=Q1
model=npn13G2v
spiceprefix=X
Nx=8
El=2.5e-6
}
C {sg13g2_pr/npn13G2v.sym} 350 40 0 1 {name=Q2
model=npn13G2v
spiceprefix=X
Nx=8
El=2.5e-6
}
C {isource.sym} 270 160 0 0 {name=I0 value=4m}
C {gnd.sym} 270 190 0 0 {name=l3 lab=GND}
C {res.sym} 210 -170 0 0 {name=R1
value=600
footprint=1206
device=resistor
m=1}
C {res.sym} 330 -170 0 0 {name=R2
value=600
footprint=1206
device=resistor
m=1}
C {vdd.sym} 270 -220 0 0 {name=l4 lab=VDD}
C {vsource.sym} 10 220 0 0 {name=VCM value=1.2 savecurrent=false}
C {gnd.sym} 10 250 0 0 {name=l5 lab=GND}
C {vsource_arith.sym} -100 130 0 0 {name=E1 VOL=" '0.005*sin(2*3.14*100000*time)' "}
C {vsource_arith.sym} 120 130 0 0 {name=E2 VOL=" '-0.005*sin(2*pi*100000*time)' "}
C {gnd.sym} 230 40 0 0 {name=l6 lab=GND}
C {gnd.sym} 310 40 0 0 {name=l7 lab=GND}
C {code_shown.sym} -730 -210 0 0 {name=s1 only_toplevel=false value="
.control
tran 1n 100u

plot i(V3)
plot (vin1 - vin2)
.endc
.op
;print @q.xq1.qnpn13g2v[ic] @q.xq1.qnpn13g2v[vce] @q.xq1.qnpn13g2v[vbe]
;print @q.xq2.qnpn13g2v[ic] @q.xq2.qnpn13g2v[vce] @q.xq2.qnpn13g2v[vbe]

.save all
"}
C {code_shown.sym} -510 300 0 0 {name=Model only_toplevel=false value=".lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerHBT.lib hbt_typ"}
C {lab_pin.sym} 190 -120 0 0 {name=p1 sig_type=std_logic lab=vout1}
C {lab_pin.sym} 360 -120 0 1 {name=p2 sig_type=std_logic lab=vout2}
C {lab_pin.sym} -100 50 0 0 {name=p3 sig_type=std_logic lab=vin1}
C {lab_pin.sym} 120 90 0 0 {name=p4 sig_type=std_logic lab=vin2}
C {vsource.sym} 210 -70 0 0 {name=V3 value=0 savecurrent=false}
