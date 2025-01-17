# Use an official Node.js image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install project dependencies
RUN npm install -g gulp

# Install PM2 globally
RUN npm install -g pm2

# Copy the rest of the application code to the working directory
COPY . .

# Expose any necessary ports (adjust as needed)
EXPOSE 3000

# Start the Angular application using PM2
CMD ["pm2-runtime", "start", "npm", "--", "start", "angularjs-realworld-example-app/src/index.html"]
