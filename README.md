## Paul Bezilla

Infrastructure, platform, and reliability engineering. Twenty years across
CDN, streaming, and e-commerce.

These five repositories are one argument made five times: **a system is only as
trustworthy as the checks you have actually verified.** Each one runs, each one
records what it got wrong, and each one is instrumented so the behavior is
visible while it happens.

![Five repositories: a stack of three joined by one real dependency and one conceptual one, and two that stand alone. terragrunt-reference-architecture sits at the top of the stack; a dashed arrow runs from it to kubernetes-platform-reference, dashed because that edge is conceptual rather than real — neither repository references the other in code, configuration or CI. A solid arrow runs from kubernetes-platform-reference to otel-service-reference, a real but optional dependency: the platform builds its sample image from a sibling checkout at ../otel-service-reference if one is on disk, and a fallback workload if not. It does not clone the repository. Beside the stack, joined to nothing, stand capsize, a read-only Kubernetes CLI that points at any cluster, and switchyard, an independent inference gateway. Neither depends on any of the other three.](docs/five-repositories.svg)

### [kubernetes-platform-reference](https://github.com/bezilla/kubernetes-platform-reference)
A complete Kubernetes platform that comes up on a laptop in five minutes — Argo
CD, Gateway API, cert-manager, Kyverno in Enforce, OTel — installed one
component at a time because sync waves were not enough.

### [switchyard](https://github.com/bezilla/switchyard)
An inference gateway that routes across providers and visibly survives their
failure. The providers are simulated on purpose: you cannot reproducibly break
someone else's API, and reproducible failure is what makes breaker behavior
demonstrable rather than asserted.

### [capsize](https://github.com/bezilla/capsize)
A read-only Kubernetes CLI that scores cost waste and blast radius together, and
tells you where fixing one makes the other worse. Read-only is enforced at three
layers.

### [terragrunt-reference-architecture](https://github.com/bezilla/terragrunt-reference-architecture)
A production-shaped AWS platform across management, staging, and prod accounts —
EKS, Aurora, a CloudFront/WAF edge, keyless CI. Written to be read as much as
run; the non-obvious choices have ADRs.

### [otel-service-reference](https://github.com/bezilla/otel-service-reference)
The application half of an observability boundary. Instrumentation belongs to
the team that owns the service — no collector config can invent a span around a
decision only they made.

### What these turned up

Every one of these was a check that passed while never examining the thing that
mattered:

- A circuit breaker counting **client cancellations as provider failures** —
  twenty callers hanging up opened the circuit on a healthy provider.
- A CI identity gate that **failed precisely when the commits were clean**,
  because `grep -c` exits non-zero on a count of zero.
- A secret scanner that had **never read two files in the repository**, and a
  clean report that proved nothing.
- A fault injector **documented as unreachable** while published through the
  gateway.
- A pinned tool version for **a release that does not exist**, in a config that
  nominally watched it but had never run.

The line I keep coming back to: *a simulation fast enough to be convenient is
fast enough to hide an entire class of bug.*
