FROM node:lts AS builder


WORKDIR /usr/src/app


# COPY package*.json ./


# RUN npm ci


COPY . .


# RUN npm run build --prod


FROM nginx:1.19-alpine


RUN rm -rf /usr/share/nginx/html/*


COPY --from=builder /usr/src/app/dist/rework/browser /usr/share/nginx/html


COPY nginx.conf /etc/nginx/nginx.conf


EXPOSE 80
EXPOSE 443
