# Stage 1 - Build stage
FROM node:20 AS builder

WORKDIR /app

COPY package.json .

COPY app.js .


# Stage 2 - Runtime stage
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app/package.json .
COPY --from=builder /app/app.js .

EXPOSE 3000

CMD ["node", "app.js"]
