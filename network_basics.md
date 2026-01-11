## Networking Basics – Practical Mapping (Very Concise)

---

### TCP vs UDP

**Question:** How to see TCP/UDP connections?
**Answer:** Check active sockets.
**Tool:** `ss` (Socket Statistics)

```bash
ss -t
ss -u
ss -tuln
```

`t`=TCP, `u`=UDP, `l`=listening, `n`=numeric

---

### Ports (22, 80, 443)

**Question:** Which service runs on which port?
**Answer:** Check listening ports.
**Tool:** `ss`

```bash
ss -tuln
```

22=SSH, 80=HTTP, 443=HTTPS

---

### IP Address

**Question:** What is my system IP?
**Answer:** Check network interfaces.
**Tool:** `ip`

```bash
ip a
```

---

### NAT (Private vs Public IP)

**Question:** Am I behind NAT?
**Answer:** Compare private and public IP.
**Tools:** `ip`, `curl`

```bash
ip a
curl ifconfig.me
```

Different IPs → NAT

---

### DNS

**Question:** How does name convert to IP?
**Answer:** DNS resolution.
**Tool:** `nslookup`

```bash
nslookup google.com
```

---

### HTTP vs HTTPS

**Question:** Is traffic encrypted?
**Answer:** Check request details.
**Tool:** `curl`

```bash
curl http://example.com -v
curl https://example.com -v
```

HTTPS shows SSL/TLS

---

### Load Balancer (Idea)

**Question:** How traffic is distributed?
**Answer:** One entry → multiple backends.
**Tool example:** NGINX

---

### One-Line Summary

Concept → Question → Command
TCP/UDP → connections → `ss`
Ports → services → `ss -tuln`
IP → address → `ip a`
NAT → public IP → `curl ifconfig.me`
DNS → name→IP → `nslookup`
HTTP/HTTPS → encryption → `curl -v`



