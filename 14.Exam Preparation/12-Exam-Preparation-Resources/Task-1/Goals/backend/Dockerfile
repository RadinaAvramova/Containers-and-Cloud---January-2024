# Start from latest NODE image
FROM node

# Set the working directory
WORKDIR /app

# Copy all the backend files inside the docker container 
COPY . . 

# Install the package.json dependencies
RUN npm install

# Specify the expose port
EXPOSE 80

# Set the starting script once the container is started
CMD [ "npm", "start" ]
