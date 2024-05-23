FROM jelastic/maven:3.9.5-openjdk-21 as build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie apenas o arquivo pom.xml para aproveitar o cache de dependências do Maven
COPY pom.xml .

COPY src/ src/

# Baixe as dependências do Maven especificadas no pom.xml e as salve no diretório .m2 no contêiner
RUN mvn -f pom.xml clean package

# Copie todo o conteúdo do projeto para o contêiner
COPY . .

# Compile o projeto Maven e crie o pacote JAR ou WAR, dependendo do tipo de projeto
RUN mvn package -DskipTests

# Use uma imagem base do OpenJDK para executar o aplicativo
# FROM jelastic/maven:3.9.5-openjdk-21
FROM adoptopenjdk:11-jre-hotspot-focal

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo JAR ou WAR construído a partir do estágio de construção anterior
COPY --from=build /app/target/*.jar /app/app.jar

# Comando para iniciar a aplicação quando o contêiner for iniciado
CMD ["java", "-jar", "app.jar"]
