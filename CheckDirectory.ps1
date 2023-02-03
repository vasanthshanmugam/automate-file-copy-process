$source = "C:\Source"
$destination = "C:\Destination"

if (Test-Path $source -PathType Container) {
    Get-ChildItem $source -File | Copy-Item -Destination $destination -Force
} else {
    Write-Error "The source directory does not exist or is not accessible."
}
