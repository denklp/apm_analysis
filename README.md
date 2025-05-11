Available self-hosted APM tool analysis

Sentry
image1.jpg
Pros:
Issue-centric views and dashboards - developers can easily investigate error cause.
Not only stacktrace, but also code which generated error.
Can be added to grafana with link to sentry detailed error overview. - https://sentry.io/integrations/grafana/
Active development of SDK/self-hosted: 
https://github.com/getsentry/self-hosted - ui/processing
https://github.com/getsentry/sentry-python - python SDK

Cons:
Don't looks like future instrumentation of choice like CNCF OTEL, but still it's open source, so not a big concern.

License: https://www.tldrlegal.com/license/functional-source-license-fsl


Elastic APM

Pros:
Another well known observability tool
Can visualize error stacktrace.

Cons:
Questionable licensing - some feature can be still payable
More sophisticated self-hosted installation
Less adoption of APM modules



License: mix of Elastic License 2.0 and Apache License 2.0


SigNoz
Pros:
Open source observability tool
Can visualize error stacktrace.

Cons:
OTEL instrumentation - can be more sophisticated
Still less adoption than sentry

License: MIT

Grafana + OTEL + custom panels
Pros:
Already in use in company


Cons:
To get Sentry level of error observability, a lot of work needs to be done
OTEL instrumentation - can be more sophisticated

License: mix of open-source licenses 


| Feature / Tool            | Sentry (Self-hosted)                  | Elastic APM                       | SigNoz (OTEL)          | OTEL + Grafana     |
|---------------------------|----------------------------------------|-----------------------------------|--------------------------------------|----------------------------------------|
| Supported Languages       | Python, Rust (official SDKs)          | Python only  (SDK)                      | Python, Rust              | Python, Rust                |
| Error Code context      | yes, part of code included         | no, only codeline | no, only codeline             | no, only codeline    |
| Instrumentation Complexity          | Easy, SDK   | Easy-Medium, SDK | Medium-Hard, OTEL instrumentation | Medium-Hard, OTEL instrumentation |
| Licensing                 | Functional Source License (if non-compete, then free for use)              | Elastic license v2 (some parts paid) | MIT     | mix of open-source licenses                      |


From my perspective, Sentry is the tool that suits us best:
Best observability for developers - all error/exception related information in one place with code instantly available.
No need to create custom visualisations - all should work from the box.
Ease of instrumentation. No overhead with OTEL.
Widely used, big community. 
Quite comfortable license, which will in 2 years switch to Apache 2.0.

If Sentry is approved - next step is POC. If everything fits our needs - then documentation and implementation.
