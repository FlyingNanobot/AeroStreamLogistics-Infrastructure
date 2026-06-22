Write-Host "=== AeroStream Logs ===" -ForegroundColor Cyan

kubectl logs -n aerostream -l app=aerostream-api -f
kubectl logs -n aerostream -l app=aerostream-ui -f
kubectl logs -n aerostream -l app=aerostream-worker -f
kubectl logs -n aerostream -l app=aerostream-processing -f
