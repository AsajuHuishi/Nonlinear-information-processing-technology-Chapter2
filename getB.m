function [B] = getB(t,tau,epsilon,epsilon_t)
%B = getB(t,tau,epsilon,epsilon_t)
B = 0;
for u = 1:t
    B = B + epsilon(u) - epsilon_t;
end
end

