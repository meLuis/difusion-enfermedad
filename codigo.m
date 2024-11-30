% Parámetros del modelo
beta = 0.00001; % Tasa de transmisión
gamma = 1/14;   % Tasa de recuperación

% Condiciones iniciales
S0 = 45400; % Población susceptible inicial
I0 = 2100;  % Población infectada inicial
R0 = 2500;  % Población recuperada inicial

% Tiempo de simulación
T = 100;    % Tiempo total (en días)
dt = 0.01;     % Paso de tiempo (en días)
N = T/dt;   % Número de pasos

% Inicialización de vectores
S = zeros(1, N+1);
I = zeros(1, N+1);
R = zeros(1, N+1);
t = 0:dt:T; % Vector de tiempo

% Condiciones iniciales
S(1) = S0;
I(1) = I0;
R(1) = R0;

% Método de Euler
for n = 1:N
    dS = -beta * S(n) * I(n);
    dI = beta * S(n) * I(n) - gamma * I(n);
    dR = gamma * I(n);

    S(n+1) = S(n) + dS * dt;
    I(n+1) = I(n) + dI * dt;
    R(n+1) = R(n) + dR * dt;
end

% Gráfica de resultados
figure;
plot(t, S, 'b', 'LineWidth', 1.5); hold on;

xlabel('Tiempo (días)');
ylabel('Población');
legend('Susceptibles');
title('Modelo SIR - Método de Euler');
hold off;
figure;

plot(t, I, 'r', 'LineWidth', 1.5);
xlabel('Tiempo (días)');
ylabel('Población');
legend( 'Infectados');
title('Modelo SIR - Método de Euler');
grid on;

figure;
plot(t, R, 'g', 'LineWidth', 1.5);
xlabel('Tiempo (días)');
ylabel('Población');
legend('Recuperados');
title('Modelo SIR - Método de Euler');
grid on;

% Rango de valores de S para graficar
S_values = linspace(1, max(S), 1000); % Asegúrate de que S > 0 para evitar problemas con ln(S)
I_values = -S_values + 7142.86 * log(S_values) - 29094.8;

% Gráfica de I en función de S
figure;
plot(S_values, I_values, 'm', 'LineWidth', 1.5);
xlabel('Susceptibles (S)');
ylabel('Infectados (I)');
title('Relación entre I y S');
grid on;

% Gráfica de S en función de R
figure;
plot(R, S, 'c', 'LineWidth', 1.5);
xlabel('Recuperados (R)');
ylabel('Susceptibles (S)');
title('Relación entre S y R');
grid on;
