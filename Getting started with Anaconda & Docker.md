## Getting started with Anaconda & Docker
[reference and thanks to Patrick Michelberger](https://medium.com/@patrickmichelberger/getting-started-with-anaconda-docker-b50a2c482139)
### Big picture
Anaconda with its sandboxed environment for scientific python packages and Docker’s containerization technology make a great combination for scalable, reproducible and portable data science deployments.

### Installation 
1. Choose one of the Anaconda images based on your project requirements [https://hub.docker.com/u/continuumio/](https://hub.docker.com/u/continuumio/)
2. Pull the chosen image : ```$ docker pull continuumio/anaconda3```
3. Run the image and start an interactive shell : ```$ docker run -i -t continuumio/anaconda3 /bin/bash```
4. Start Jupyter Notebook : ```$ docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c “/opt/conda/bin/conda install jupyter -y — quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook — notebook-dir=/opt/notebooks — ip=’*’ — port=8888 — no-browser”```
5. Open ```http://localhost:8888``` to view Jupyter notebook.
6. !(Docker cheatsheet)
[https://docs.docker.com/get-started/part2/#recap-and-cheat-sheet-optional]