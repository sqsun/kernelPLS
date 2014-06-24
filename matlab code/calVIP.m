function VIP = calVIP( Y, t, w )

p = 3;
[~,m]=size(t);
[~,q]=size(Y);
[~,~]=size(w);

Rd = zeros(1,m);
for i = 1:m
     for j = 1:q
         r = kernelmi( Y(:,j)',t(:,i)' );
         Rd( i ) = Rd( i ) + r^2;
%          r = corrcoef(Y(:,j),t(:,i));
%          Rd(i)=Rd(i) + r(1,2)^2;
     end
end
% Rd = Rd./sum(Rd);
RdY = sum( Rd./q );

w2 = w.^2;
dor = p*sum( ( ( ones(size(w2,1),1 )*Rd ).*w2 ), 2 );
% VIP = sqrt(dor);
VIP = sqrt( dor./RdY );
end