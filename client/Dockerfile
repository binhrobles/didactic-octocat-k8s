FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . .
# builds artifacts into /app/build
# NOTE: not CMD, because we want this to run during build process
RUN npm run build

# syntax implies this is a new block
FROM nginx
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 3000

# default command of nginx image starts the process
