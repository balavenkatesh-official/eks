# Use a lightweight base image
FROM alpine:latest

# Install Python, which includes a simple HTTP server
RUN apk add --no-cache python3

# Create the /var/www directory
RUN mkdir -p /var/www

# Create a simple HTML page with background color #ff5733 and "Hello, World 1"
RUN echo '<!DOCTYPE html><html><head><style>body { background-color: #ff5733; color: white; font-size: 24px; }</style></head><body>Hello, World 1</body></html>' > /var/www/index.html


# Expose port 4242 for the web server
EXPOSE 4242

# Start Python's HTTP server and serve from the correct directory
CMD ["python3", "-m", "http.server", "4242", "--directory", "/var/www"]
