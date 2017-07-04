# To run Docker on a Laptop

__Install Docker__
* Download and install community edition binary from the [docker store.](https://store.docker.com/search?offering=community&type=edition)
* To quickly install Docker on Ubuntu 16.04 or higher, use the following command :
    ```sh
        $ sudo apt-get update
        $ curl -fsSL https://get.docker.com/ | sh
    ```
* To quickly install Docker on [other distribution](https://docs.docker.com/engine/installation/)
* To verify Docker availability, use the following command : 
    ```sh
    $ sudo docker version
    ```
* If you don't want to use `sudo` with `docker` command, then create a Unix group called `docker` and add users to it.
    * To create the `docker` group.
        ```sh
        $ sudo groupadd docker    
        ```
    * To add the user to the `docker` group.
        ```sh
        $ sudo usermod -aG docker $USER
        ```
    * Log out and log back in so that your group membership is re-evaluated.
    * Now verify that you can run `docker` command without `sudo`.
        ```sh
        $ docker container run hello-world
        ```
__Other References__ :
* Official Docker docs [here](https://docs.docker.com/).
* Docker docs on [github](https://github.com/docker/docker.github.io).