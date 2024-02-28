#!/bin/bash 
#!/bin/bash
# Display the menu
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
echo ===============================================================
tput bold
echo  -e "\033[1mSCOUT4CLOUD Download Install and SCAN\033[0m"
tput sgr0
       current_date_time=$(date) 
echo   "Current date and time: $current_date_time"
echo   Run this script as root and Before choosing option 2 or 3 choose 1 and only choose your options 
echo ===============================================================
echo ================================================================
echo -e " \033[31m  _____                  __  __ __  ________                __"
echo -e " \033[32m / ___/_________  __  __/ /_/ // / / ____/ /___  __  ______/ /"
echo -e " \033[33m \__ \/ ___/ __ \/ / / / __/ // /_/ /   / / __ \/ / / / __  /" 
echo -e " \033[35m___/ / /__/ /_/ / /_/ / /_/__  __/ /___/ / /_/ / /_/ / /_/ /"  
echo -e "\033[32m/____/\___/\____/\__,_/\__/  /_/  \____/_/\____/\__,_/\__,_/"                                                            
echo "                                             Develop by: Astra" 
echo =================================================================
while true; do
    
  echo -e "\033[36m"
  echo -e "Choose the operation you want to perform:"
  echo -e "\033[31m"
  echo -e "1. New Install"
  echo -e "\033[32m"
  echo -e "2. AWS Audit"
  echo -e "\033[33m"
  echo -e "3. Azure Audit"
  echo -e "\033[35m"
  echo -e "4. Exit"
  echo -e "\033[30m"

  read count
  
   if [ "$count" -eq 1 ]; then
sudo apt install awscli -y 
git clone https://github.com/nccgroup/ScoutSuite
cd ScoutSuite
virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt

# FOR AWS 
 elif [ "$count" -eq 2 ]; then
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

# FOR AZURE 
elif [ "$count" -eq 3 ]; then

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

elif [ "$count" -eq 4 ]; then
    # Exit the script
    exit 0

  else
    # Invalid selection
    echo -e "\033[30m"
    echo -e "Invalid selection. Please try again."
    echo -e "\033[39m"
  fi 
done
