FROM python:3.7.8

EXPOSE 80

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
RUN python3 -m pip install --no-cache-dir --upgrade pip
RUN python3 -m pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . .

CMD ["panel", "serve", "/code/gradient_descent", "--address", "0.0.0.0", "--port", "80",  "--allow-websocket-origin", "*"]

RUN mkdir /.cache
RUN chmod 777 /.cache