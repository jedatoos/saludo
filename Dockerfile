FROM eclipse-temurin:17-jdk AS build

WORKDIR /app

COPY . .

# 🔑 Dar permisos de ejecución al wrapper de Maven
RUN chmod +x mvnw

# Compilar el proyecto
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
