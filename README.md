| Feature / Tool            | Sentry (Self-hosted)                  | Elastic APM                       | SigNoz (OTEL)          | OTEL + Grafana     |
|---------------------------|----------------------------------------|-----------------------------------|--------------------------------------|----------------------------------------|
| Supported Languages       | Python, Rust (official SDKs)          | Python only  (SDK)                      | Python, Rust (via OTEL)              | Python, Rust (via OTEL)                |
| Error Tracking            | stacktrace, breadcrumbs, code context | stacktrace, code line          | stacktrace, code line          | stacktrace, code line                   |
| Line of Code in Error     | Yes, including source context         | Sometimes (with detailed logging) | Yes (with proper setup)              | Requires custom config/log parsing     |
| Setup Complexity          | Medium (Docker, Postgres, Relay)      | High (ElasticSearch, Kibana, APM Server) | Low-Medium (Docker install script) | High (multiple components: collector, Tempo, Loki, Prometheus, Grafana) |
| Visualization             | Issue-centric views and dashboards    | Metric-focused dashboards         | Prebuilt APM views                   | Requires custom dashboards             |
| Licensing                 | XXX              | XXX | XXX     | XXX                      |
