## NGINX – Pin to Pin (Very Simple)

---

### 1️⃣ What is NGINX?

* NGINX is a **web server**
* It sits **between user and application**

---

### 2️⃣ Why NGINX is used?

* To control incoming traffic
* To protect backend apps
* To manage routing

---

### 3️⃣ Reverse Proxy (Main Use)

* User does NOT talk to backend directly
* User talks to NGINX
* NGINX forwards request to backend

**Flow:**
User → NGINX → Backend App

---

### 4️⃣ Why Reverse Proxy is needed?

* Hide backend IP and port
* Add HTTPS (SSL)
* Improve security
* Central entry point

---

### 5️⃣ Load Balancer (When many backends)

* One NGINX
* Many backend servers
* NGINX sends requests to each server

**Flow:**
User → NGINX → App1 / App2 / App3

---

### 6️⃣ Important Truth

Every load balancer is a reverse proxy
But every reverse proxy is NOT a load balancer

---

### 7️⃣ Other uses of NGINX

* Serve static files (HTML, CSS, JS)
* Act as API gateway

---

### 8️⃣ Real DevOps Usage

* Small app → Reverse proxy only
* Medium app → Reverse proxy + Load balancer
* Large app → Cloud LB + NGINX internally

---

### 9️⃣ One-line Summary

NGINX first works as a **reverse proxy** and becomes a **load balancer** when multiple backends are added.
