function [Po] = Pout(gth,gb,alpha,mu,W,N)

rho = linspace(1e-5,sqrt(gth/gb),1e4);
k = 2:1:N;
delta = besselj(0,2*pi*W*(k-1)/(N-1)).^2;



mq =@(k) marcumq(sqrt(2*mu*delta(k-1)*rho.^alpha(1)/(1-delta(k-1))),...
                 sqrt(2*mu*(gth/gb)^(alpha(k)/2)/(1-delta(k-1))),mu);
f = ones(1,length(rho));
for k = 2:N
    f = f .*(ones(1,length(rho))-mq(k));
end

f = f .* rho.^(alpha(1)*mu-1).*exp(-mu*rho.^alpha(1));

Po = alpha(1)*mu^mu*trapz(rho,f)/gamma(mu);

end