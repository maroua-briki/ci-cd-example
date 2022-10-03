# stage 1

FROM node:alpine AS ci-cd-app
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM ci-cd-app
COPY --from=ci-cd-app /app/dist/ci-cd-example /usr/share/nginx/html
EXPOSE 80
