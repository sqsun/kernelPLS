function K = kernel(X,Y,type,par1,coef)

% K=kernel(X,Y,type,par1)
%   type: 'polynomial' or 'gaussian'
%   par1: parameter for kernel
X = X';
Y = Y';
% if nargin < 4
%     alpha = 0.25;
%     par1 = (size(X,1) + 1) / sqrt(12) / size(X,1) ^ (1 + alpha);
% end

if strcmp(type,'polynomial')
    
    K=((X'*Y)+coef).^par1;
    
elseif strcmp(type,'gaussian')
    sigma = 250;
    [X2,Y2]=meshgrid(sum(Y.^2),sum(X.^2));
    K=exp(-(X2+Y2-2*X'*Y)/(2*sigma^2));
%     K=exp(-(X2+Y2-2*X'*Y)/(2*mpower(sig,2)));
    
end
