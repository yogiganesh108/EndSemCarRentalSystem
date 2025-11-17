
    FROM node:18 AS build-stage
    WORKDIR /app
    
   
    RUN apt-get update && apt-get install -y git
    
   
    RUN git clone https://github.com/yogiganesh108/EndSemCarRentalSystem.git .
    
    RUN npm install
    RUN npm run build

   
    FROM tomcat:9-jdk17
    RUN rm -rf /usr/local/tomcat/webapps/*

    
    COPY --from=build-stage /app/dist /usr/local/tomcat/webapps/ecommerce

    EXPOSE 8082
    CMD ["catalina.sh", "run"]
