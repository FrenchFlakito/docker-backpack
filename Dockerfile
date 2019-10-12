FROM ubuntu:18.04
LABEL version="0.0"

RUN mkdir /backpack
WORKDIR /backpack

COPY requirements.txt .

RUN apt-get update \
&& apt-get install -y python3-pip python3-dev python3-venv \
&& pip3 install -r requirements.txt

RUN python3 -m venv --system-site-package myenv \
# ----- install sk-learn ------ 
&& . /backpack/myenv/bin/activate \
&& pip3 install scikit-learn==0.21.2 \
&& python -m ipykernel install --user --name=myenv \
&& deactivate \
&& mkdir -p requirements.txt ~/archived/requirements.txt
