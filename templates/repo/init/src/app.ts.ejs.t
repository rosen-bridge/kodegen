---
to: "<%= features.express ? `./${projectName}/src/app.ts` : null %>"
---
import express from 'express';

import { apiPort, apiHost } from '@/configs';
<% if (features.logging) { -%>
import { CallbackLoggerFactory } from '@rosen-bridge/callback-logger';
<% } -%>

import router from './router/v1';

<% if (features.logging) { -%>
const logger = CallbackLoggerFactory.getInstance().getLogger(import.meta.url);
<% } -%>

const app = express();

app.use(express.json());

app.use('/v1', router);

const startApp = () => {
  app.listen(apiPort, apiHost, () => {
<% if (features.logging) { -%>
    logger.info(`Service started at http://${apiHost}:${apiPort}`);
<% } else { -%>
    console.log(`Service started at http://${apiHost}:${apiPort}`);
<% } -%>
  });
};

export default startApp;
