# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
ENV NODE_ENV=production

FROM nginxinc/nginx-unprivileged  as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 770 /var/cache/nginx /var/run /var/log/nginx

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]