# Use the official Go image as a base image
FROM golang:1.20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy Go modules and dependencies if they exist
COPY go.mod ./
# Check if go.sum exists before copying (avoid breaking the build if missing)
COPY go.sum ./

# Download dependencies (if go.mod is available)
RUN if [ -f go.mod ]; then go mod download; fi

# Copy the rest of the application source code
COPY . .

# Build the Go application
RUN go build -o main .

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["./main"]
