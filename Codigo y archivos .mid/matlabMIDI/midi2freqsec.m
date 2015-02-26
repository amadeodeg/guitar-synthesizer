function [ out ] = midi2freqsec( in )
% This function provides the representation of a midi track in the
% following format:
%   FREQ - - - - - - - - 
%   INITIAL_TIME (ms)- - - - - - - - 
%   END_TIME (ms) - - - - - - - - 
midi = readmidi(in);
notes = midiInfo(midi);

frequencies = midi2freq(notes(:,3)'); %the third column is the notes column provided by midiInfo
start_end_time = notes(:,5:6)'.*1000; %(ms)

out = [frequencies;start_end_time];

end

