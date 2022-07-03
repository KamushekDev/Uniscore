Uniscore.Scores

# nginx & sert installation
https://kubernetes.github.io/ingress-nginx/deploy/
https://kubernetes.github.io/ingress-nginx/user-guide/tls/#automated-certificate-management-with-cert-manager
https://gouthampilla.medium.com/generating-lets-encrypt-wildcard-certs-using-cert-manager-on-gke-25bf454e5904

helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.6.0 --set installCRDs=true --set extraArgs='{--dns01-recursive-nameservers-only}'
                     

# Database
## update (from src)
```bash
dotnet ef database update -s Uniscore.Scores -p Uniscore.Scores.Infrastructure
``` 
## add migration
```bash
dotnet ef migrations add MigrationName -s Uniscore.Scores -p Uniscore.Scores.Infrastructure -o Database/Migrations
```
## remove migrations from db
```bash
dotnet ef database update 0 -s Uniscore.Scores -p Uniscore.Scores.Infrastructure
```