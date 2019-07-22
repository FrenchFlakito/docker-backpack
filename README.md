# dockerized-sklearn-envs 

## A Docker image with 4 latest versions of sk-learn

### **Set-up**
- Docker must be installed on your machine
- git clone this repo
- run the following commands from inside

### **Set-up**
- Create image from Dockerfile (along with the "requirements.txt" file)

$ ```docker image build -t [name_for_your_space] .```

Create a container based on this image

$ ```docker container run -dit [image_name_you_chose] .```

A container should have been created and should be running in the background. You can check (and learn the id of this container) with :

$ ```docker ps```