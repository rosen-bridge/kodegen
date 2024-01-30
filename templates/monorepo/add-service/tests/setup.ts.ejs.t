---
to: "<%= features.testing || features.logging ? `./${servicePath}/tests/setup.ts` : null %>"
---
import '../src/bootstrap';
