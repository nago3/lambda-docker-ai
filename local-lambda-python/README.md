# local-lambda-python

This is sample ai infrastructure on AWS Lambda.

## TensorFlow versions

Check [here](https://hub.docker.com/r/tensorflow/tensorflow/tags?page=1&name=py3)

## Commands

### Image build

```
$ docker build -t lambda-python:latest .
```

### Run Container

```
$ docker run --rm -p 9000:8080 local-lambda-python:latest lambda_function.lambda_handler
```

### Run test

```
$ curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```
