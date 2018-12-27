# BUILD phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# RUN phase
FROM nginx as runner
EXPOSE 80
COPY --from=builder app/build /usr/share/nginx/html
# Default: start
