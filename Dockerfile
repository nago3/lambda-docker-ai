FROM python:3.9-slim

WORKDIR /var/task
COPY main.py .

RUN pip install awslambdaric

ENTRYPOINT ["/usr/local/bin/python", "-m", "awslambdaric"]
CMD ["main.handler"]