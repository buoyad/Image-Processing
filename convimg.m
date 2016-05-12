function [ out ] = convimg( in, f )
%This function manually filters an image using the 2-D convolution
%   Implemented in fulfillment of the term project for ECE 346 on the topic
%   of image processing.
%   By Alexi Varughese, Wayne Sun, and Daniel Ayoub
    in = double(in);
    out(:,:,1) = conv2(in(:,:,1), f);
    out(:,:,2) = conv2(in(:,:,2), f);
    out(:,:,3) = conv2(in(:,:,3), f);
    out = uint8(out);

end

