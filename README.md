# CI/CD Pipeline Example

This repository demonstrates a full CI/CD workflow using:
- GitHub
- GitHub Actions
- Jenkins
- Docker
- Docker Hub

## Steps

1. Push code to GitHub → triggers GitHub Action (tests).
2. Jenkins webhook triggers → builds and pushes Docker image to Docker Hub.
3. Jenkins deploys latest image using `deploy.sh`.

Update `yourusername` and credentials in Jenkinsfile and deploy.sh.
