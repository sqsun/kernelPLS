% Encodes class membership in binary form

function YY = binarize(Y)

unics = unique(Y);
YY = zeros(length(Y),length(unics));
for i=1:length(unics)
	YY(find(Y==unics(i)),i) = 1;
end;


