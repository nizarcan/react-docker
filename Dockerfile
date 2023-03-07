# APP BUILDER
FROM node:17-alpine as BUILDER
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build

# SERVER
FROM nginx:1.21.3-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=BUILDER /app/build .
ENTRYPOINT ["nginx", "-g", "daemon off;"]