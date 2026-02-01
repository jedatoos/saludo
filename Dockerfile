# 1. Imagen base con Java
FROM eclipse-temurin:17-jdk

# 2. Carpeta de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiar el jar generado por Maven
COPY target/*.jar app.jar

# 4. Exponer el puerto
EXPOSE 8080

# 5. Ejecutar Spring Boot
ENTRYPOINT ["java","-jar","app.jar"]
