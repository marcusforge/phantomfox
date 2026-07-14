PhantomFox
==========

PhantomFox is a minimal, privacy-first web browser repackaging toolchain.
Maintained initially for cross-platform compatibility, it builds a hardened
environment by stripping telemetry from upstream browser releases.

Features
--------
- Zero Telemetry: Data collection is disabled via enterprise policies.
- Hardened Privacy: Content blocking and anti-fingerprinting enforced.
- Private Search: DuckDuckGo is the default search provider.
- Automated Build: Shell-driven pipeline for reproducible repacking.

Requirements
------------
- bash
- wget
- tar

Installation
------------
Execute scripts/build.sh to fetch and repack the upstream binary.
