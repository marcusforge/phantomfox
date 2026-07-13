PhantomFox
==========

A minimal, privacy-first web browser repackaging project, maintaining
cross-platform compatibility for Windows, Linux, and macOS.

Overview
--------
PhantomFox is a cross-platform repacking toolchain designed to strip
telemetry from upstream browser releases and enforce strict privacy
standards by default, without requiring from-scratch compilation.

Core Features
-------------
- Zero Telemetry: All data collection and tracking mechanisms are
  completely disabled via enterprise policies.
- Hardened Privacy: Integrated uBlock Origin and strict
  anti-fingerprinting policies enforced out of the box.
- Private Search: DuckDuckGo is configured as the default search
  provider.
- Automated Pipeline: Driven by CI/CD to automatically repackage
  stable upstream binaries with custom branding.
