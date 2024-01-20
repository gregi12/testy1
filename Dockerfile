FROM python:3.9-slim as compiler

# Sets an environmental variable that ensures output from python is sent straight to the terminal without buffering it first
ENV PYTHONUNBUFFERED 1
# Sets the container's working directory to /app
WORKDIR /app
RUN pip install -r requirements.txt
# Copies all files from our local project into the container
COPY . /app
# Expose the port the app will run on
EXPOSE 8000
