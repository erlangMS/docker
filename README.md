Para gerar a imagem: 

docker build . -t barramento:1.0

Para adicionar outra TAG: 

docker tag barramento:1.0 barramento:latest

Gerar o stack de serviços: 

docker swarm init

Gerar o network: 

docker network create -d overlay barramento

docker stack deploy -c docker-compose.yml emsbus


Comando para subir o container docker

docker-compose up -d

comando para gerar o container compilado

docker save barramento:latest -o barramento_latest.tar

comando para parar o docert

docker stop

Comando para deletar o docker

docker down
