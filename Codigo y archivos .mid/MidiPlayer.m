%%
FS=44100; %Initiate the sampling rate
filename=input('Please write the filename\n','s');
notas=input('Please write the amount of notes that will be played or -1 to play all\n');
distort=input('Do you want distortion? Y/N [N]:','s');
if isempty(distort)
   distort = 'N';
end
if(distort=='Y')
    gain=input('Please write the gain of the distortion (1-20)\n');
end
disp('Reading...')
in=midi2freqsec(filename); %get the notes from the midi file
if( notas==-1)
    notas=length(in(1,:)) %get the number of notes if the user chose all
end
freq=in(1,1:notas); %get the selected notes
initial_times=in(2,1:notas); %initial times
final_times=in(3,1:notas); %and final times
disp('Generating...')
[ sonido,FS ]= track_generator( freq,initial_times, final_times,FS  ); %generate the track
if(distort=='Y') %apply distortion if needed
    distorsionado=Amp_Distort(sonido,gain);
    [Blow,Alow]=fir1(6,2*5000/FS);
    distorsionado=filter(Blow,Alow,distorsionado);
    soundsc(distorsionado,FS)
else
    soundsc(sonido,FS)
end