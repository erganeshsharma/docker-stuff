# Script to demote manager nodes to worker nodes

for N in $(seq 2 5); do
  docker node demote node$N
  echo "node$N has been demoted to worker."
done
unset DOCKER_HOST
