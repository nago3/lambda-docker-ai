# Python 3.12 Lambdaランタイムのベースイメージを指定
FROM public.ecr.aws/lambda/python:3.12

WORKDIR /var/task
COPY lambda_function.py .

RUN pip install awslambdaric

# Dockerコンテナの起動時に実行されるコマンドを指定
CMD ["lambda_function.lambda_handler"]

# ENTRYPOINT ["/usr/local/bin/python", "-m", "awslambdaric"]
