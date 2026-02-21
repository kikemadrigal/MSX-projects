#Con este archivo creamos una imagen de contenedor partiendo de una imagen base y modificándola a nuestro gusto

# 1 Configuramos los parámetros para crear la imagen modificada
# Le decimos la imagen base que vamos a usar de dockerhub.com
# FROM nataliapc/sdcc:3.8.0
FROM ubuntu
# le decimos que ueremos situarnos en el directorio /usr/src/cpp_test
WORKDIR /usr/src/sdcc_test
RUN apt-get update && apt-get -y install sdcc 
# Copiamos nuestros archivos de la carpeta actual a /usr/src
COPY *.* /usr/src/sdcc_test
ENTRYPOINT ["/bin/bash", "docker.sh"]
# VOLUME /usr/src/sdcc_test

#Recuerda:
# 2 Se crea la imagen modificada con un nombre
# docker build -t nombre_contenedor:etiqueta(para indicar el nombre del contenedor)  directorio_donde_esta_dockerfile(en el que se sule poner un punto)
# docker build -t sdcc-image .

# 3 Se crea y arranca con docker run --rm(lo borra si existía previamente) -it(le dice al contenedor que permite interactuar con el contenedor) nombre_contenedor(que lo hemos puesto con docker build):etiqueta
# docker run --rm --name sdcc -v /c/Users/casa/Desktop/sdcc-docker-test/src:/usr/src/sdcc_test sdcc-image
# interactuar: docker run --rm -it --name sdcc -v /c/Users/casa/Desktop/sdcc-docker-test/src:/usr/src/sdcc_test sdcc-image

# docker exec -it sdcc-image bash
# docker run -it  sdcc-image