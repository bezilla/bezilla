## Paul Bezilla

Infrastructure and platform engineer. Kubernetes, observability, reliability,
and cloud systems.

### Recent projects

![Five repositories: three stacked as application, platform, and cloud; capsize and switchyard standing separately, connected to nothing.](docs/five-repositories.svg)

Three of these stack: **otel-service-reference** is the application,
**kubernetes-platform-reference** is the platform it runs on, and
**terragrunt-reference-architecture** is the cloud underneath.

**capsize** and **switchyard** are standalone systems. capsize is a read-only
Kubernetes CLI that scores cost waste against blast radius. switchyard is an
inference gateway that routes across three simulated providers and fails over
between them. Neither depends on any of the other three.

### Field notes

#### [Five checks that proved nothing](https://gist.github.com/bezilla/dff98698cf41129f5d262eb727ef445a)

Building these systems exposed failures their checks missed. Five investigations
into what went wrong, how I found it, and what changed.

#### [mktemp -t means the opposite thing on macOS and Linux](https://gist.github.com/bezilla/fecad698abd68a6807e1df1ca48b2a51)

`-t` takes a prefix on BSD and a template on GNU, so a line that works on macOS
is impossible on a Linux runner. Reproducing it without a Linux box, and the
form both accept.

#### [containerPort is documentation, not a boundary](https://gist.github.com/bezilla/88971adff569794e5c9fecbc9e312173)

A process answers on a port the pod spec never declares, and `kubectl
port-forward` reaches it anyway. What actually keeps that port unpublished, and
what `containerPort` does not do.

#### [A coin flip reported as a proof](https://gist.github.com/bezilla/ec7608946a115adfaded82e6198603f2)

A read-back assertion wrote through a load balancer and read through
`port-forward`, so it checked one replica in three. Why it passed against a
boundary broken on purpose, and the same defect surviving into the fix.
