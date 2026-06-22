Write-Host "=== Destroying AeroStream Environment ===" -ForegroundColor Cyan

k3d cluster delete aerostream

Write-Host "Cluster deleted." -ForegroundColor Green
Write-Host "=== Environment Reset Complete ===" -ForegroundColor Cyan
