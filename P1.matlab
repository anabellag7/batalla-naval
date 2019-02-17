function T = colocarBarco(n) %función que hace un tablero de 10x10 y coloca un barco de longitud n en una posición aleatoria.
        T = zeros (10,10); %genera la matriz T de 10x10 de ceros
        d = rand () * 2; %asigna a d un numero aleatorio en entre 0 y 2. d es la dirección del barco (horizontal o vertical)
    
    if d < 1 && d >= 0 %si d está entre 0 y 1 la orientación es vertical
        i = round (rand() * (size(T,1)-1-(n-1))) + 1; %genera un número aleatorio entero para la fila, acotado entre 1 y 10-(n-1).
        j = round (rand() * (size(T,2)-1)) + 1; %genera un número aleatorio entero para la columna, acotado entre 1 y 10
    
    while n > 0 %mientras n sea mayor que 0, cuando sea 0 ya se han ubicado n casilleros de barco
        T (i,j) = 180; %pone un "casillero de barco" en T(i,j)
        i = i + 1; %aumenta la fila 1 posición y hace que la orientación sea vertical
        n = n - 1; %disminuye el largo de barco por construir 1 unidad
    end
    
    else %caso contrario, si d está entre 1 y 2, orientación horizontal
        i = round (rand() * (size(T,1)-1)) + 1; %genera un número aleatorio entero para la fila, acotado entre 1 y 10
        j = round (rand() * (size(T,2)-1-(n-1))) + 1; %genera un número aleatorio entero para la columna, acotado entre 1 y 10-(n-1)
        while n > 0 %mientras n sea mayor que 0, cuando sea 0 ya se han ubicado n casilleros de barco
            T (i,j) = 180; %pone un "casillero de barco" en T(i,j) luego de 1 iteración i aumenta y casillero se pone al lado
            j = j + 1; %aumenta la columna 1 posición (esto hace que la orientación sea horizontal)
            n = n - 1; %disminuye el largo de barco por construir 1 unidad
        end
    end
end

function T = longitud() %función que pide al usuario una longitud de barco y genera un tablero con un barco de esa longitud.
        n = 0; %le da un valor inicial a n, para que ingrese al while siguiente.
    
        while n < 1 || n > 10 || n ~= m %si la longitud no es válida, es decir, n es más grande que el tablero, cero, negativo, ó no es un entero, entra en el ciclo.
            n = input ('Ingrese longitud del barco(debe ser mayor que 0 y menor que 11:'); %pide al usuario una longitud de barco y la guarda en n
            m = round (n); %redondea n al entero siguiente y lo guarda en m para compararlo con n y comprobar que n es entero.
        end

        T = colocarBarco(n); %invoca a la función que crea una matriz T con un barco de longitud n.
        imshow (T); %muestra el tablero inicial en imagen.
end