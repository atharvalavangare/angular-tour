# Step 1: Build Angular App
FROM node:18 as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod
RUN ls -l /app/dist # Debugging step to list the files in dist

# Step 2: Use Nginx to Serve Angular App
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/* # Remove default Nginx content
COPY --from=builder /app/dist/angular-tour-of-heroes/browser /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
