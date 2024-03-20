param location string = 'East US' // Change the location if needed
param resourceGroupName string
param logicAppName string
param storageAccountName string

module resourceGroup './module/rg/resourcegroup.bicep' = {
  name: 'resourceGroup'
  scope: subscription()
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}

module storageAccount './module/sa/storageaccount.bicep' = {
  name: 'storageAccount'
  params: {
    location: location
    storageAccountName: storageAccountName
  }
}

module logicApp './module/la/logicapp.bicep' = {
  name: 'logicApp'
  params: {
    location: location
    logicAppName: logicAppName
  }

}

output storageAccountId string = storageAccount.outputs.storageAccountId
output resourceGroupId string = resourceGroup.outputs.resourceGroupId
