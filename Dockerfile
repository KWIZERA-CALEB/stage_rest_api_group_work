# Use the official Bun image as the base
FROM oven/bun:1 AS base
WORKDIR /usr/src/app

# Install dependencies
COPY package.json bun.lockb ./
RUN bun install --production

# Copy the rest of the application code
COPY . .

# Run as non-root user for security
USER bun
EXPOSE 3000

# Start the app
ENTRYPOINT ["bun", "run", "server.js"]