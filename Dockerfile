FROM node:alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


FROM nginx
# Elastic Beanstalk looks for EXPOSEd port
EXPOSE 80 

COPY --from=0 /app/build /usr/share/nginx/html
