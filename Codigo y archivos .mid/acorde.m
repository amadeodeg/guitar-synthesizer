function [ output_args ] = acorde( input_args,t,fs )
%Entrada array de frecuencias a juntar
%t en segundos
%fs en hz
%Suma de todas

output_args=0;
for i=1:length(input_args);
    output_args=output_args+guitar_synthesizer(input_args(i),t*fs,fs);
end

end

