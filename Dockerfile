FROM node:12-bullseye-slim

# Install dependencies for msnodesqlv8
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    unixodbc \
    unixodbc-dev \
    build-essential \
    python

# Install Microsoft's GPG key
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# Add Microsoft's package repository
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Install msnodesqlv8
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18 mssql-tools18 unixodbc-dev unixodbc
RUN npm install -g node-gyp


# Set the application directory
WORKDIR /app

# Copy package.json and install
COPY package.json .
RUN npm install

# Copy the application files
COPY . .

# Start the application
CMD ["npm", "start"]
