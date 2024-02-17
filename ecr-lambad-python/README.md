# ecr-lambda-python

Use Lambda container ECR image:python

## Local test

### Run container

```
$ docker run --rm -v /path/to/dir:/var/task:ro,delegated -p 9000:8080 public.ecr.aws/lambda/python:3.12 lambda_function.lambda_handler
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
