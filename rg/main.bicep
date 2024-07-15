targetScope = 'subscription'

@description('The name of the resource group to be created. Defaults to "rg-" followed by random characters.')
param rgName string = 'rg-${uniqueString(deployment().name)}'

@description('The location where the resource group will be deployed. Defaults to "UK South".')
param location string = 'uksouth'

@description('An object containing tags to be assigned to the resource group.')
param tags object = {}

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: rgName
  location: location
  tags: tags
}
