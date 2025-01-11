# Use the official Go image as a base image
FROM golang:1.20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy Go modules and dependencies first (for caching)
COPY go.mod go.sum ./

# Download all dependencies
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go application
RUN go build -o main .

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["./main"]
