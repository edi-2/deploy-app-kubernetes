echo "Criando as imagens"

docker build -t edi2/projeto-backend:1.0 backend/.
docker build -t edi2/projeto-database:1.0 database/.

echo "Realizando o push das imagens"

docker push edi2/projeto-backend:1.0
docker push edi2/projeto-database:1.0

echo "Criando servições no cluster kubernetes"

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./deployment.yml