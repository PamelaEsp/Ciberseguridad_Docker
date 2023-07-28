# Instruciones para desplegar el contenedor

Requisitos:

- Instalar certificados para gnup

```
sudo apt-get install ca-certificates curl gnupg
```
- Genenrar llaves de certificado para docker
```
sudo install -m 0755 -d /etc/apt/keyrings 
```
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
```
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
- Añadir lista de repositorios para apt
```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
- Instalar paquetes de docker
```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
## Instalacion de imagen 
Escribir el comando para descargar la imagen que se encuentra en [Imagen de Pamela](https://hub.docker.com/repository/docker/pamesp/pamenube/)

```
docker pull pamesp/pamenube
```
Para ejecutar el contenedor debemos escribir el siguiente comando con este comenado ademas de ejecutar estamos indicando que se cree el volumen con la bandera **-v** :
```
sudo docker run -d -p 8085:80 -v "${PWD}":/var/www/html/ -p 23:22 pamenube
```
una vez ejecutada la imagen, validamos si esta corriendo en nuestro entorno con el comando
```
docker ps -a
```

## Acceder al contenido de la pagina web
 Una vez validado con el comando anterior, ya podemos acceder a nuestra pagina web abriendo el navegador con la siguiente ruta [http://localhost:8085/index.html](http://localhost:8085/index.html)

## SSH

Para realizar la conexion a traves de SSH es mediante:

```
ssh pamesp@localhost 
```
La contraseña que se te solicita es: *pass123*



