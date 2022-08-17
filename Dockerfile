# docker build --no-cache --pull --platform {linux/arm64} -t kennycallado/portafolio:v{X}{-arm64} .
FROM nginx:alpine

COPY dist /usr/share/nginx/html/
