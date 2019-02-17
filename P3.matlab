function e = Estadistica (n,x) %función que juga x veces distintos tableros con barcos de longitud n, luego grafica la cantidad de tiros necesarios para tocar el barco.
    e = zeros (1,x); %crea un vector de ceros, e, de longitud x.

    for p = 1:x %cada ciclo simula una partida juega x partidas.
        T = colocarBarco (n); %hace un tablero T, coloca un barco de longitud n en T.
        c = jugarBN (T); %juega el tablero T y guarda en c la cantidad de tiros que hizo hasta tocar el barco.
        e(1,p) = c; %guarda en la posición x de e la cantidad de tiros.
    end
    figure (1)
    hist (e) %muestra un histograma de e.
    figure (2)
    plot (e) %muestra un gráfico de e.
end