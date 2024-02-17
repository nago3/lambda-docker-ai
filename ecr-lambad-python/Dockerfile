# Python 3.12 Lambdaランタイムのベースイメージを指定
FROM public.ecr.aws/lambda/python:3.12

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y wget
RUN pip install --no-cache-dir tensorflow==2.6.0

WORKDIR /var/task
COPY lambda_function.py .

RUN pip install awslambdaric

# Dockerコンテナの起動時に実行されるコマンドを指定
CMD ["lambda_function.lambda_handler"]


