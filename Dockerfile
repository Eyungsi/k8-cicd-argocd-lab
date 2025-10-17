# 1) Use a tiny, fast web server
FROM nginx:alpine

# 2) Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# 3) Copy your app (repo-root/application/ -> Nginx document root)
COPY static-resume-main/* /usr/share/nginx/html/

RUN chown -R nginx:nginx /usr/share/nginx/html
USER nginx

# 5) Expose port 80 (HTTP)
EXPOSE 80

# 6) Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
