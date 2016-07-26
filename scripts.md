## Buscar y borrar recursivamente un archivo
    find . -name "NOMBRE_DEL_ARCHIVO_A_BORRAR" -print0 | xargs -0 rm -rf

## Comparar directorios
    diff -r -q --exclude="*~" DIR1 DOIR2

## Obtiene recursivamente archivos de un directorio y los copia a una carpeta sola
    find . -name "*.mp3" -a -type f -exec cp -a '{}' /home/martin/asd \;

## Escalar PDF con `pdfjam`
    pdfjam --a4paper --noautoscale true --scale .71


## Imagen a PDF
El script recibe un patron a buscar y todas las imagenes encontradas en la ruta actual con ese patron son convertidas a un unico pdf

    read -p "Buscar: " find  
    read -p "Salida: " salida  
    find . -name "$find*" | sort -n | sed 's/\ /\\ /g' | tr '\n' ' ' | sed 's/$/\ '$salida'.pdf/' | xargs convert -compress jpeg

## Mensaje en pantalla con `osd_cat`
    echo "Mensaje a Mostrar: "; read mensaje
    echo "Color: "; read color
    echo "Posicion(top, middle, bottom): "; read pos
    echo "Alineamiento(left,right,center): "; read align
    echo "Offset vertical(numero + o -): "; read offsetV
    echo "Offset horizontal(numero + o -): "; read offsetH
    echo "Duracion en segundos: "; read duration

    echo "$mensaje" | osd_cat -f -*-*-medium-r-*--*-246-*-*-*-*-* -c $color -d=$duration -A $align -p $pos -o $offsetV -i $offsetH

## Descargar una lista de links de youtube
**FUNCTION**:  
Download videos from youtube using the command clive
**MANUAL**:  
To specify the videos you want to download, add the youtube ID of the video to the file 'list' (or create it if doesn't exist yet)  
The youtube video ID is the parameter 'v' that appears on the url of the video.

**EXAMPLE**:   
If the link is: https://www.youtube.com/watch?feature=player_embedded&v=9VqL6POWIoc
then the video ID is 9VqL6POWIoc
You just need to add the video ID to a new line of the file **list**

**PREREQUISITES**: 

1. command `clive` installed (`sudo apt-get install clive` if not installed)  
2. have a file called **list** with the youtube videos ID's you want to download, one per line  

**Script**:  

    # get the result of wc -l list on $lines variable:
    lines=$(wc -l list)  
    # remove list from $lines because wc -l FILENAME returns: 'NUMBER_OF_LINES FILENAME'
    # so the command below removes the ' FILENAME' part and the value of $lineas now is a number
    lines="${lineas//' list'/}"
    for (( i = 1; i < $lines; i++ )); do
        video="$(sed -n $i'p' list)"
        clive http://youtube.com/watch?v=$video
    done

