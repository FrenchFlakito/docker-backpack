# dockerized-sklearn-envs 

## A Docker image with 4 latest versions of sk-learn

### **Pre-requisite**
- Docker must be installed on your machine
- ```git clone``` this repo
- run the following commands from inside

### **Set-up**
- Create image from Dockerfile (along with the "requirements.txt" file)

$ ```docker image build -t backpack_image .```

Create a container based on this image

$ ```docker container run -dit --name backpack -v ~/sync:/sync -p 8888:8888 backpack_image.```

A container should have been created and should be running in the background. You can check (and learn the id of this container) with :

$ ```docker ps```

### Launch Jupyter Notebook
- Enter your running container :

$ ```docker container exec -it backpack bash```

- Launch Jupyter Notebook with these notable flags :

$ ```jupyter notebook --ip=0.0.0.0 --no-browser --allow-root```


### Sync-ing files
The ```run``` command above provides a "volume" to share files between host and container.