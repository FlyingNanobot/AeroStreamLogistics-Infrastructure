Write-Host "=== AeroStream Status ===" -ForegroundColor Cyan

kubectl get pods -n aerostream
kubectl get svc -n aerostream
kubectl get ingress -n aerostream
kubectl get endpoints -n aerostream

Write-Host "`n=== Status Complete ===" -ForegroundColor Cyan
