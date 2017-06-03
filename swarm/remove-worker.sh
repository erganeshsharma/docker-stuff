#Script to remove worker node from the swarm cluster

for N in $(seq 2 5); do
  export DOCKER_HOST=tcp://node$N:2375
  docker swarm leave --force #removing the worker from the cluster
  unset DOCKER_HOST
  docker node rm --force node$N #deleting the removed worker node from the node list
  echo "node$N has been removed as a worker from the swarm cluster."
done
unset DOCKER_HOST
