# Define function directory
ARG FUNCTION_DIR="/function"

FROM tensorflow/tensorflow:1.14.0-py3

# Install aws-lambda-cpp build dependencies
RUN apt-get update && \
  apt-get install -y \
  g++ \
  make \
  cmake \
  unzip \
  libcurl4-openssl-dev \
  libsm6 \
  libxrender1 \
  libxtst6 \

  # Install for vehicle detection
  python3-dev \
  libsm6 \
  libxext6 \
  libxrender-dev \
  libgl1-mesa-dev \
  python3-tk


# Include global arg in this stage of the build
ARG FUNCTION_DIR
# Create function directory
RUN mkdir -p ${FUNCTION_DIR}

# Copy function code
COPY app/app.py ${FUNCTION_DIR}/app.py
# other python file
COPY app/lib/ ${FUNCTION_DIR}/lib/
RUN mv ${FUNCTION_DIR}/lib/*  ${FUNCTION_DIR}


# Install the runtime interface client & other python package
COPY requirements.txt  /
RUN pip install --upgrade pip && \
  pip install awslambdaric && \
  pip install --target ${FUNCTION_DIR} --no-cache-dir -r requirements.txt


# Set working directory to function root directory
WORKDIR ${FUNCTION_DIR}


# (optional) for TEST
COPY aws-lambda-rie /usr/bin/
RUN chmod 755 /usr/bin/aws-lambda-rie


ENTRYPOINT [ "/usr/local/bin/python", "-m", "awslambdaric" ]
CMD [ "app.handler" ]
