FROM arm64v8/nginx:stable-alpine AS base
EXPOSE 80

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY src /bin/www
COPY GIT GIT

CMD [ "nginx", "-g", "daemon off;" ]