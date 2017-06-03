#Script to add the nodes as a worker node to the swarm cluster

TOKEN=$(docker swarm join-token -q worker)
for N in $(seq 2 5); do
	export DOCKER_HOST=tcp://node$N:2375
	docker swarm join --token $TOKEN node1:2377
	echo "node$N has been added as a worker in the cluster."
done
unset DOCKER_HOST
