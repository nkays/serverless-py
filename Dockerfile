# which version of python
FROM python:3.11-slim

# which code and docs
# COPY local_dir container_dir
# COPY requirements.txt /app/requirements.txt # if requirements is not in src folder
COPY ./src /app/
WORKDIR /app/

#defalt installs
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    python3-dev \
    python3-setuptools \
    gcc \ 
    make
    
# create a virtualenv
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/python -m pip install pip --upgrade && \
    /opt/venv/bin/python -m pip install /app/requirements.txt

    # run the app
    CMD ["./entrypoint.sh"]