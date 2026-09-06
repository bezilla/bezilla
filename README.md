## Paul Bezilla

These five repositories are one argument made five times: **a system is only as
trustworthy as the checks you have actually verified.** Each one runs, each one
records what it got wrong, and each one is instrumented so the behavior is
visible while it happens.

![Five repositories: a stack of three joined by one real dependency and one conceptual one, and two that stand alone. terragrunt-reference-architecture sits at the top of the stack; a dashed arrow runs from it to kubernetes-platform-reference, dashed because that edge is conceptual rather than real — neither repository references the other in code, configuration or CI. A solid arrow runs from kubernetes-platform-reference to otel-service-reference, a real but optional dependency: the platform builds its sample image from a sibling checkout at ../otel-service-reference if one is on disk, and a fallback workload if not. It does not clone the repository. Beside the stack, joined to nothing, stand capsize, a read-only Kubernetes CLI that points at any cluster, and switchyard, an independent inference gateway. Neither depends on any of the other three.](docs/five-repositories.svg)
