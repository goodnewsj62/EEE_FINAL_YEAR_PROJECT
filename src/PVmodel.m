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
a=1.3; %diode constant
Eg=1.12; %silicon band gap
G=1000; %Actual irraiance
Rs=0.221; %Series resistance
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
plot(V1,I,'k')
ylabel('Current(I)')
xlabel('Voltage(V)')
axis([0 35 0 9])
figure
plot(V1,P) 
ylabel('Power(W)')
xlabel('Voltage(V)')