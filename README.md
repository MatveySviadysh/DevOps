# Docker
docker-compose up --build
docker-compose down
docker build -t m-project .
docker exec -it devops-nginx-server-1 sh

# Kubernetes
kubectl get deployments
kubectl get services
kubectl apply -f nginx-server.yaml
kubectl get pods
kubectl get services
kubectl delete -f nginx-server.yaml
kubectl port-forward pod/nginx-server-96b9d695-g8fmm 8080:80

# Monitoring
docker-compose -f docker-compose.override.yml up -d

# Jenkins

# Helm

# Redis
redis-cli -p 6379
redis-cli -p 6380
