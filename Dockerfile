# ---------- ETAPA 1: COMPILAR ----------
FROM eclipse-temurin:17-jdk AS build

WORKDIR /app

# Copiamos todo el proyecto
COPY . .

# Compilamos el proyecto (sin tests)
RUN ./mvnw clean package -DskipTests


# ---------- ETAPA 2: EJECUTAR ----------
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copiamos SOLO el jar generado
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
