# Use a base image with Java installed (e.g., OpenJDK)
FROM openjdk:17-alpine

# Set the working directory
WORKDIR /app

# Copy the petclinic.war file into the container
COPY target/petclinic.war .

# Expose the port your application will run on (e.g., 8080)
EXPOSE 8080

# Command to run when the container starts
CMD ["java", "-jar", "petclinic.war"]