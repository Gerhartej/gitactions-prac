FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy dependency manifests first for better build caching
COPY package*.json ./

# Install production dependencies only
RUN npm ci --omit=dev

# Copy the application source code
COPY src/ ./src/

# Run as a non-root user
USER node

# Document the port used by the API
EXPOSE 3000

# Start the API
CMD ["npm", "start"]
