function C = Cap(gb,alpha,mu,W,N)

mx = 50;
while abs(Pout_Jakes(mx,gb,alpha,mu,W,N)/(1+mx)) > 1e-2
    mx = mx+5;
end
mx
gth = linspace(1e-5,mx,2*mx);
P = zeros(1,length(gth));
for i = 1:length(gth)
    P(i) = Pout_Jakes(gth(i),gb,alpha,mu,W,N);
end

C = trapz(gth,(ones(1,length(P))-P)./(1+gth));

end