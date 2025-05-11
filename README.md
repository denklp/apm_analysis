Available self-hosted APM tool analysis
Sentry
image1.jpg
Information needed in one place - developers can easyli 


| Feature / Tool            | Sentry (Self-hosted)                  | Elastic APM                       | SigNoz (OTEL)          | OTEL + Grafana     |
|---------------------------|----------------------------------------|-----------------------------------|--------------------------------------|----------------------------------------|
| Supported Languages       | Python, Rust (official SDKs)          | Python only  (SDK)                      | Python, Rust              | Python, Rust                |
| Error Code context      | yes, part of code included         | no, only codeline | no, only codeline             | no, only codeline    |
| Instrumentation Complexity          | Easy, SDK   | Easy-Medium, SDK | Medium-Hard, OTEL instrumentation | Medium-Hard, OTEL instrumentation |
| Licensing                 | Functional Source License (if non-compete, then free for use)              | Elastic license v2 (some parts paid) | MIT     | different open-source licenses                      |


From my perspective, Sentry is the tool that suits us best:
Best observability for developers - all error/exception related information in one place with code instantly available.
No need to create custom visualisations - all should work from the box.
Ease of instrumentation. No overhead with OTEL.
Widely used, big community. 
Quite comfortable license, which will in 2 years switch to Apache 2.0.