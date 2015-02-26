function [ out ] = Amp_Distort( in, gain )
%This function provides a distortion to a sample array provided as input
%using a gain indicated by the user
threshold = max(in)*0.9; %get the saturation value
out = zeros(1,length(in)); 
for n=1:length(in) %for each input sample
    sample = in(n)*gain; %amplify the sample
    if(sample >= threshold)
        out(n) = threshold; %distort it with a positive saturated amplifier
    elseif(sample <= -threshold)
        out(n) = -threshold; %distort it with a negative saturated amplifier
    else
        out(n) = sample; %don't distort it 
    end
end

end

