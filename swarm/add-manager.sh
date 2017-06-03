#Running this script from a manager node, in this case node1
#Adding nodes from node2 to node5 as a manager/leader in the cluster

TOKEN=$(docker swarm join-token -q manager)
for N in $(seq 2 5); do
	export DOCKER_HOST=tcp://node$N:2375
	docker swarm join --token $TOKEN node1:2377
	echo "node$N has been added as a manager/leader in the cluster."	
done
unset DOCKER_HOST
