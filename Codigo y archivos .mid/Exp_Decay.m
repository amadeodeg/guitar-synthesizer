function [ out ] = Exp_Decay( in, decay_length)
%This function applies an exponential decay at the end of a vector given the vector
%and the length in positions of the decay
x = 1:decay_length; %we create the index for the exponential

rate = log(0.01)/-decay_length; %apply it

decay = [ones(1, length(in)-decay_length) exp(-x*rate)]; %and put it at the end of a function
% of ones in order to apply the decay only at the decay_length last
% positions

out = decay.*in; %and we multiply the coefficients of the decay and return the result

end

