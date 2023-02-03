# Define the source and destination directories
$source = "C:\Source"
$destination = "C:\Destination"

# Define the smoke test
Describe "File copy smoke test" {
    It "Copies files from source to destination" {
        # Check if the source and destination directories exist
        If (Test-Path $source -PathType Container -ErrorAction SilentlyContinue) {
            If (Test-Path $destination -PathType Container -ErrorAction SilentlyContinue) {
                # Get a list of the files in the source and destination directories
                $sourceFiles = Get-ChildItem $source -File
                $destinationFiles = Get-ChildItem $destination -File

                # Compare the lists of files to ensure that all of the files have been copied
                $sourceFiles | ForEach-Object {
                    $_.Name | Should BeIn $destinationFiles.Name
                }
            }
            Else {
                Throw "Destination directory not found: $destination"
            }
        }
        Else {
            Throw "Source directory not found: $source"
        }
    }
}

# Run the smoke test
Invoke-Pester
