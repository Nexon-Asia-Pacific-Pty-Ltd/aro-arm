az account set --subscription e5cfb6f0-14a5-4a8c-aec3-b23375fd4ad2
az provider register -n Microsoft.RedHatOpenShift --wait
az provider register -n Microsoft.Compute --wait
az provider register -n Microsoft.Storage --wait