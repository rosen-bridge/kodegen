---
to: "<%= features.express ? `./${servicePath}/src/types/router.ts` : null %>"
---
import { Router } from 'express';

export interface PathRouter {
  path: string;
  router: Router;
}
