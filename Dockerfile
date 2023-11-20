FROM ubuntu:20.04
RUN apt-get update && apt-get -y full-upgrade
RUN ln -s /usr/share/zoneinfo/Europe/Brussels /etc/localtime && echo "Europe/Brussels" > /etc/timezone
RUN apt-get -y install software-properties-common && add-apt-repository universe && apt-get update
RUN apt-get -y install git python2 liblapacke-dev
RUN apt-get -y install curl
RUN curl "https://bootstrap.pypa.io/pip/2.7/get-pip.py" --output get-pip.py && python2 get-pip.py && rm get-pip.py
RUN apt-get -y install python-numpy
RUN apt-get -y install gcc
RUN apt-get -y install python-dev
RUN apt-get -y install libopenblas-dev
RUN apt-get -y install libgfortran-10-dev
RUN apt-get -y install gfortran
RUN apt-get -y install vim
RUN apt-get -y install python3-pip
RUN pip3 install h5py
RUN pip3 install scipy
RUN pip3 install phonopy==2.4.1
#RUN pip install spglib==1.13.0.post6
RUN CONDA_PREFIX="" pip3 install phono3py==1.18.1
RUN useradd -ms cmt
USER cmt
WORKDIR /home/cmt
RUN git clone https://github.com/amiir94/kcm_script.git
