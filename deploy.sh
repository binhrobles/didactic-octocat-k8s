# Docker image building and pushing
docker build -t binhrobles/complex-client:latest -t binhrobles/complex-client:$SHA \
  -f ./client/Dockerfile ./client
docker build -t binhrobles/complex-server:latest -t binhrobles/complex-server:$SHA \
  -f ./server/Dockerfile ./server
docker build -t binhrobles/complex-worker:latest -t binhrobles/complex-worker:$SHA \
  -f ./worker/Dockerfile ./worker
docker push binhrobles/complex-client:latest
docker push binhrobles/complex-server:latest
docker push binhrobles/complex-worker:latest
docker push binhrobles/complex-client:$SHA
docker push binhrobles/complex-server:$SHA
docker push binhrobles/complex-worker:$SHA

# Kubernetes configuration applying
kubectl apply -f k8s

kubectl set image deployments/client-deployment client=binhrobles/complex-client:$SHA
kubectl set image deployments/server-deployment server=binhrobles/complex-server:$SHA
kubectl set image deployments/worker-deployment worker=binhrobles/complex-worker:$SHA

# could also just use this?
# kubectl rollout restart deployment/client-deployment
