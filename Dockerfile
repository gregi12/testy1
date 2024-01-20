FROM python:3.9-slim as compiler
ENV PYTHONUNBUFFERED 1

WORKDIR /app/

RUN python -m venv /opt/env
# Enable env
ENV PATH="/opt/env/bin:$PATH"

COPY ./requirements.txt /app/requirements.txt
RUN pip install -Ur requirements.txt

FROM python:3.9-slim as runner
WORKDIR /app/
COPY --from=compiler /opt/env /opt/env

# Enable venv
ENV PATH="/opt/env/bin:$PATH"
COPY . /app/

