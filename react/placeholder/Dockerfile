FROM nginx:stable-alpine AS base
EXPOSE 80

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY src /bin/www

CMD [ "nginx", "-g", "daemon off;" ]