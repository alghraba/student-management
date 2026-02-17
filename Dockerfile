# Étape 1 : Construction (Build)
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
# Copier le fichier pom.xml et télécharger les dépendances (optimisation du cache)
COPY pom.xml .
RUN mvn dependency:go-offline
# Copier le code source et compiler
COPY src ./src
RUN mvn clean package -DskipTests

# Étape 2 : Exécution (Run)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# Copier uniquement le JAR généré depuis l'étape précédente
COPY --from=build /app/target/*.jar app.jar
# Exposer le port de votre application (généralement 8080)
EXPOSE 8080
# Lancer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
