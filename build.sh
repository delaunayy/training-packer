packer plugins install github.com/hashicorp/amazon
packer init training.pkr.hcl
packer validate training.pkr.hcl
packer build training.pkr.hcl -var 'region=eu-west-1' | tee packer_output.txt
ami_id=$(< packer_output.txt tail | awk '$1=="eu-west-1:"{print $2}')
echo "Variable ami id :  $ami_id"
terraform init
terraform validate
terraform apply -auto-approve -var "ami_id=${ami_id}"
public_ip=$(terraform output -json | jq -r '.public_ip.value')

terraform destroy

echo 'Terminé '