## Getting started with Anaconda & Docker
[reference and thanks to Patrick Michelberger](https://medium.com/@patrickmichelberger/getting-started-with-anaconda-docker-b50a2c482139)
### Big picture
Anaconda with its sandboxed environment for scientific python packages and Docker’s containerization technology make a great combination for scalable, reproducible and portable data science deployments.

### Installation 
1. Choose one of the Anaconda images based on your project requirements [https://hub.docker.com/u/continuumio/](https://hub.docker.com/u/continuumio/)
2. Pull the chosen image : ```$ docker pull continuumio/anaconda3```
3. Run the image and start an interactive shell : ```$ docker run -i -t continuumio/anaconda3 /bin/bash```
4. Start Jupyter Notebook : ```docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"```
5. Open ```http://localhost:8888``` to view Jupyter notebook.
6. Docker Cheatsheet
```Bash
docker build -t friendlyhello .  # Create image using this directory's Dockerfile
docker run -p 4000:80 friendlyhello  # Run "friendlyname" mapping port 4000 to 80
docker run -d -p 4000:80 friendlyhello         # Same thing, but in detached mode
docker container ls                                # List all running containers
docker container ls -a             # List all containers, even those not running
docker container stop <hash>           # Gracefully stop the specified container
docker container kill <hash>         # Force shutdown of the specified container
docker container rm <hash>        # Remove specified container from this machine
docker container rm $(docker container ls -a -q)         # Remove all containers
docker image ls -a                             # List all images on this machine
docker image rm <image id>            # Remove specified image from this machine
docker image rm $(docker image ls -a -q)   # Remove all images from this machine
docker login             # Log in this CLI session using your Docker credentials
docker tag <image> username/repository:tag  # Tag <image> for upload to registry
docker push username/repository:tag            # Upload tagged image to registry
docker run username/repository:tag                   # Run image from a registry
```
