# Comandos Generales
`ls` lista directorio actual  
`pwd` imprime el directorio donde estas parado  
`which` saber donde se encuentra el archivo del comando  
`cd` change dir  
`chmod` modificar permisos  
argumentos de chown:  
`OGA` (3 numeros), del 0 al 7 [O - OWNER, G - GROUP, A - ALL]  
El numero es la suma de estos 3:  
4 - **R**ead (equivale a 100 binario)  
2 - **W**rite (equivale a 010 binario)  
1 - e**X**ecute (equivale a 001 binario)  

`chown` change owner, cambiar el dueño de un archivo  
ejemplo: `chown usuario:grupo /directorio`

`printenv` Imprimir variables de entorno

`shutdown` Apagar el equipo

## Directorios
**/home** - Linux User Accounts Home Directory and FTP server home directory (some distros)  
**/etc** - Linux Server's and Applications System's Configuration Files  
**/usr** - Linux System Files (Shareable, Read-only Data)  
**/bin** - Binary Files for user applications  
**/sbin** - Binary Files for system programs  


## Gestor de paquetes (Ubuntu)
`apt show [nombre del comando]` da info sobre el comando

## SSH
Agregar una clave al keychain de ssh
`ssh-add -K ~/.ssh/<private_key_file>`

# Utilidades Especficas
## Formato de archivo DAA:
`daa2iso` DAA2ISO is a program for converting DAA files (Direct Access Archive, used by PowerISO) to ISO.

## Notificaciones en pantalla:
`osd_cat`  Notificaciones en pantalla  
Ejemplo: `osd_cat -p top -A center -o 200 -d=200 -f -sony-*-*-*-*-*-*-230-*-*-*-*-*`

# PDFS
## Convertir varias imagenes a un PDF
`convert imagen.png salida.pdf`  

##Cambiar de Resolución/Tamaño un PDF
`gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=salida.pdf entrada.pdf`  
Parametros:  
**dPDFSETTINGS**=VALOR , en VALOR se pone la calidad de conversion, se elije una de las siguientes:  
**/screen**   (screen-view-only quality, 72 dpi images)  
**/ebook**    (low quality, 150 dpi images)  
**/printer**  (high quality, 300 dpi images)  
**/prepress** (high quality, color preserving, 300 dpi imgs)  
**/default**  (almost identical to /screen)  

En la documentación se pueden encontrar otros parametros para modificar pdfs: http://milan.kupcevic.net/ghostscript-ps-pdf/

# Fuentes
Agregar fuentes a linux (y que aparezcan cuando se usa `xfontsel`):  
Ejecutar el comando(Donde local es la carpeta donde estan los archivos de fuentes):
    
    cd /usr/share/fonts/local/
    mkfontscale
    mkfontdir`
Update font cache, then

    xset +fp /usr/share/fonts/local 

`xlsfonts` para ver todas las fuentes


# Sincronizar directorios
`rsync` -r --delete-before --ignore-existing --exclude="*~" ORIGEN DESTINO  
Parametros:  
-**r**  
Recursivo    
-**v**  
Verbose (informacion sobre lo que se hace)  
-**h**  
Human Readable (el verbose es mas entendible)  
-**i**  
Itemize-Changes, lista los cambios  
--**delete-before**  
Elimina los archivos que estan en el directorio DESTINO pero no en ORIGEN, luego de realizar la transferencia.  
--**ignore-existing**  
Si ya existen en el directorio DESTINO, no los remplaza.  
--**exclude="PATTERN"**  
Excluye de la sincronizacion a archivos y directorios que tengan PATTERN en su nombre. 