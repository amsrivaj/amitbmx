FROM node:18-alpine

# Create app directory
WORKDIR /workspace/output

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm config set registry https://registry.npmjs.org
RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY . .

ENTRYPOINT echo hello medium
