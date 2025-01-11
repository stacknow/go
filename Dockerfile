# Use the official Go image as a base image
FROM golang:1.20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod only
COPY go.mod ./

# Install dependencies (go.sum will be skipped if missing)
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go application
RUN go build -o main .

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["./main"]
