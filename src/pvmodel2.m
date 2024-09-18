% PV Model 12/1/2018
clc;
clear all;
K=1.38065e-23; %Boltzmann constant
q=1.602e-19; %Charge ofelectron
Iscn=8.21; %Nominal sc current
Vocn=32.9; %Nominal oc voltage
Kv=-0.123; %Temperature voltage constant
K1=0.0032;%Temperature current constant
Ns=54; %No of series connected cells
T=25+273; %Operating temperature
Tn=25+273; %Nominall temperature
Gn=1000; %Nominal irradiance
a1=1.1; %diode constant
a2=1.2;
a3=1.3;
Eg=1.12; %silicon band gap
G=1000; %Actual irraiance
Rs=0.22; %Series resistance
Rp=415; %Shunt resistance

Vtn=Ns*K*Tn/q;
Ion1=Iscn/(exp(Vocn/(a1*Vtn))-1);
Io1=Ion1*((T/Tn)^3)*exp((q*Eg/(a1*K))*((1/Tn)-(1/T)));
Ion2=Iscn/(exp(Vocn/(a2*Vtn))-1);
Io2=Ion2*((T/Tn)^3)*exp((q*Eg/(a2*K))*((1/Tn)-(1/T)));
Ion3=Iscn/(exp(Vocn/(a3*Vtn))-1);
Io3=Ion3*((T/Tn)^3)*exp((q*Eg/(a3*K))*((1/Tn)-(1/T)));
Ipvn=Iscn;
Ipv=(G/Gn)*(Ipvn+K1*(T-Tn));
Vt=Ns*K*T/q;
I=zeros(330,1);
i=1;
I(1,1)=0;
for V=0:0.1:32.9
 I_part=Io1*(exp((V+(I(i,1)*Rs))/(Vt*a1))-1)+Io2*(exp((V+(I(i,1)*Rs))/(Vt*a2))-1)...
     +Io3*(exp((V+(I(i,1)*Rs))/(Vt*a3))-1)+((V+(Rs*I(i,1)))/Rp);
 I(i+1)=Ipv-I_part;
  V1(i)=V;
 P(i)=V*I(i);
 i=i+1;
end
V1(i)=V1(i-1);
P(i)=P(i-1);
%plot(V1,I,'.b')
plot(V1,P,'.b') 
axis([0 35 0 210])
%max(V)
max(P)

hold on


K=1.38065e-23; %Boltzmann constant
q=1.602e-19; %Charge ofelectron
Iscn=8.21; %Nominal sc current
Vocn=32.9; %Nominal oc voltage
Kv=-0.123; %Temperature voltage constant
K1=0.0032;%Temperature current constant
Ns=54; %No of series connected cells
T=25+273; %Operating temperature
Tn=25+273; %Nominall temperature
Gn=1000; %Nominal irradiance
a=1.3; %diode constant
Eg=1.12; %silicon band gap
G=1000; %Actual irraiance
Rs=0.22; %Series resistance
Rp=415; %Shunt resistance

Vtn=Ns*K*Tn/q;
Ion1=Iscn/(exp(Vocn/(a1*Vtn))-1);
Io1=Ion1*((T/Tn)^3)*exp((q*Eg/(a1*K))*((1/Tn)-(1/T)));
Ion2=Iscn/(exp(Vocn/(a2*Vtn))-1);
Io2=Ion2*((T/Tn)^3)*exp((q*Eg/(a2*K))*((1/Tn)-(1/T)));
Ipvn=Iscn;
Ipv=(G/Gn)*(Ipvn+K1*(T-Tn));
Vt=Ns*K*T/q;
I=zeros(330,1);
i=1;
I(1,1)=0;
for V=0:0.1:32.9
 I_part=Io1*(exp((V+(I(i,1)*Rs))/(Vt*a1))-1)+Io2*(exp((V+(I(i,1)*Rs))/(Vt*a2))-1)...
     +((V+(Rs*I(i,1)))/Rp);
 I(i+1)=Ipv-I_part;
  V1(i)=V;
 P(i)=V*I(i);
 i=i+1;
end
V1(i)=V1(i-1);
P(i)=P(i-1);
%plot(V1,I,'.g')
plot(V1,P,'.g') 
%max(V)
max(P)




K=1.38065e-23; %Boltzmann constant
q=1.602e-19; %Charge ofelectron
Iscn=8.21; %Nominal sc current
Vocn=32.9; %Nominal oc voltage
Kv=-0.123; %Temperature voltage constant
K1=0.0032;%Temperature current constant
Ns=54; %No of series connected cells
T=25+273; %Operating temperature
Tn=25+273; %Nominall temperature
Gn=1000; %Nominal irradiance
a=1.3; %diode constant
Eg=1.12; %silicon band gap
G=1000; %Actual irraiance
Rs=0.22; %Series resistance
Rp=415; %Shunt resistance

Vtn=Ns*K*Tn/q;
Ion=Iscn/(exp(Vocn/(a*Vtn))-1);
Io=Ion*((T/Tn)^3)*exp((q*Eg/(a*K))*((1/Tn)-(1/T)));
Ipvn=Iscn;
Ipv=(G/Gn)*(Ipvn+K1*(T-Tn));
Vt=Ns*K*T/q;
I=zeros(330,1);
i=1;
I(1,1)=0;
for V=0:0.1:32.9
 I_part=Io*(exp((V+(I(i,1)*Rs))/(Vt*a))-1)+((V+(Rs*I(i,1)))/Rp);
 I(i+1)=Ipv-I_part;
 
 V1(i)=V;
 P(i)=V*I(i);
 i=i+1;
end
V1(i)=V1(i-1);
P(i)=P(i-1);
%plot(V1,I,'.r')
plot(V1,P,'.r') 
%max(V)
max(P)