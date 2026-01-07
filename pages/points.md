
### **Slide 1 – Title / Opening**

**Title:** Sentry: Application Monitoring & Developer Experience

**Bullets:**

* Self-hosted Sentry in our stack
* Complements Grafana, Loki, and Tempo
* Focus: faster error detection, improved stability

**Speaker notes:**
“Today I’ll show how Sentry improves developer experience and product stability by catching errors and performance regressions early, without replacing our existing observability stack.”

---

### **Slide 2 – What Sentry Is (and Isn’t)**

**Bullets:**

* Error & performance monitoring **inside the application**
* Push-based events, with **full code context**
* Automatic grouping by stacktrace & code location

**Is not:**

* Log storage (not yet)
* Infrastructure monitoring
* Replacement for Grafana/Loki/Tempo

**Speaker notes:**
“Sentry focuses on **what breaks in the code**, not just infrastructure metrics or logs. It sits closer to developers than Grafana does.”

---

### **Slide 3 – Automatic Detection & Grouping**

**Bullets:**

* SDK captures errors automatically:

  * unhandled exceptions, panics, framework errors
* Intelligent grouping reduces spam:

  * one issue for multiple occurrences
* No need for:

  * custom Loki parsers
  * regex rules
  * manual deduplication

**Speaker notes:**
“This saves teams time and reduces the chance of missing errors. Errors are grouped automatically, so developers see one meaningful issue instead of hundreds of log lines.”

---

### **Slide 4 – Issue Lifecycle & Stability Signals**

**Bullets:**

* Track for each issue:

  * **First seen**
  * **Last seen**
  * **Event count growth**
* Detect regressions, trends, and active issues
* Release tracking links issues to deployments

**Speaker notes:**
“This helps teams understand whether an error is new, recurring, or fixed, giving clear signals about product stability over time.”

---

### **Slide 5 – Performance Monitoring & Tracing**

**Bullets:**

* Transactions capture **HTTP endpoints**
* Metrics:

  * average / p95 / p99 durations
  * trends over time
  * operation breakdown (DB, cache, external APIs)
* Alert on latency increase:

  * threshold breaches
  * p95/p99 regressions after releases
* Detect N+1 queries automatically

**Speaker notes:**
“Sentry highlights slow endpoints and performance regressions directly tied to code. Alerts fire **before users notice**, reducing incidents.”

---

### **Slide 6 – Profiling & Cron Monitoring**

**Bullets:**

* **Profiling**:

  * low-overhead CPU sampling
  * identifies bottlenecks in code
* **Background jobs / cron tasks**:

  * alert if jobs fail, finish late, or never run

**Speaker notes:**
“This helps catch silent failures and performance issues in non-HTTP workloads without digging through logs.”

---

### **Slide 7 – SDK Integration & OpenTelemetry**

**Bullets:**

* **Ease of integration**:

  * Python: ~3 lines
  * Node.js: few lines
* Works with existing **OpenTelemetry instrumentation**
* Minimal setup:

  * DSN, environment, release

**Speaker notes:**
“You can start capturing errors and performance metrics in minutes. Teams already using OpenTelemetry can reuse instrumentation — no rework needed.”

---

### **Slide 8 – How Sentry Fits With Our Stack**

**Bullets:**

* Grafana: system health & SLOs
* Loki: raw logs, deep inspection
* Tempo: infrastructure traces
* Sentry: developer-focused errors, transactions, and latency alerts
* Complementary, not redundant

**Speaker notes:**
“This shows how Sentry complements the stack: it fills the gap between logs/metrics and the actual code where errors happen.”

---

### **Slide 9 – Limitations & Roadmap**

**Bullets:**

* Currently **no log storage** in Sentry
* Logs remain in Loki
* Even without logs:

  * errors are reliably detected
  * grouping reduces noise
* Future: tighter logs integration

**Speaker notes:**
“Despite this limitation, Sentry already provides value. Logs integration is coming later, but detection and performance insights work today.”

---

### **Slide 10 – Summary & Key Takeaways**

**Bullets:**

* Automatic error detection & grouping
* Endpoint-level performance monitoring & alerting
* Visibility into **when issues start and grow**
* Easy to adopt: few lines of code, OTel-compatible
* Complements Grafana stack without duplication

**Speaker notes:**
“In short, Sentry reduces manual effort, helps developers fix issues faster, and gives DevOps early signals for product stability. It’s easy to integrate and works with our existing observability investments.”

---

