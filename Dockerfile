
FROM nginx:latest

# Copy custom configuration file
COPY cloupad.conf.template /etc/nginx/cloupad.conf.template
RUN rm /etc/nginx/conf.d/default.conf
COPY certs /etc/nginx/certs
COPY utils.js /etc/nginx/utils.js

# Expose ports
EXPOSE 80
EXPOSE 443

# Start Nginx
CMD ["/bin/bash",  "-c",  "envsubst < /etc/nginx/cloupad.conf.template > /etc/nginx/conf.d/cloupad.conf && exec nginx -g 'daemon off;'"]
