# Imagen base
FROM ubuntu:latest

# Establecer variable de entorno DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND noninteractive

# Actualizar e instalar dependencias
RUN apt-get update && apt-get install -y openjdk-8-jdk nano
RUN apt-get install -y python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python


# Copiar archivos de instalación a la carpeta 'opt'
COPY spark /opt/spark
COPY SFA001.csv /opt/SFA001.csv



# Establecer variables de entorno para Spark
ENV SPARK_HOME /opt/spark
ENV PATH $PATH:$SPARK_HOME/bin

# Puerto de comunicación del maestro
EXPOSE 7077
