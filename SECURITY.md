# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.0.0 (current) | Yes |
| Older releases | Best-effort; prefer upgrading to current |

## Reporting a Vulnerability

Please **do not** open a public issue for security-sensitive reports when a private channel is available.

**Maintainer contact (email):** `wilgat.wong@gmail.com`

- Source of contact: product **author-email** SSOT in [`LICENSE.md`](./LICENSE.md) (Copyright line).
- Prefer email for vulnerability details, reproduction steps, and impact.
- You should receive an acknowledgment when the report is received and actionable.
- Do not include exploit weaponization guides in public channels.

## Security Design Principles (CIAO)

This project follows **[CIAO](https://github.com/cloudgen/ciao)** / **CIAO-Lite** defensive design. Security-relevant intent:

| Letter | Principle | Security application |
|--------|-----------|----------------------|
| **C** | **Caution** | Fail closed on an unknown verb and on a cargo failure. A bare `self-uninstall` does not run cargo. |
| **I** | **Intentional** | The welcome line is the same sentence on the terminal and on menu row 1. The closed verb list is help, version, about, hello, and the four cargo lifecycle verbs. |
| **A** | **Anti-fragile** | Empty argv with no terminal prints help and returns 0. The about page reports cache paths and does not create them. |
| **O** | **Over-protect** | Day-to-day use is a user-level binary. Lifecycle rows call `cargo` and do not use root. The about page download URL stays empty, so the page does not show a `curl` install line. |

Full principles: [CIAO Defensive Programming](https://github.com/cloudgen/ciao) · agent contract: [CIAO-Lite](https://github.com/cloudgen/ciao-lite).

This section describes **design posture**. It is **not** a claim of third-party certification.

## Scope notes

- HolaTui is a **local** interactive CLI. It does **not** implement a shell installer or companion `.sha256` download integrity.
- Lifecycle verbs call `cargo` for the crate name `holatui`. They do not use `sudo`.
- Related product docs: [`README.md`](./README.md), [`LICENSE.md`](./LICENSE.md).
