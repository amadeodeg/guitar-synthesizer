function [ out ] = guitar_synthesizer( f,n,FS )
%Funcion que genera el sonido de una nota en funcion de la frecuencia en
%hercios (f), la longitud deseada de la nota en muestras(n) y la frecuencia
%de muestreo (FS)
S=0.47/(f/82); %Adaptative decay stretching 
if(S>1) %Clamp
    S=1;
end
p=0.999; %tuned decay shortening
w=2*pi*f; 
Pa=-FS/w*atan(-S*sin(w/FS)/((1-S)+S*cos(w/FS))); %(22)
N=floor(FS/f - Pa); %(15)
Pc=FS/f-N-Pa;
C=sin((w/FS-Pc*w/FS)/2)/sin((w/FS+Pc*w/FS)/2); %(16)
B=[1, C, zeros(1,N+1)]; %By solving the gain equation, we get the num
A=[1 , C , zeros(1,N-2) , p*C*(S-1) , p*(S-S*C-1) , -p*S]; %and the den
in=[(2*rand(1,1000))-1 zeros(1,FS*4)]; %We filter the white noise
out=Exp_Decay(filter(B,A,in),length(in)-n); %and apply the exponential decay
end




