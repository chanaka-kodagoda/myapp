#!/bin/bash
set -e
echo "Deploying latest image..."
docker stop myapp || true
docker rm myapp || true
docker pull chanakakodagoda/myapp:latest
docker run -d --name myapp -p 80:3000 chanakakodagoda/myapp:latest
echo "✅ Deployment complete. App running on port 80."
