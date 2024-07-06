FROM --platform=linux/amd64 node:lts-alpine as BASE
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn --frozen-lockfile

# Build Image
FROM --platform=linux/amd64 node:lts-alpine as BUILD
WORKDIR /app
COPY --from=BASE /app/node_modules ./node_modules
COPY . .
RUN yarn run build \
    && rm -rf node_modules \
    && yarn --prod --frozen-lockfile


# Build production
FROM --platform=linux/amd64 node:lts-alpine as PROD
WORKDIR /app
COPY --from=BUILD /app/node_modules ./node_modules
COPY --from=BUILD /app/dist ./dist
COPY --from=BUILD /app/migrations ./migrations
COPY --from=BUILD /app/.env ./.env

EXPOSE 3000
CMD ["node", "dist/main"]
