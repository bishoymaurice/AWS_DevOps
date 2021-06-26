FROM nginx:1.21.0

COPY ./app/index.html /usr/share/nginx/html/index.html

RUN pip install pip==19.0.1 --no-cache-dir &&\
RUN pip install -r requirements.txt --no-cache-dir --trusted-host pypi.python.org

EXPOSE 80