# Stage 1: Nginx ile statik siteyi serve et
FROM nginx:alpine

# Nginx config - static site için optimize
COPY nginx.conf /etc/nginx/nginx.conf

# Statik dosyaları kopyala
COPY index.html /usr/share/nginx/html/
COPY 404.html /usr/share/nginx/html/
COPY favicon.svg /usr/share/nginx/html/
COPY logo.png /usr/share/nginx/html/
COPY logo.jpeg /usr/share/nginx/html/
COPY sticky-logo.png /usr/share/nginx/html/
COPY IMG_0585.JPG /usr/share/nginx/html/

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://127.0.0.1/ || exit 1

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
