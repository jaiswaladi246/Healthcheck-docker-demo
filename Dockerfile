# Base image
FROM node:18-alpine

# Set workdir
WORKDIR /app

# Copy app files
COPY server.js .

# Install curl and express
RUN apk add --no-cache curl && npm install express

# Expose port
EXPOSE 8080

# Add healthcheck
HEALTHCHECK CMD curl --fail http://localhost:8080/health || exit 1

# Run app
CMD ["node", "server.js"]
