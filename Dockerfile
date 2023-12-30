# Use an official Node.js image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Install PM2 globally
RUN npm install -g pm2

# Expose any necessary ports (adjust as needed)
EXPOSE 3000

# Start the Angular application using PM2
CMD ["pm2", "start", "ng", "--", "serve", "--host", "0.0.0.0", "--port", "3000"]
