FROM node:20-alpine as builder

COPY package*.json ./
RUN npm ci
COPY tsconfig.json ./tsconfig.json
COPY src ./src/

RUN npm run build

FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production

COPY package*.json ./
RUN npm ci --omit=dev
COPY --from=builder dist/ dist/
COPY migrations ./migrations/

EXPOSE 3000
ENTRYPOINT [ "node", "dist/src/index.js" ]
