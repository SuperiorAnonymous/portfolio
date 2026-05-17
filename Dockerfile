# ============================================
# Portfolio — Nginx Alpine Dockerfile
# ============================================
FROM nginx:alpine

# Nginx config copy
COPY nginx.conf /etc/nginx/nginx.conf

# Static site fayllarını container-a kopyala
COPY . /usr/share/nginx/html

# Lazımsız faylları sil (Docker-specific)
RUN rm -f /usr/share/nginx/html/Dockerfile \
         /usr/share/nginx/html/nginx.conf \
         /usr/share/nginx/html/.github

# Port 80 aç
EXPOSE 80

# Nginx foreground-da işlə
CMD ["nginx", "-g", "daemon off;"]
