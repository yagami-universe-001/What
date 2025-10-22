# ===============================
# Dockerfile for What WhatsApp Bot
# ===============================

# Use Node.js LTS base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install git
RUN apk add --no-cache git

# Install dependencies
RUN npm install --force

# Copy all files
COPY . .

# Expose port (if your bot uses any API or dashboard)
EXPOSE 3000

# Run the bot
CMD ["node", "index.js"]
