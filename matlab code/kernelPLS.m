function [ Xscore ] = kernelPLS(K,Ktest,Y,T,varargin)


ell = size(K,1);
trainY = 0;
KK = K; YY = Y;
for i=1:T
    YYK = YY*YY'*KK;
    beta(:,i) = YY(:,1)/norm(YY(:,1));
    if size(YY,2) > 1, % only loop if dimension greater than 1
        bold = beta(:,i) + 1;
        while norm(beta(:,i) - bold) > 0.001,
            bold = beta(:,i);
            tbeta = YYK*beta(:,i);
            beta(:,i) = tbeta/norm(tbeta);
        end
    end
    tau(:,i) = KK*beta(:,i);
    val = tau(:,i)'*tau(:,i);
    c(:,i) = YY'*tau(:,i)/val;
    trainY = trainY + tau(:,i)*c(:,i)';
    trainerror = norm(Y - trainY,'fro')/sqrt(ell);
    %====================================
   Weight(:,i) = beta(:,i)/norm(tau(:,i));
   Xscore(:,i) = tau(:,i); % Xscore(:,i) = tau(:,i)/norm(tau(:,i));Ð§¹û²î
   %====================================
    w = KK*tau(:,i)/val;
    KK = KK - tau(:,i)*w' - w*tau(:,i)' + tau(:,i)*tau(:,i)'*(tau(:,i)'*w)/val;
    YY = YY - tau(:,i)*c(:,i)';
end

% Regression coefficients for new data
alpha = beta * ((tau'*K*beta)\tau')*Y;

%  Ktest gives new data inner products as rows, Ytest true outputs
elltest = size(Ktest',1);
testY = Ktest' * alpha;
if ~isempty(varargin)
    Ytest = varargin{1};
    testerror = norm(Ytest - testY,'fro')/sqrt(elltest);
    varargout = testerror;
end
