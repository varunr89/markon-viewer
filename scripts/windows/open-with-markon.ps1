# Opens markdown files with Markon (https://varunr89.github.io/markon-viewer/)
# Reads the file, base64-encodes it, and opens in browser using URL hash

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$FilePath
)

if (-not (Test-Path $FilePath)) {
    Write-Error "File not found: $FilePath"
    exit 1
}

# Read file content
$content = Get-Content -Path $FilePath -Raw -Encoding UTF8

# Base64 encode the content
$bytes = [System.Text.Encoding]::UTF8.GetBytes($content)
$base64 = [Convert]::ToBase64String($bytes)

# URL-encode the base64 for safety in hash
Add-Type -AssemblyName System.Web
$encoded = [System.Web.HttpUtility]::UrlEncode($base64)

# Create a temp HTML file that redirects using hash fragment (no length limit)
$tempFile = [System.IO.Path]::GetTempPath() + "markon_loader.html"

$html = @"
<!DOCTYPE html>
<html>
<head>
    <title>Opening Markon...</title>
    <script>
        window.location.href = "https://varunr89.github.io/markon-viewer/#$encoded";
    </script>
</head>
<body>
    <p>Opening Markon...</p>
</body>
</html>
"@

$html | Out-File -FilePath $tempFile -Encoding UTF8

# Open the temp file in default browser
Start-Process $tempFile
