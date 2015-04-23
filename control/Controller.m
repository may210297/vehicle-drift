function u_plus = Controller(x,u,pars)
%% Compute state error and extract sideslip error
e_x = x - pars.x_eq;
e_beta = e_x(1);

%% Sideslip Controller - compute desired yaw rate for sideslip control
r_des = SideslipController(pars, e_beta);

%% Use r_des instead of r_eq for our controller
e_r = x(2) - r_des;
e_x(2) = e_r;

%% Inner looop controller 
u_plus = InnerLoop(x, e_x, pars);

end

function rdes = SideslipController(pars, e_beta)
%     req = 1/(m*Ux_eq) * (FyF_eq + FyR_eq);
    rdes = pars.r_eq + pars.K_beta*e_beta;
end