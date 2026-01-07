
## 0. Opening & context (30 sec)

* We already have **metrics (Prometheus), logs (Loki), traces (Tempo)**
* Sentry focuses on **application-level failures**
* Goal: reduce time spent **detecting and classifying errors**, not just observing them

---

## 1. What Sentry is (and is not) (45 sec)

**Is:**

* Error and performance monitoring **from inside the application**
* Push-based: SDK sends events when something happens
* Strongly centered on **code context**

**Is not:**

* Not a log storage system (yet)
* Not a replacement for Grafana/Loki/Tempo
* Not infrastructure monitoring

> Positioning: *Sentry sits closer to developers, Grafana closer to operations*

---

## 2. Developer experience: automatic detection & grouping (1 min)

**Automatic error detection**

* SDK hooks into:

  * unhandled exceptions
  * framework error handlers
  * runtime panics / crashes
* Errors are captured **at the source**, not inferred from text logs

**Intelligent grouping (anti-spam)**

* Errors are grouped by:

  * stacktrace structure
  * exception type
  * code location
* Prevents alert fatigue:

  * one issue → many occurrences
  * instead of thousands of similar log lines

**Key DevOps benefit**

* No need to build and maintain:

  * custom Loki parsers
  * complex regex rules
  * deduplication logic
* Lower chance of **missing errors** due to parser gaps

---

## 3. Issue lifecycle & stability signals (1 min)

* For each grouped issue you see:

  * **first occurrence**
  * **last occurrence**
  * **event count growth**
* Makes error impact measurable over time
* Clear signal of:

  * regressions
  * stability improvements
  * whether an issue is still active

---

## 4. Performance monitoring & tracing (1.5 min)

### Transactions & endpoint-level visibility

* Each HTTP endpoint is captured as a **transaction**
* You can see:

  * average / p95 / p99 duration
  * trend over time
  * breakdown by operation (DB, cache, external APIs)

### Monitoring specific endpoints

* Possible to focus on:

  * `/checkout`
  * `/login`
  * `/api/orders`
* Track:

  * gradual performance degradation
  * sudden latency spikes
* Especially useful for **business-critical paths**

### Alerting on latency increase

* Alerts can be configured when:

  * transaction duration crosses a threshold
  * p95 / p99 increases compared to baseline
  * performance regresses after a release
* Alert is tied directly to:

  * endpoint name
  * release
  * trace samples

**DevOps value**

* Alert fires **before users complain**
* No need to infer latency from access logs or metrics aggregation

### N+1 problem detection

* Repeated DB spans in a single transaction
* Clear visibility without SQL log inspection

### Tracing under the hood

* Uses **distributed tracing concepts**:

  * trace_id, span_id
  * spans represent operations (HTTP, DB, cache)
* SDK instruments frameworks and libraries automatically
* Compatible with OpenTelemetry, optimized for **developer readability**

---

## 5. Profiling (45 sec)

* Statistical sampling of CPU usage
* Shows **where time is actually spent**, not just slow requests
* Useful for:

  * performance regressions
  * unexpected CPU hotspots
  * optimizing critical paths
* Profiling is **low-overhead**, focused on understanding *why* something is slow

---

## 6. Cron & background job monitoring (45 sec)

* Monitoring of scheduled jobs and background workers
* Alerts when:

  * a cron didn’t run
  * finished too late
  * failed silently
* Useful for things that **don’t generate HTTP traffic** and are hard to notice otherwise

---

## 7. SDK & implementation experience (1 min)

### Ease of integration

* Minimal setup by design
* Typical effort:

  * **Python**: ~3 lines of code
  * **Node.js**: a few lines during app bootstrap
* Requires only:

  * DSN
  * environment
  * release

### OpenTelemetry compatibility

* If a team already uses **OpenTelemetry (OTel)**:

  * existing instrumentation can be reused
  * no need to re-instrument services
* Sentry can consume OTel traces and spans
* Preserves:

  * trace structure
  * span relationships
  * existing tracing effort

### Why this matters

* No vendor lock-in at instrumentation level
* Easier adoption in mature environments
* Lower migration cost

---

## 8. How it fits with Grafana / Loki / Tempo (45 sec)

* Grafana: system health, SLOs, trends
* Loki: raw logs, audit, deep inspection
* Tempo: infrastructure-level distributed tracing
* Sentry: developer-oriented errors & performance, endpoint and transaction visibility
* Shared concepts via OTel make coexistence straightforward

---

## 9. Current limitation & roadmap note (30 sec)

* Sentry does not store logs yet
* Logs remain in Loki
* Even without logs:

  * errors are detected reliably
  * grouping reduces noise
* Future direction: tighter logs integration

---

## 10. Closing summary (30 sec)

* Sentry provides:

  * automatic error detection and grouping
  * endpoint-level performance monitoring and alerting
  * visibility into when issues start and how they evolve
* Easy to adopt:

  * few lines of code
  * works with existing OTel instrumentation
* Complements Grafana stack without duplication

**Optional one-liner for speech**

> “If you already invested in OpenTelemetry, that work is not lost — Sentry can build on top of it.”

