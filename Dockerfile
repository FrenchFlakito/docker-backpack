FROM ubuntu:18.04
LABEL purpose="Data scientist base backpack" \
      version="0.0"

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
&& deactivate
# ----- install sk-learn - version specific for env1 ----- 
&& . /backpack/myenv1/bin/activate \
&& pip3 install scikit-learn==0.20.2 \
&& deactivate
# ----- install sk-learn - version specific for env1 ----- 
&& . /backpack/myenv1/bin/activate \
&& pip3 install scikit-learn==0.19.2 \
&& deactivate
# ----- install sk-learn - version specific for env1 ----- 
&& . /backpack/myenv1/bin/activate \
&& pip3 install scikit-learn==0.28.2 \
&& deactivate


# CMD jupyter notebook -p 8888 --ip 0.0.0.0 --no-browser --allow-root
CMD bash
