% Datos
fc = 200; % inicio de la banda de rechazo en [Hz]
Fs = 1000; % frec. de muestreo en [Hz]
N = 6; % orden del filtro
Rs = 60; % ripple (atenuaci�n) en dB en la banda de rechazo
f1 = 0; % frec. m�nima para el c�lculo de la rpta de frecuencia
f2 = 500; % frec. m�xima para el c�lculo de la rpta de frecuencia
m1 = 1e-6; % l�mite inferior del gr�fico de magnitud
% Dise�o del filtro
Wn = 2 * fc / Fs;
[b, a] = cheby2(N, Rs, Wn, 'low');
% Despliega coeficientes
b
a
% Calcula respuesta de frecuencia obtenida
f = [f1 : (f2-f1)/511 : f2];
H = freqz(b, a, f, Fs);
% Grafica Mag[H(f)]
semilogy(f, abs(H)); axis([f1 f2 m1 1.1])
xlabel('f[Hz]'); title('Mag(H)'); grid