Write-Host "=== AeroStream Setup Script ===" -ForegroundColor Cyan

# 1. Create k3d cluster
Write-Host "`n[1/3] Creating k3d cluster..." -ForegroundColor Yellow
k3d cluster create aerostream --api-port 6550 -p "80:80@loadbalancer"

Write-Host "Cluster created successfully." -ForegroundColor Green

# 2. Add hosts entries
Write-Host "`n[2/3] Adding hosts entries..." -ForegroundColor Yellow

$hostsPath = "C:\Windows\System32\drivers\etc\hosts"
$entries = @(
    "127.0.0.1 ui.localdev.me",
    "127.0.0.1 api.localdev.me"
)

foreach ($entry in $entries) {
    if (-not (Select-String -Path $hostsPath -Pattern $entry -Quiet)) {
        Add-Content -Path $hostsPath -Value $entry
    }
}

Write-Host "Hosts entries added." -ForegroundColor Green

# 3. Verify cluster
Write-Host "`n[3/3] Verifying cluster..." -ForegroundColor Yellow
kubectl get nodes

Write-Host "`n=== Setup Complete ===" -ForegroundColor Cyan
