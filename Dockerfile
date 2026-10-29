FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

# Install production dependencies, then remove unused package managers.
RUN npm ci --omit=dev \
    && rm -rf /usr/local/lib/node_modules/npm /opt/yarn-*

COPY src/ ./src/

USER node

EXPOSE 3000

CMD ["node", "src/server.js"]
