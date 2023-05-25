function [L] = LCR(rth,alpha,mu,W,N,fd)

r = linspace(1e-5,rth,1e4);
k = 2:1:N;

% Correlation Model, Jakes
% delta = besselj(0,2*pi*W*(k-1)/(N-1)).^2;

% New Correlation Model, Tabelado
switch W
case 0.2
    delta = 0.967853346139;
case 0.3
    delta = 0.929749599165;
case 0.5
    delta = 0.822599623583;
case 1
    delta = 0.556107207025;
case 1.5
    delta = 0.464519898111;
case 2
    delta = 0.396664784074;
case 3
    delta = 0.324684221336;
otherwise
    delta = 0
end

mq =@(x,k) marcumq(sqrt(2*mu*delta*x.^alpha(1)/(1-delta)),...
                   sqrt(2*mu*rth^alpha(k)/(1-delta)),mu);

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
         besseli(mu-1,2*mu*sqrt(delta*r.^alpha(1)*rth^alpha(i))/(1-delta)).*...
         r.^(-1+0.5*alpha(1)*(mu+1)).*exp(-mu*r.^alpha(1)/(1-delta));
     
     F = F + alpha(i)*mu*rth^(0.5*alpha(i)*(mu+1))*trapz(r,fo)*...
             exp(-mu*rth^alpha(i)/(1-delta))*delta^(0.5*(1-mu))./...
             (1-delta);
     
end

L = (F+M)*sqrt(2*pi)*fd*gamma(mu-1/2+1/alpha(1))*alpha(1)*mu^mu/(gamma(mu)*rth*alpha(1)*mu^(1/alpha(1))*gamma(mu));



end