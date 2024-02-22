FROM ubuntu:20.04

# Set environment variable to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install TensorFlow and its dependencies
RUN apt-get update && apt-get install -y python3-pip python3-dev python3-opencv
RUN pip install --upgrade pip
RUN pip install --no-cache-dir protobuf==3.20.0
RUN pip install --no-cache-dir tensorflow==2.7.0

# Install TensorFlow without GPU support
RUN pip install --no-cache-dir tensorflow-cpu==2.7.0

# Install AWS Lambda runtime interface client for Python
RUN mkdir /function && \
  pip install --target /function awslambdaric

# Copy the Lambda function code
COPY lambda_function.py /function/

# Copy the entry script
COPY ./entry_script.sh /entry_script.sh

# Add the AWS Lambda Runtime Interface Emulator
ADD ./aws-lambda-rie /usr/bin/aws-lambda-rie

# Set the working directory
WORKDIR /function

# Set the entrypoint
ENTRYPOINT [ "/entry_script.sh" ]

# Set the default command
CMD [ "lambda_function.lambda_handler" ]