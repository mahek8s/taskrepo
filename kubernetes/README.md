**README: Kubernetes Deployment for Nginx Application**

This YAML configuration defines a Kubernetes Deployment and Service for deploying an Nginx web server with specific resource constraints, scheduling preferences, and service configuration.

**Deployment:**
- **Name:** `app-demo-deployment`
- **Replicas:** 3
- **Selector Labels:** `app: app-nginx`
- **Containers:**
  - **Name:** `app-nginx`
  - **Image:** nginx:1.26.0-alpine3.19-perl (multiarch image for arm based deployment as per nodes configuration)
  - **Image Pull Policy:** IfNotPresent
  - **Image Pull Secrets:** regcred
  - **Ports:** Port 80 exposed
  - **Resources:** Requests memory: 128Mi, CPU: 100m; Limits memory: 500Mi, CPU: 200m
- **Tolerations:** Tolerates the condition "spot" being equal to "true" with a NoSchedule effect.
- **Affinity:**
  - **Node Affinity:** Requires scheduling on nodes with the architecture label "arm".
  - **Pod Anti-Affinity:** Prefers not to schedule pods with the label "app-nginx" on the same node, based on the hostname.
- **Topology Spread Constraints:** Spreads pods across different zones, allowing skew of up to 1 pod per zone, and schedules pods even if the constraint cannot be met.
- **Strategy:** Strategy of deployment is Rolling update  and maxUnavailable=1 maxSurge=1 where one comesup and other pods goes down in rolling fashion.

**Service:**
- **Name:** `app-demo-service-nginx`
- **Type:** ClusterIP
- **Selector Labels:** `app: app-nginx`
- **Ports:** Forwards traffic from port 80 to port 80 within the pods.

This configuration provides a scalable, fault-tolerant deployment of Nginx on a Kubernetes cluster with specific resource constraints, scheduling preferences, and service configuration. Adjustments can be made as needed based on specific deployment requirements and cluster configurations.
