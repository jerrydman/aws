#Script to Update AWS Access Keys


username=""
region=""
profile=""

#Get Old Key
oldkey=$(aws iam list-access-keys --user-name $username --profile $profile | jq  -r '.AccessKeyMetadata[].AccessKeyId')

#Create New Sercret Access Key
newSecretAccessKey=$(aws iam create-access-key --user-name $username --profile $profile | jq  -r '.AccessKeyMetadata[].SecretAccessKey')
newAccessKeyID=$(aws iam create-access-key --user-name $username --profile $profile | jq  -r '.AccessKeyMetadata[].AccessKeyId')

echo "The following are your new keys please put them somewhere safe"
echo $newAccessKeyID
echo $newSecretAccessKey

#Deactivate Old Key
aws iam update-access-key --access-key-id $oldkey --status Inactive --user-name $username --profile $profile

#Delete old key Commented out as the user can login and do it or uncomment to do it automatically 
#aws iam delete-access-key --access-key-id $oldkey --user-name $username --profile $profile
