#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 90s;

docker-compose down;
docker-compose up -d;

sleep 120s;

target=$(docker-compose port gateway 7538)

curl 'https://'${DOMAIN}'/api/v1/register' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36' \
  -H 'x-front-version: v0.99.1-beta+1631.5934942576.2bf3684b35e428c284be680a05872cd1ba5aa615' \
  -H 'x-xsrf-token: 78a3f04f-dfdd-47a9-a3bc-a1d4ef3b5bb1' \
  --data-raw '{"username":"'${ADMIN_EMAIL}'","credential":"'${ADMIN_EMAIL}'"}' \
  --compressed