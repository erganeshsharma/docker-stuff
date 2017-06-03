# Building first Containerized java image

In order to build our java image, we'll be needing two files :
- Dockerfile
- Main.java

Here we'll be using *Dockerfile* to create the image containing of a *Main.java* file in it.
### Step 1: Creating the files.

Create a new directory.
```sh
$ mkdir java-sample
```
Change to that directory.
```sh
$ cd java-sample
```
Create a file called *Dockerfile* and add the following code into it.
```sh
# Use an official openjdk image with an alpine flavor as a base image
FROM openjdk:alpine

# Set the maintainer name and email id
MAINTAINER Your Name <your-email-id@domain.com>

# Copy the current directory contents into the container at /usr/src/myapp
COPY . /usr/src/myapp

# Set the working directory to /usr/src/myapp
WORKDIR /usr/src/myapp

# Compile the java program while building the image
RUN javac Main.java

# Run the compiled java program when the container launches
CMD ["java", "Main"]
```
Now create a new file called *Main.java* in the same directory and add the following code into it.
```sh
import java.io.*;
public class Main {
	public static void main(String args[]){

		System.out.println("Printing pyramid of stars!\n");
		int i,j,k;

		for (i=1; i<=10; i++){
			for (j=10; j>=i; j--)
				System.out.print(" ");
			for (k=1; k<=i; k++)
				System.out.print("* ");
			System.out.println("");
		}

		System.out.println("\n....... Done .......");
	}
}
```
Now as we have got both the files in the same directory, lets create the image now.
### Step 2 : Creating the image.
#### Use the following command to build the image : 
```sh
$ docker image build -t your-image-name .
or
$ docker build -t your-image-name .
```
Please don't forget to add a . (dot) at the end.

#### If you get errors like *permission denied*, try it again using *sudo* like
```sh
# To avoid permission denied problem, prefix sudo in every commands
$ sudo docker image build -t your-image-name .
or
$ sudo docker build -t your-image-name .
```
On terminal, Docker automatically detects whether you are working with containers or images, so it's not neccessary to include *image* or *container* in your commands. But I stick to it and use it where ever it fits to make my code more readable and easy to debug.

#### Now you can check your image by listing all the images:
```sh
$ docker image ls
or 
$ docker images
```
#### If the list is too long, containing all of your images. You can use *grep* to get the required image only.
```sh
$ docker image ls | grep your-image-name
or
$ docker images | grep your-image-name
```
You'll get details about the image like - *Name*, *Tag*, *ID*, *Time*, and most importantly *Size*.

#### If you are interested to know more about the image, you can try the following command:
```sh
$ docker image inspect your-image-name
or
$ docker inspect your-image-name
```
You'll get a detailed information about the image. It's a lot of information, what if you need only the author name of the image, well you can do that as well using *go template* or *json*.

#### Here is an example to get the *Author* details of an image : 
```sh
$ docker image inspect --format "{{ .Author }}" your-image-name
or
$ docker image inspect --format "{{ json .Author }}" your-image-name | python -m json.tool
```
So this way you can extract other details as well from the image.

Now let's create a container, which will be an instance of your image.
### Step 3 : Creating the Container.
#### Use the following command to create the container : 
```sh
$ docker container run --name your-container-name your-image-name
or
$ docker run --name your-container-name your-image-name
```
Now, you must have seen a Pyramid of Stars! on your terminal.
As our container has a *Java* program which on running prints a *Pyramid of Stars!*.

So, congratulations we have successfully created a container, which on running prints an output on our terminal and then exit.

Let's play with containers now.
#### You can list all the running containers on your host, using the following command :
```sh
$ docker container ls
or
$ docker ps
```
As your container exited after printing the output on your terminal, it's not in running state now, so the above command would not display your container.

#### In order to get the list of all containers including the *Running* and the *Exited* one, you can use the following commands : 
```sh
$ docker container ls -a
or
$ docker ps -a
```

#### This list of all containers might be very long on a production system. So to get the details of specific container, we can use *grep* : 
```sh
$ docker container ls -a | grep your-container-name
or
$ docker ps -a | grep your-container-name
```

#### If you are interested to know more details about the container, then you can use :
```sh
$ docker container inspect your-container-name
or 
$ docker inspect your-container-name
```
#### Again if you are overwhelmed with the information about the containers and you are looking for some specific details about the container, then you can use :
```sh
$ docker container inspect --format "{{ .Config.Image }}" your-container-name
or
$ docker inspect --format "{{ .Config.Image }}" your-container-name
# Using json
$ docker container inspect --format "{{ json .Config.Image }}" your-container-name | python -m json.tool
or 
$ docker inspect --format "{{ json .Config.Image }}" your-container-name | python -m json.tool
```
The above command will display the name of the Image from which the container was instantiated.

### Step 4 : Clean Up
Now let's see how to delete the containers and the images.

Deleting Images will give you an error message, if there are some running containers based on these images. So first we need to stop those containers and then delete the containers and the parent images.

#### Command to stop a running container using container name : 
```sh
$ docker container stop your-container-name
or
$ docker stop your-container-name
```
#### Command to stop a running container using container id :
```sh
$ docker container stop your-container-id
or
$ docker stop your-container-id 
```
#### Command to delete the stoped container using container name : 
```sh
$ docker container rm your-container-name
or
$ docker rm your-container-name
```
#### Command to delete the stoped container using container id : 
```sh
$ docker container rm your-container-id
or
$ docker rm your-container-id
```
#### Command to forcefully delete container :
```sh
$ docker container rm -f container-name
or
$ docker rm -f container-name
or
$ docker container rm -f container-id
or 
$ docker rm -f container-id
```
#### Command to forcefully delete all containers on a host :
```sh
$ docker container rm -f $(docker container ls -aq)
or
$ docker container rm -f $(docker ps -aq)
or
$ docker rm -f $(docker container ls -aq)
or
$ docker rm -f $(docker ps -aq)
```

#### Now deleting images :
```sh
$ docker image rm your-image-name
or
$ docker rmi your-image-name
or
$ docker image rm image-id
or
$ docker rmi your-image-id
```
#### Commands to forcefully delete all images on a host :
```sh
$ docker image rm -f $(docker images -aq)
or
$ docker rmi -f $(docker images -aq)
$ docker image rm -f $(docker image ls -aq)
or
$ docker rmi -f $(docker image ls -aq)
```

Now if you list the images and the containers using :
```sh
$ docker images
$ docker container ls -a
```
You'll see that, there are no images and containers, as all are deleted.

#### For further study about the various docker commands, use :

- Mannuals on terminal like
  ```sh
  $ docker image --help
  $ docker container --help
  $ docker container run --help
  $ docker image build --help
  ```
- Official Documentation [here](https://docs.docker.com/) 
