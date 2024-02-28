# scout4cloud

This is an automated script written in bash and is the automated version of Scoutsuit for cloud configuration audit. This version only automate only AWS configuration audit and microsoft Azure cloud configuration audit process which takes inputs from users like AWS-Key-ID and Secret-Key-ID for AWS and username, password, tenant_ID for Microsoft Azure and Report_Name from user and give the report in HTML format.

**#IMPORTANT NOTICE**
Run this script as root user

**#start the script**

git clone https://github.com/3tternp/scout4cloud

cd scout4cloud

# For executing all at one 
chmof +x scout4cloud.sh 

./scout4cloud.sh 

# 4 individual execution 

# For Azure 
chmod +x scout4azure.sh 

./scout4azure.sh 

# For AWS 
chmod +x scout4aws.sh 

./scout4aws.sh 

Future update will include  GCP and other cloud service provider automation in it. 
