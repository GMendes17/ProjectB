É necessário criar a swarm e adicionar os nós

no nó manager 

cd /vagrant
sudo docker stack deploy -c docker-compose.yml cloud
