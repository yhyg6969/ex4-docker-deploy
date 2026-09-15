FROM nginx:1.31.3-alpine

# html 폴더 안의 index.html을 컨테이너 내부로 복사
COPY ./html/index.html /usr/share/nginx/html/index.html

# images 폴더 복사
COPY ./images /usr/share/nginx/html/images

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
