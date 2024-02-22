FROM ubuntu:20.04

RUN apt-get update && apt-get install -y python3-pip

RUN mkdir /function && \
  pip install --target /function awslambdaric

COPY lambda_function.py /function/

COPY ./entry_script.sh /entry_script.sh
ADD ./aws-lambda-rie /usr/bin/aws-lambda-rie

WORKDIR /function

ENTRYPOINT [ "/entry_script.sh" ]

CMD [ "lambda_function.lambda_handler" ]