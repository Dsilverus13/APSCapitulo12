% Datos para el diseño del filtro
fp = 45; % frecuencia límite de la banda de paso en [Hz]
fr = 50; % frecuencia límite de la banda de rechazo en [Hz]
Fs = 200; % frec. de muestreo en [Hz]
Rp = 1; % ripple en dB en la banda de paso
Rs = 40; % ripple en dB en la banda de rechazo
% Estima el orden necesario para lograr las especificaciones
Wp = 2 * fp / Fs;
Wr = 2 * fr / Fs;
[N, Wn] = ellipord(Wp, Wr, Rp, Rs);
% Diseña el filtro
[b, a] = ellip(N, Rp, Rs, Wn, 'low');
% Despliega N y coeficientes
N
b
a
% Calcula la respuesta de frecuencia obtenida
f1 = 0; % frec. mínima
f2 = 100; % frec. máxima
f = [f1 : (f2-f1)/511 : f2];
H = freqz(b, a, f, Fs);
% Grafica Mag[H(f)]
subplot 221; semilogy(f, abs(H));
axis([f1 f2 1e-4 2]); grid
xlabel('f[Hz]'); title('Mag(H) de LPF IIR')
% Lee la señal, la filtra y graba la señal filtrada
load('ecg_rdo.txt')
y = filter(b, a, ecg_rdo);
save 'ecg_iir.txt' y -ascii