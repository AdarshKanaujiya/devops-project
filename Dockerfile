# Step 1: Choose the base environment
FROM node:20-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy project files into the container
COPY . .

# Step 4: Install dependencies (change this based on your language)
RUN npm install

# Step 5: Define the command to run your app
CMD ["npm", "start"]



# docker build -t devops-site .
# docker run -d -p 8080:80 devops-site