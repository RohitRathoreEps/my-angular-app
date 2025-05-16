# Step 1: Build the Angular app
FROM node:20 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Step 2: Use Nginx to serve the built app
FROM nginx:alpine
COPY --from=build /app/dist/<your-app-name> /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
