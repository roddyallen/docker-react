# Phase 1 -- builder phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Phase 2 -- run phase 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#COPY --from=0 /app/build /usr/share/nginx/html