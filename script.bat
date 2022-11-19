echo "Criando as imagens............."

docker build -t fabiopalma/projeto-backend:1.0 backend/.
docker build -t fabiopalma/projeto-database:1.0 database/.

echo "Realizando push das imagens............"

docker push fabiopalma/projeto-backend:1.0
docker push fabiopalma/projeto-database:1.0

echo "Criando serviços no cluster kubernetes......."


kubectl apply -f ./services.yml

echo "Criando o deployments ......."

kubectl apply -f ./deployment.yml