# Base image
FROM node:18-alpine

# Set workdir
WORKDIR /app

# Copy app files
COPY server.js .

# Install express
RUN npm install express

# Expose port
EXPOSE 8080

# Add healthcheck
HEALTHCHECK CMD curl --fail http://localhost:8080/health || exit 1

# Run app
CMD ["node", "server.js"]
