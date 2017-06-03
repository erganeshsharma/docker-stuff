#Script to promote the worker nodes into the manager nodes

for N in $(seq 2 5); do
  docker node promote node$N
  echo "node$N has been promoted to manager."
done
unset DOCKER_HOST
