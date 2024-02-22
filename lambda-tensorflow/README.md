# local-lambda-python

This is sample ML infrastructure on AWS Lambda.

## TensorFlow versions

Check [here](https://hub.docker.com/r/tensorflow/tensorflow/tags?page=1&name=py3)

## Commands

### Image build

```
$ docker build -t lambda-tensorflow:latest .
```

### Run Container

```
$ docker run --rm -p 9000:8080 lambda-tensorflow:latest lambda_function.lambda_handler
```

### Run test

```
$ curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```

## Upload commands

0. Login ECR

```
$ aws ecr get-login-password --region <region-name> | docker login --username AWS --password-stdin xxxxxxxxxxxx.dkr.ecr.<region-name>.amazonaws.com
```

1. Image build

```
$ docker build -t <image-name>:latest .
```

2. Add tag

```
$ docker tag <image-name>:latest xxxxxxxxxxxx.dkr.ecr.<region-name>.amazonaws.com/<image-name>:latest
```

3. Run docker container

```
$ docker push xxxxxxxxxxxx.dkr.ecr.<region-name>.amazonaws.com/<image-name>:latest
```

### Update ECR image

_Attention: Create Lambda function -made by container image- before exec command._

```
$ aws lambda update-function-code --function-name <your-function-name> --image-uri <your-ecr-repository-url>/<image-name>:latest
```
