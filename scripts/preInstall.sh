#set env vars
#set -o allexport; source .env; set +o allexport;

# mkdir -p ./data
# chown -R 1000:1000 ./data

cat /opt/elestio/startPostfix.sh > post.txt
filename="./post.txt"

SMTP_LOGIN=""
SMTP_PASSWORD=""

# Read the file line by line
while IFS= read -r line; do
  # Extract the values after the flags (-e)
  values=$(echo "$line" | grep -o '\-e [^ ]*' | sed 's/-e //')

  # Loop through each value and store in respective variables
  while IFS= read -r value; do
    if [[ $value == RELAYHOST_USERNAME=* ]]; then
      SMTP_LOGIN=${value#*=}
    elif [[ $value == RELAYHOST_PASSWORD=* ]]; then
      SMTP_PASSWORD=${value#*=}
    fi
  done <<< "$values"

done < "$filename"

cat << EOT >> ./.env

MAIL_FROM=${SMTP_LOGIN}
MAIL_USERNAME=${SMTP_LOGIN}
MAIL_PASSWORD=${SMTP_PASSWORD}
MAIL_HOST=internal-smtp-proxy.elestio.app
MAIL_PORT=24
EOT
