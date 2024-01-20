FROM python:3
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app/
RUN venv -p python3 venv
RUN source venv/bin/activate
RUN pip install -r requirements.txt
COPY . /app/
