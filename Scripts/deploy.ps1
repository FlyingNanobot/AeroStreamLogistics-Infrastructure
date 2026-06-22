Write-Host "=== AeroStream Deployment Script ===" -ForegroundColor Cyan

# -----------------------------
# 1. Build Docker Images
# -----------------------------
Write-Host "`n[1/4] Building Docker Images..." -ForegroundColor Yellow

docker build -t aerostream-api:latest `
  -f "C:\Users\flyin\source\repos\AeroStreamLogistics-API\API\Dockerfile" `
  "C:\Users\flyin\source\repos\AeroStreamLogistics-API"

docker build -t aerostream-ui:latest `
  -f "C:\Users\flyin\source\repos\AeroStreamLogistics-UI\AeroStreamLogistics-UI\Dockerfile" `
  "C:\Users\flyin\source\repos\AeroStreamLogistics-UI"

docker build -t aerostream-worker:latest `
  -f "C:\Users\flyin\source\repos\AeroStreamLogistics-WorkerService\WorkerService\Dockerfile" `
  "C:\Users\flyin\source\repos\AeroStreamLogistics-WorkerService"

docker build -t aerostream-processing:latest `
  -f "C:\Users\flyin\source\repos\AeroStreamLogistics-ProcessingService\ProcessingService\Dockerfile" `
  "C:\Users\flyin\source\repos\AeroStreamLogistics-ProcessingService"

Write-Host "Docker images built successfully." -ForegroundColor Green

# -----------------------------
# 2. Import Images into k3d
# -----------------------------
Write-Host "`n[2/4] Importing Images into k3d..." -ForegroundColor Yellow

k3d image import aerostream-api:latest -c aerostream
k3d image import aerostream-ui:latest -c aerostream
k3d image import aerostream-worker:latest -c aerostream
k3d image import aerostream-processing:latest -c aerostream

Write-Host "Images imported into k3d successfully." -ForegroundColor Green

# -----------------------------
# 3. Apply Kubernetes Manifests
# -----------------------------
Write-Host "`n[3/4] Applying Kubernetes Manifests..." -ForegroundColor Yellow

$k8sPath = "C:\Users\flyin\source\repos\AeroStreamLogistics-Infrastructure\k8s"

kubectl apply -f "$k8sPath\namespace"
kubectl apply -f "$k8sPath\infra"
kubectl apply -f "$k8sPath\api"
kubectl apply -f "$k8sPath\ui"
kubectl apply -f "$k8sPath\worker"
kubectl apply -f "$k8sPath\processing"
kubectl apply -f "$k8sPath\ingress"

Write-Host "Kubernetes manifests applied successfully." -ForegroundColor Green

# -----------------------------
# 4. Restart Deployments
# -----------------------------
Write-Host "`n[4/4] Restarting Deployments..." -ForegroundColor Yellow

kubectl rollout restart deployment api-deployment -n aerostream
kubectl rollout restart deployment ui-deployment -n aerostream
kubectl rollout restart deployment worker-deployment -n aerostream
kubectl rollout restart deployment processing-deployment -n aerostream

Write-Host "All deployments restarted successfully." -ForegroundColor Green

Write-Host "`n=== Deployment Complete ===" -ForegroundColor Cyan
