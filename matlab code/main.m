% Algorithm to (try to) select the features(genes) using kernelPLS method.
% Function name:    main.m
%       Authors:    S.Q. Sun and Q.K. Peng
%   Affiliation:    Xi'an Jiaotong University
%       Contact:    ssqsxf@stu.xjtu.edu.cn
%  Release date:    April 20, 2014
% Version: 1.0
%% ======================================
clear all
clc
                                        %-------------------%
load AMLALL_nature                      %  loading dataset  %
% load Lymphoma                         %-------------------%

%% 
num_SelectedGenes = input('How many genes you want to select? \nPlease input here:');


% mean:0,std:1                           %-------------------%
X = normalizemeanstd( xapp );            %    normalizing    %
                                         %-------------------%

%============================================================%
%                KERNEL PARTIAL LEAST SQUARES                %
%============================================================%
Y = binarize( yapp );

% number of components
num_Component = 10;
                                       %---------------------%
alpha = 1;                             %  parameter setting  %
coef = 0.1;                            %---------------------%
                                                                 %---------------------%
                                                                 %  polynomial kernel  %
Kxx = kernel( X, X, 'polynomial', alpha, coef );                 %---------------------%
Kxy = kernel( X, X([1:2:size(X,1)], : ), 'polynomial', alpha, coef );                                                                
                                                                %---------------------%
                                                                %   gaussian kernel   %                
% Kxx = kernel( X, X, 'gaussian' );                             %---------------------% 
% Kxy = kernel( X, X([1:2:size(X,1)],:), 'gaussian' );


[ kplsXS ] = kernelPLS( Kxx, Kxy, Y, num_Component );

kX0 = X - ones( size(X,1), 1 )*mean( X );
kWeight = pinv( kX0 )*kplsXS;

kVIP = calVIP( Y, kplsXS( :, 1:num_Component ), kWeight( :, 1:num_Component ) );

[ ~, FeatureRank ] = sort( kVIP, 'descend' );


for i = 1:num_SelectedGenes
    SelectedGenes{ i } = GeneNames{ FeatureRank( i ) };
end
SelectedGenes
