import pandas as pd

dt = 0.01
N_steps = 1400
t = [i * dt for i in range(+N_steps)]

S = [45400]
I = [2100]
R = [2500]

for n in range(N_steps - 1):
    dS_dt = -0.00001 * S[n] * I[n]
    dI_dt = 0.00001 * S[n] * I[n] - (1 / 14) * I[n]
    dR_dt = (1 / 14) * I[n]

    S.append(S[n] + dt * dS_dt)
    I.append(I[n] + dt * dI_dt)
    R.append(R[n] + dt * dR_dt)

data = {
    "Tiempo (t)": t,
    "Susceptibles (S)": S,
    "Infectados (I)": I,
    "Recuperados (R)": R,
    "dS/dt": [-0.00001 * S[i] * I[i] for i in range(N_steps)],
    "dI/dt": [0.00001 * S[i] * I[i] - (1 / 14) * I[i] for i in range(N_steps)],
    "dR/dt": [(1 / 14) * I[i] for i in range(N_steps)],
}

df = pd.DataFrame(data)
output_path = "Metodo_Euler_SIR.xlsx"
df.to_excel(output_path, index=False)

output_path
