#Script to remove manager node from the swarm cluster
#Cluster manager must be demote to worker before removal.
for N in $(seq 2 5); do
  #demoting the manager node to worker node before deleting
  docker node demote node$N	
  export DOCKER_HOST=tcp://node$N:2375
  docker swarm leave --force #removing the manager node from the cluster
  unset DOCKER_HOST
  docker node rm --force node$N #deleting the manager node from the node list
  echo "node$N has been removed as a manager from the swarm cluster."
done
unset DOCKER_HOST
