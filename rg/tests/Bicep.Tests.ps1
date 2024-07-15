# Define global variables
$bicepFileName = "main.bicep"
$parentDirectory = Split-Path -Parent (Get-Location)
$global:bicepFilePath = Join-Path -Path $parentDirectory -ChildPath $bicepFileName


Describe 'Bicep Template Tests' {

    # Ensure Bicep CLI is installed and available in the PATH
    It 'Bicep CLI should be installed' {
        Get-Command bicep -ErrorAction SilentlyContinue | Should -Not -BeNullOrEmpty
    }

    Describe 'Bicep What-If Deployment Test' {
        It 'Should run what-if deployment and return successful status' {
            # Define the command to run the what-if deployment
            $command = "az deployment sub what-if --template-file $global:bicepFilePath --location uksouth --no-pretty-print"

            # Execute the command and capture the output
            $result = Invoke-Expression -Command $command

            # Convert the JSON output to a PowerShell object
            $jsonResult = $result | ConvertFrom-Json

            # Assert that the status is 'Succeeded'
            $jsonResult.status | Should -Be 'Succeeded'
        }
    }
}