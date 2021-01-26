FROM node:lts-buster as nodebuild
WORKDIR /build/
COPY . /build/
RUN yarn && yarn add passport
RUN yarn run build
FROM nginx
COPY --from=nodebuild /build/dist/ /usr/share/nginx/html/
