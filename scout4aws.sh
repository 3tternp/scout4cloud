#!/bin/bash 
sudo apt install awscli -y 
git clone https://github.com/nccgroup/ScoutSuite
cd ScoutSuite
virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt

# Get the AccesskeyId from the user
echo "Enter your AccesskeyId:"
read access_key

# Get the SecretkeyID from the user
echo "Enter your SecretkeyId:"
read secret_key

#Get the Custom Report Name
echo "Enter your Report Name:"
read report_name 

# Execute the Python script
python scout.py aws --access-keys --access-key-id $access_key --secret-access-key $secret_key --report-name $report_name

