function output = exp_average(in,b)

% The function computes the “exponentially weighted moving average,” or
% “exponential average” for short, of a sequence of scalars. The input
% sequence is provided to the function one element at a time and the
% function returns the current average each time. If we denote the nth
% element of the input sequence, that is, the function input at the nth
% invocation, by in_n, then the rule for calculating the corresponding
% average out_n that is to be returned by the function is:
% out_1 = in_1
% out_n = b * in_n + (1 - b) * out_(n-1),
% where b is a coefficient between 0 and 1. In plain English, the current
% average depends on the current input and the previously computed average
% weighted by b and (1 - b), respectively. When called by two input
% arguments, the input sequence is reset, the first input argument is
% considered to be in_1 and the second input argument is the value of the
% coefficient b. When called with a single input argument, it is considered
% to be in_t, that is, the current value of the input sequence. In both
% cases, the output is calculated according to the formula above. If the
% function is called for the very first time with a single input argument,
% the value of the coefficient b must default to 0.1. 

persistent B
persistent out
if nargin==1
    if isempty(B)
        B=0.1;
    end
    if isempty(out)
        out=in;
    else
        out=B.*in+(1-B).*out;
    end
else
    B=b;
    out=in;
end
output=out;
end