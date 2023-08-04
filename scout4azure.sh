#!/bin/bash 
git clone https://github.com/nccgroup/ScoutSuite
cd ScoutSuite
virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt

# Get the user account from the user
echo "Enter your Azure user account:"
read user_account

# Get the password from the user
echo "Enter your Azure password:"
read password

# Get the tenant ID from the user
echo "Enter your Azure tenant ID:"
read tenant_id
#Get the Custom Report Name
echo "Enter your Report Name:"
read report_name 

# Execute the Python script
python scout.py azure --user-account -u $user_account -p $password --tenant $tenant_id --report-name $report_name

