# Docker image building and pushing
docker build -t binhrobles/complex-client -f ./client/Dockerfile ./client
docker build -t binhrobles/complex-server -f ./server/Dockerfile ./server
docker build -t binhrobles/complex-worker -f ./worker/Dockerfile ./worker
docker push binhrobles/complex-client
docker push binhrobles/complex-server
docker push binhrobles/complex-worker

# Kubernetes configuration applying
kubectl apply -f k8s

kubectl rollout restart deployment/client-deployment
