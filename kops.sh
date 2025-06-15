#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#source .bashrc


#! /bin/bash
aws configure
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.25.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops
export KOPS_STATE_STORE=s3://anil.flm
#aws ssm get-parameter --name "/aws/service/canonical/ubuntu/server/20.04/stable/current/amd64/hvm/ebs-gp2/ami-id" --region us-east-1 --query "Parameter.Value" --output text
kops create cluster --name anil.k8s.local --zones us-east-1a --master-count=1 --master-size t2.micro --node-count=2 --node-size t2.micro --image ami-054d6a336762e438e
