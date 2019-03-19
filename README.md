# Lets Encrypt with NGINX + AWS EC2

## <b>What is it about?</b>
Example of setting SSL certificate for NGINX server on AWS EC2 instance. 
<br/>

[Terraform code to create EC2](./ec2.tf)


### <b>Step by step</b>
1) Type `terraform init` to initialize all the needed plugins for the terraform
2) Change value of `provider.profile` section so it uses your credentials - [more info](https://www.terraform.io/docs/providers/aws/).
3) Change value of `aws_instance.key_name` section so it uses your key pair - [more info](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair).
4) Type `terraform apply` and confirm with `yes` to create EC2 instance.
5) Use SSH to connect to instance, in my case: `ssh -i "exampleiss.pem" ubuntu@35.161.89.212`. Remember that credentials needs to be readable `chmod 400 key.pem`
6) Install certbot
   
   ```
   sudo apt-get update
   sudo apt-get install software-properties-common
   sudo add-apt-repository universe
   sudo add-apt-repository ppa:certbot/certbot
   sudo apt-get update
   sudo apt-get install certbot
   sudo apt install python-certbot-nginx
    ``` 

7) Run certbot `sudo certbot --nginx` and follow instructions

For nginx configurations etc. You can follow those tutorials 
- [link1](https://gist.github.com/cecilemuller/a26737699a7e70a7093d4dc115915de8)
- [link2](https://gist.github.com/cecilemuller/a26737699a7e70a7093d4dc115915de8)


