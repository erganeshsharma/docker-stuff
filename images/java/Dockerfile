# Use an official openjdk image with an alpine flavor as a base image
FROM openjdk:alpine

# Set the maintainer name and email id
MAINTAINER Ganesh Sharma <ganeshsharmait@gmail.com>

# Copy the current directory contents into the container at /usr/src/myapp
COPY . /usr/src/myapp

# Set the working directory to /usr/src/myapp
WORKDIR /usr/src/myapp

# Compile the java program while building the image
RUN javac Main.java

# Run the compiled java program when the container launches
CMD ["java", "Main"]

