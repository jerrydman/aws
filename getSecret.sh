#Script to Get AWS Secret and save to variable
#requires jq to parse the json
#Jerry Reid

secretID=""
region=""
profile=""

secretValue=$(aws secretsmanager get-secret-value --secret-id $secretID --region $region --profile $profile | jq -r '.SecretString')
