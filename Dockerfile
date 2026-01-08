# Use a small, stable nginx base image
FROM nginx:stable-alpine

# Metadata
LABEL maintainer="you@example.com"

# Set working dir to nginx's default web root
WORKDIR /usr/share/nginx/html

# Copy your index.html into the image
COPY index.html /usr/share/nginx/html/

# Expose the default HTTP port
EXPOSE 80

# Optional healthcheck to ensure nginx serves pages
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# The base image already sets a suitable CMD to run nginx in the foreground