# OTel demo — Postgres capacity (Terraform remediator)

Owned capacity knob for SRE **UC4** (`ProductReviewsBackendErrors` → `infra.db.capacity`).

Live Astronomy Shop Postgres is in-cluster; this module is the **production-shaped** Terraform remediator Aiden opens (same class as an RDS parameter-group `max_connections` bump).

| State | `max_connections` |
|-------|-------------------|
| Baseline (exhausted / demo start) | `50` |
| Remediation (IE PR) | `200` |

Do not apply from the demo minute unless you intend to take over a real stack — show the PR.
