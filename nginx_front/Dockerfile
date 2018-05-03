FROM debian:jessie

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
COPY nginx.conf /etc/nginx/
COPY app.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app
RUN rm /etc/nginx/sites-enabled/default

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
