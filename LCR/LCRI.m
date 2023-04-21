function [L] = LCRI(rth,alpha,mu,W,N,fd)

r = linspace(1e-5,rth,1e3);
k = 2:1:N;
delta = ones(1,N)*1e-5;

mq =@(x,k) marcumq(sqrt(2*mu*delta(k-1)*x.^alpha(1)/(1-delta(k-1))),...
                   sqrt(2*mu*rth^alpha(k)/(1-delta(k-1))),mu);

M = 1;
for k = 2:N
    M = M*(1-mq(rth,k));
end
M = M*rth^(mu*alpha(1))*exp(-mu*rth^alpha(1));

F = 0;
for i = 2:N
    fo = ones(1,length(r));
    for k = 2:N
        if k~=i
            fo = fo .*(ones(1,length(r))-mq(r,k));
        end
    end
    fo = fo.*...
         besseli(mu-1,2*mu*sqrt(delta(i-1)*r.^alpha(1)*rth^alpha(i))/(1-delta(i-1))).*...
         r.^(-1+0.5*alpha(1)*(mu+1)).*exp(-mu*r.^alpha(1)/(1-delta(i-1)));
     
     F = F + alpha(i)*mu*rth^(0.5*alpha(i)*(mu+1))*trapz(r,fo)*...
             exp(-mu*rth^alpha(i)/(1-delta(i-1)))*delta(i-1)^(0.5*(1-mu))./...
             (1-delta(i-1));
     
end

L = (F+M)*sqrt(2*pi)*fd*gamma(mu-1/2+1/alpha(1))*alpha(1)*mu^mu/...
    (gamma(mu)*rth*alpha(1)*mu^(1/alpha(1))*gamma(mu));



end