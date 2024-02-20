# local-lambda-sample

Sample code for run AWS Lambda local env.

## Commands

### Image build

```
$ docker build -t local-lambda:latest .
```

### Run Container

```
$ docker run --rm -p 9000:8080 local-lambda:latest lambda_function.lambda_handler
```

### Run test

```
$ curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```
