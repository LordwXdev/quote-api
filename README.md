# Quote API — MicroK8s Term Project

A stateless PHP REST API that returns random quotes.
Deployed on MicroK8s with horizontal scaling, self-healing, and ingress routing.

## Stack
- PHP 8.2 + Apache
- Docker
- MicroK8s (Kubernetes)
- NGINX Ingress
- HPA (Horizontal Pod Autoscaler)

## Endpoints
- `GET /` — returns a random quote + pod info
- `GET /health.php?action=live` — liveness probe
- `GET /health.php?action=ready` — readiness probe
- `GET /stress.php` — burns CPU for HPA demo

## Project Structurequote-api/
├── app/

│   ├── index.php

│   ├── health.php

│   ├── stress.php

│   └── Dockerfile

├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   └── hpa.yaml
├── scripts/
│   ├── demo_traffic.sh
│   ├── chaos_test.sh
│   └── stress_test.sh
└── README.md## How to Run
See setup instructions below.

### 1. Build and push image
```bash
cd app
docker build -t quote-api:1.0.0 .
docker tag quote-api:1.0.0 localhost:32000/quote-api:1.0.0
docker push localhost:32000/quote-api:1.0.0
```

### 2. Add hostname
```bash
echo "127.0.0.1 quote-api.local" | sudo tee -a /etc/hosts
```

### 3. Deploy
```bash
cd k8s
microk8s kubectl apply -f .
```

### 4. Test
```bash
curl http://quote-api.local
```
