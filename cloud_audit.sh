#!/bin/bash

# Function to install AWS prerequisites
install_aws_tools() {
  echo -e "\033[32mInstalling AWS Prerequisites...\033[39m"
  sudo apt install awscli -y
  git clone https://github.com/nccgroup/ScoutSuite
  cd ScoutSuite || exit 1 # Exit if cloning fails 
  virtualenv -p python3 venv 
  source venv/bin/activate
  pip install -r requirements.txt 
}

# Function to gather AWS credentials and run audit
run_aws_audit() {
  echo -e "\033[32m\nAWS Audit\033[39m"

  # Get credentials
  echo "Enter your Access Key ID:"
  read access_key
  echo "Enter your Secret Access Key:"
  read secret_key
  echo "Enter a custom report name:"
  read report_name

  # Run the audit
  python scout.py aws --access-keys --access-key-id "$access_key" --secret-access-key "$secret_key" --report-name "$report_name" 
}

# Function to gather Azure credentials and run audit
run_azure_audit() {
  echo -e "\033[35m\nAzure Audit\033[39m"

  # Get credentials
  echo "Enter your Azure user account:"
  read user_account
  echo "Enter your Azure password:"
  read -s password  # Read password without echo
  echo "Enter your Azure Tenant ID:"
  read tenant_id
  echo "Enter your Custom Report Name:"
  read report_name 

  # Run the audit
  python scout.py azure --user-account -u "$user_account" -p "$password" --tenant "$tenant_id" --report-name "$report_name" 
}

# Main menu loop
while true; do
  echo -e "\n\033[36mChoose the operation you want to perform:\033[39m"
  echo "1. New Install (AWS Tools)"
  echo "2. AWS Audit"
  echo "3. Azure Audit"
  echo "4. Exit"

  read -p "Enter your choice: " choice
  echo -e "\033[39m" # Reset color

  case $choice in
    1) install_aws_tools ;;
    2) run_aws_audit ;;
    3) run_azure_audit ;;
    4) exit 0 ;;
    *) echo -e "\033[31mInvalid selection. Please try again.\033[39m" ;;
  esac
done
