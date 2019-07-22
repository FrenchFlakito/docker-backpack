FROM ubuntu:18.04
LABEL version="0.0"

RUN mkdir /backpack
WORKDIR /backpack

COPY requirements.txt .

RUN apt-get update \
&& apt-get install -y python3-pip python3-dev python3-venv \
&& pip3 install -r requirements.txt

RUN python3 -m venv --system-site-package myenv1 myenv2 myenv3 myenv4 \
# ----- install sk-learn - version specific for env1 ----- 
&& . /backpack/myenv1/bin/activate \
&& pip3 install scikit-learn==0.21.2 \
&& python -m ipykernel install --user --name=myenv1 \
&& deactivate \
# ----- install sk-learn - version specific for env2 ----- 
&& . /backpack/myenv2/bin/activate \
&& pip3 install scikit-learn==0.20.2 \
&& python -m ipykernel install --user --name=myenv2 \
&& deactivate \
# ----- install sk-learn - version specific for env3 ----- 
&& . /backpack/myenv3/bin/activate \
&& pip3 install scikit-learn==0.19.2 \
&& python -m ipykernel install --user --name=myenv3 \
&& deactivate \
# ----- install sk-learn - version specific for env4 ----- 
&& . /backpack/myenv4/bin/activate \
&& pip3 install scikit-learn==0.18.2 \
&& python -m ipykernel install --user --name=myenv4 \
&& deactivate

# RUN mkdir /backpack/public
# VOLUME . /backpack/public