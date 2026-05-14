v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -130 -130 -60 -130 {lab=in}
N -130 -130 -130 -100 {lab=in}
N -20 -100 -20 -20 {lab=out}
N -20 -130 20 -130 {lab=#net1}
N 20 -200 20 -130 {lab=#net1}
N -20 -200 20 -200 {lab=#net1}
N -20 -200 -20 -160 {lab=#net1}
N -230 -200 -230 -100 {lab=#net1}
N -230 -200 -20 -200 {lab=#net1}
N -20 10 20 10 {lab=0}
N 20 10 20 70 {lab=0}
N -20 70 20 70 {lab=0}
N -20 40 -20 70 {lab=0}
N -20 -50 20 -50 {lab=out}
N -130 70 -20 70 {lab=0}
N -130 -40 -130 70 {lab=0}
N -230 -40 -230 70 {lab=0}
N -230 70 -130 70 {lab=0}
N -80 10 -60 10 {lab=in}
N -80 -130 -80 10 {lab=in}
C {sky130_fd_pr/nfet_01v8.sym} -40 10 0 0 {name=M1
W=4
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -40 -130 0 0 {name=M2
W=12
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} -230 -70 0 0 {name=V1 value=1.8 savecurrent=false}
C {vsource.sym} -130 -70 0 0 {name=V2 value="pulse(0 1.8 1n 1n 1n 10n 20n) savecurrent=false}
C {gnd.sym} -130 70 0 0 {name=l1 lab=0}
C {devices/code.sym} -380 -80 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.param mc_mm_switch = 0
.param mc_pr_switch = 1
"
spice_ignore=false}
C {lab_pin.sym} 20 -50 2 0 {name=p1 sig_type=std_logic lab=out
}
C {lab_pin.sym} -120 -130 1 0 {name=p2 sig_type=std_logic lab=in
}
C {code_shown.sym} 120 -110 0 0 {name=spice only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
tran 0.1n 50n
plot in out
op
.endc
"
}
