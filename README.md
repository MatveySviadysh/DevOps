# docker
docker-compose up --build
docker bild -t m-project .


# kube
kubectl get deployments
kubectl get services


kubectl apply -f nginx-server.yaml
kubectl get pods
kubectl get services
kubectl delete -f nginx-server.yaml

kubectl port-forward pod/nginx-server-96b9d695-g8fmm 8080:80



# monitoring
docker-compose -f docker-compose.override.yml up -d


# jenkins

#helm
