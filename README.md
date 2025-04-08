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


kubectl config use-context <your-context>
kubectl apply -f kube/

# monitoring
kubectl create configmap logstash-config --from-file=logstash.conf --namespace=kube-system
kubectl apply -f filebeat-daemonset.yaml
kubectl apply -f logstash-deployment.yaml
kubectl apply -f elasticsearch-statefulset.yaml
kubectl apply -f kibana-deployment.yaml
kubectl get all -n kube-system



# Monitoring
docker-compose -f docker-compose.override.yml up -d

# Jenkins

# Helm

# Redis
redis-cli -p 6379
redis-cli -p 6380
