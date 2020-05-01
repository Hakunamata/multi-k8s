docker build -t hakunamatata007/multi-client:latest -t hakunamatata007/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hakunamatata007/multi-server:latest -t hakunamatata007/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t hakunamatata007/multi-worker:latest -t hakunamatata007/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push hakunamatata007/multi-client:latest
docker push hakunamatata007/multi-client:$SHA
docker push hakunamatata007/multi-server:latest
docker push hakunamatata007/multi-server:$SHA
docker push hakunamatata007/multi-worker:latest
docker push hakunamatata007/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=hakunamatata007/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=hakunamatata007/multi-worker:$SHA
kubectl set image deployments/client-deployment client=hakunamatata007/multi-client:$SHA
