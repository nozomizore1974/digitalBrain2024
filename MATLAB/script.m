dsts = readlines('distance.txt');
dsts = char(dsts);
d = zeros(116);

for i = 

for i = 0:115
    for j = 1:116
        a = dsts(i*116 + j,:);
        p = 0;
        for k = 1:28
            if(a(k) == ' ')
                p = p + 1;
            end
            if (p == 2)
                d(i + 1, j) = double(string(a(k:end)));
                break;
            end
        end
    end
end
