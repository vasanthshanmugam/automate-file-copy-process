$source = "C:\Vasanth\AzureDevOpsDemo\Source"
$destination = "C:\Vasanth\AzureDevOpsDemo\Destination"

Get-ChildItem $source -Recurse | ForEach-Object {
    $destinationPath = $_.FullName.Replace($source, $destination)
    If ($_.PSIsContainer) {
        If (-Not (Test-Path $destinationPath)) {
            New-Item $destinationPath -ItemType Directory | Out-Null
        }
    }
    Else {
        Copy-Item $_.FullName $destinationPath -Force
    }
}
