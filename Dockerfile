# Use Node 18 (Alpine variant for smaller image)
FROM node:18-alpine

# Create and set work directory
WORKDIR /app

# Globally install pnpm
RUN npm install -g pnpm

# Copy only package files first (better cache)
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --force

# Copy the rest of your code
COPY . .

# If you need a build step:
# RUN pnpm run build

# Expose the port Cloud Run expects (default 8080)
ENV PORT=8080
EXPOSE 8080

# Start command: run "pnpm start" (ensure your "start" script is correct)
CMD ["pnpm", "start"]
