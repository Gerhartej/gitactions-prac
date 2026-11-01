# ==========================================
# STAGE 1: Install production dependencies
# ==========================================
FROM node:22-alpine AS dependencies

WORKDIR /app

# Copy dependency manifests
COPY package*.json ./

# Install production dependencies only
RUN npm ci --omit=dev


# ==========================================
# STAGE 2: Production runtime
# ==========================================
FROM node:22-alpine AS runtime

WORKDIR /app

# Remove package managers from the final runtime image.
# npm was only needed in the dependencies stage.
RUN rm -rf /usr/local/lib/node_modules/npm /opt/yarn-* \
    && rm -f /usr/local/bin/npm /usr/local/bin/npx \
              /usr/local/bin/yarn /usr/local/bin/yarnpkg

# Copy production dependencies from stage 1
COPY --from=dependencies --chown=node:node /app/node_modules ./node_modules

# Copy application source code
COPY --chown=node:node src/ ./src/

# Run as a non-root user
USER node

# Application port
EXPOSE 3000

# Start the application directly with Node.js
CMD ["node", "src/server.js"]
