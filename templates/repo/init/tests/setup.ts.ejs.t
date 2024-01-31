---
to: "<%= features.testing || features.logging ? `./${projectName}/tests/setup.ts` : null %>"
---
import '../src/bootstrap';
