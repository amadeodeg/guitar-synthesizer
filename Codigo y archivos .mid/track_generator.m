function [ out,FS ] = track_generator( notas,inicios, finales,fs  )
%This function generates an array of samples of the song provided as input.
%It uses an array of notes, the start of each note in miliseconds, the end of
%the note in miliseconds and the sample rate
FS=fs;
inicios_muestras=floor(inicios*FS/1000);%We convert the starts in seconds into starts in number of samples
finales_muestras=floor(finales*FS/1000);%We convert the ends in seconds into ends in number of samples
out=zeros(1,max(inicios_muestras)+1000+FS*4); %Create the output array
    for i=1:length(notas) %for each note
      longitud=finales_muestras(i)-inicios_muestras(i); %get the length
      nota=guitar_synthesizer(notas(i),longitud,FS); %synthesize it
      nota=[zeros(1,inicios_muestras(i)-1) nota]; % zero pad the start
      nota=[nota zeros(1,length(out)-length(nota))]; %zero pad the ending
      out=nota+out; %and add to the output
    end
end