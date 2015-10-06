$Global:SvnMissing = $false

if (!(Get-Command svn -TotalCount 1 -ErrorAction SilentlyContinue)) {
    Write-Warning "svn command could not be found. Please create an alias or add it to your PATH."
    $Global:SvnMissing = $true
    return
}

$requiredVersion = [Version]'1.7.2'
#if ((git --version 2> $null) -match '(?<ver>\d+(?:\.\d+)+)') {
#    $version = [Version]$Matches['ver']
#}
$version = [Version]'1.8.0'
if ($version -lt $requiredVersion) {
    Write-Warning "posh-svn requires Git $requiredVersion or better. You have $version."
    $false
} else {
    $true
}