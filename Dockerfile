# Stage 1: Build Angular application
FROM node:14 as builder

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./


# Copy the source code
COPY . .

# Build the Angular app
RUN npm run build -- --output-path=./dist

# Stage 2: Serve Angular app with Nginx
FROM nginx:latest

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy built Angular app from the previous stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom nginx configuration (if needed)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose the default Nginx port (80)
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
