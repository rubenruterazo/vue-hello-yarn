FROM node:lts-buster as nodebuild
WORKDIR /build/
COPY . /build/
RUN npm install
RUN npm run build

FROM nginx
COPY --from=nodebuild /build/dist/ /usr/share/nginx/html/
