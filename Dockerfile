# Utilizamos una imagen base de Ubuntu
FROM ubuntu:latest

# Actualizamos los paquetes e instalamos Apache y SSH
RUN apt-get update && apt-get install -y apache2 openssh-server

# Creamos un usuario para correr la aplicación
RUN useradd -ms /bin/bash pamesp

#contraaseña
RUN echo pamesp:pass123 | chpasswd

# Copiamos el contenido de una página web de ejemplo
COPY index.html /var/www/html/

# Exponemos el puerto de Apache 
EXPOSE 80 

# Inicializar servcios de Apache y SSH
CMD service apache2 start && service ssh start && tail -f /dev/null




