# Anne Huntington Laboratory Corporate Website Dockerfile
# Simple static site server using Express.js

FROM node:18-alpine AS base

# Install dependencies only when needed
FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm ci --only=production

# Production image
FROM base AS runner
WORKDIR /app

ENV NODE_ENV production

# Install curl for health checks
RUN apk add --no-cache curl

# Create app user following AHL Docker standards
ARG APP_UID=10016
RUN addgroup --system --gid ${APP_UID} ahl && \
    adduser --system --uid ${APP_UID} ahl --ingroup ahl

# Copy dependencies and application files
COPY --from=deps --chown=ahl:ahl /app/node_modules ./node_modules
COPY --chown=ahl:ahl . .

USER ahl

EXPOSE 3021

ENV PORT 3021
ENV HOSTNAME "0.0.0.0"

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:3021/health || exit 1

CMD ["node", "server.js"]
