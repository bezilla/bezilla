## Paul Bezilla

Infrastructure, platform, and reliability engineering. Twenty years across CDN,
streaming, and e-commerce.

#### Recent projects

![Five repositories: three stacked as application, platform, and cloud; capsize and switchyard standing separately, connected to nothing.](docs/five-repositories.svg)

Three of these stack: **otel-service-reference** is the application,
**kubernetes-platform-reference** is the platform it runs on, and
**terragrunt-reference-architecture** is the cloud underneath.

The two arrows are drawn differently because the two edges are different. The
solid one is real but optional — the platform deploys this workload and builds
its sample image from a sibling checkout at `../otel-service-reference` when one
is on disk, and a fallback workload when there is none. It does not clone the
repository. The dashed one is conceptual: neither repository depends on the other
in code, configuration or CI, and the platform brings itself up on kind.

**capsize** and **switchyard** are joined to nothing. capsize is a read-only
Kubernetes CLI that scores cost waste against blast radius. switchyard is an
inference gateway that routes across three simulated providers and fails over
between them. Neither depends on any of the other three.

#### [Five checks that proved nothing](https://gist.github.com/bezilla/dff98698cf41129f5d262eb727ef445a)

Building these systems exposed failures their checks missed. Five investigations
into what went wrong, how I found it, and what changed.
