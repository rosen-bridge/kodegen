---
to: "<%= features.express ? './src/app.ts' : null %>"
---
import express from 'express';

import { apiPort } from '@/configs';
<% if (features.logging) { -%>
import loggerFactory from '@/utils/logger';
<% } -%>

import router from './router/v1';

<% if (features.logging) { -%>
const logger = loggerFactory(import.meta.url);
<% } -%>

const app = express();

app.use(express.json());

app.use('/v1', router);

const startApp = () => {
  app.listen(apiPort, () => {
<% if (features.database) { -%>
    logger.info(`Service started at http://localhost:${apiPort}`);
<% } else { -%>
    console.log(`Service started at http://localhost:${apiPort}`);
<% } -%>
  });
};

export default startApp;
