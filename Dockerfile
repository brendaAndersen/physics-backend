# Etapa de construção
FROM maven:3.9.1-openjdk-17 AS build

# Defina o diretório de trabalho
WORKDIR /app

# Copie o código fonte para o diretório de trabalho
COPY . .

# Execute o build do Maven para gerar o JAR
RUN mvn clean package -DskipTests

# Etapa de execução
FROM openjdk:17-jdk-slim

# Exponha a porta que a aplicação vai utilizar
EXPOSE 8080

# Copie o JAR do diretório target da etapa anterior para o diretório atual
COPY --from=build /app/target/auth-api-1.0.0.jar app.jar

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]