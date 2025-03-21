# Spring Microservice in a Kubernetes Cluster

This is a simple order application that consists of the following four services:

## 1️⃣ Postgres Database Service

### 📂 Structure
- **Docker File**
- **Kubernetes Deployment, Service, and Ingress Configuration YAML Files**

### 🚀 Commands
#### 🏗 Docker Build Command
```sh
docker build -t postgres-db:1.0.0 .
```
- This will build an image and store it in the Docker image registry.

#### ⚙️ Kubernetes Commands
```sh
# Navigate to the project home directory where the YAML files are located
kubectl apply -f Postgre-pvc.yaml
kubectl apply -f Postgres-deployment.yaml
kubectl apply -f Postgres-service.yaml
kubectl apply -f Postgres-ingres.yaml
```

#### ⚙️ Access database 
```sh
for outside cluster using pgadmin try to connect to database
          env:
            - name: POSTGRES_USER
              value: "admin"
            - name: POSTGRES_PASSWORD
              value: "admin123"
            - name: POSTGRES_DB
              value: "mydatabase"
for accessing the database within the cluster 
```

#### ⚙️ Table and Data scripts 
```sh
Inventory Service

Product Catalog Service

Order Service

```



## 1️⃣ Inventory Service

### 📂 Structure
- **Source Code**
- **Docker File**
- **Kubernetes Deployment, Service, and Ingress Configuration YAML Files**

### 🚀 Commands
#### 🏗 Docker Build Command
```sh
docker build -t inventory-service:1.0.0 .
```
- This will build an image and store it in the Docker image registry.

#### ⚙️ Kubernetes Commands
```sh
# Navigate to the project home directory where the YAML files are located
kubectl apply -f k8s-deployment.yaml
kubectl apply -f k8s-service.yaml
kubectl apply -f k8s-ingress.yaml
```

#### 🌍 Service Access
- **External Access (Outside Cluster):** `http://localhost/inventory`
- **Internal Access (Inside Cluster - From Code):**  
  `http://inventory-service-svc.default.svc.cluster.local:8080/inventory/`

---

## 2️⃣ Product Catalog Service

### 📂 Structure
- **Source Code**
- **Docker File**
- **Kubernetes Deployment, Service, and Ingress Configuration YAML Files**

### 🚀 Commands
#### 🏗 Docker Build Command
```sh
docker build -t product-catalog-service:1.0.0 .
```
- This will build an image and store it in the Docker image registry.

#### ⚙️ Kubernetes Commands
```sh
# Navigate to the project home directory where the YAML files are located
kubectl apply -f k8s-deployment.yaml
kubectl apply -f k8s-service.yaml
kubectl apply -f k8s-ingress.yaml
```

#### 🌍 Service Access
- **External Access (Outside Cluster):** `http://localhost/productcatalog`
- **Internal Access (Inside Cluster - From Code):**  
  `http://product-catalog-service-svc.default.svc.cluster.local:8081/productcatalog/`

---

## 3️⃣ Order Service

### 📂 Structure
- **Source Code**
- **Docker File**
- **Kubernetes Deployment, Service, and Ingress Configuration YAML Files**

### 🚀 Commands
#### 🏗 Docker Build Command
```sh
docker build -t order-service:1.0.0 .
```
- This will build an image and store it in the Docker image registry.

#### ⚙️ Kubernetes Commands
```sh
# Navigate to the project home directory where the YAML files are located
kubectl apply -f k8s-deployment.yaml
kubectl apply -f k8s-service.yaml
kubectl apply -f k8s-ingress.yaml
```

#### 🌍 Service Access
- **External Access (Outside Cluster):** `http://localhost/orders`
- **Internal Access (Inside Cluster - From Code):**  
  `http://order-service-svc.default.svc.cluster.local:8082/orders/`

---

## 4️⃣ API Gateway

### 📂 Structure
- **Source Code**
- **Docker File**
- **Kubernetes Deployment, Service, and Ingress Configuration YAML Files**

### 🚀 Commands
#### 🏗 Docker Build Command
```sh
docker build -t api-gateway:1.0.0 .
```
- This will build an image and store it in the Docker image registry.

#### ⚙️ Kubernetes Commands
```sh
# Navigate to the project home directory where the YAML files are located
kubectl apply -f k8s-deployment.yaml
kubectl apply -f k8s-service.yaml
kubectl apply -f k8s-ingress.yaml
```

#### 🌍 Service Access via API Gateway
- `http://localhost/gateway/inventory`
- `http://localhost/gateway/orders`
- `http://localhost/gateway/productcatalog`

---

### 📌 Notes
- Ensure **Ingress is correctly configured** to route requests properly.
- Replace `localhost` with the appropriate domain if using a **custom hostname**.
- Adjust ports and configurations as needed based on your **cluster setup**.

🎉 **Happy Coding!** 🚀

