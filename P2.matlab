function [c, TFinal] = jugarBN(T) %función que tira en un tablero dado hasta que toca el barco. Devuelve el tablero con los tiros y la cantidad de tiros.
    c = 0; %entero que guarda la cantidad de tiros
    a = 0; %variable. Determina si se acertó al barco (cuando es 1)

    TFinal = T; %copia el tablero en TFinal.
    while a == 0 %mientras no se haya tocado el barco.
        i = round(rand() * 9) + 1; %genera un entero para la filas
        j = round(rand() * 9) + 1; %y columnas, entre 1 y 10.

        if TFinal(i, j) > 179 %si el casillero elegido es mayor que 179 (es un barco)
            TFinal(i, j) = 255; %asigna 255 al casillero, barco tocado.
            c = c + 1; %aumenta 1 el número de tiros
            a = 1; %el barco fue tocado.

            elseif TFinal(i, j) < 100 %si el casillero elegido es menor a 100, esto es no tiene barco y todavía no fue elegido.
                TFinal(i, j) = 100; %marca el casillero como agua, ya no se podrá elegir de nuevo
                c = c + 1; %aumenta el número de tiros en 1.
            end
        end
        
    figure(1)
    imshow(TFinal, [0 255]); %muestra una imagen del tablero final en escala de grises.
end

function [T, TFinal, c] = longitud1() %función que pide al usuario una longitud de barco al usuario y juega la partida. Devuelve la cantidad de tiros, el tablero inicial y el tablero final.
    n = 0;
    while n < 1 || n > 10 || n ~= m
        n = input('Ingrese longitud del barco(debe ser mayor que 0 y menor que 11:');
        m = round(n);
    end

    T = colocarBarco(n);
    [TFinal, c] = jugarBN(T); %llama a la función que juega el tablero T y devuelve el tablero final en imagen y la cantidad de tiros realizados.

    figure(2)
    imshow(T);
end