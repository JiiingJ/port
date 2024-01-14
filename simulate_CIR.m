function rates = simulate_CIR(gamma_star, r_bar_star, alpha, initial_rate, T, num_steps)
    % 时间步长
    dt = T / num_steps;

    % 初始化路径数组
    rates = zeros(num_steps, 1);
    rates(1) = initial_rate;

    % 模拟 CIR 模型的路径
    for i = 2:num_steps
        dW = sqrt(dt) * randn; % 正态随机变量
        rates(i) = rates(i - 1) + gamma_star * (r_bar_star - rates(i - 1)) * dt + sqrt(alpha * max(rates(i - 1), 0)) * dW;
    end
end
