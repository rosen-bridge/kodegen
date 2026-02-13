---
to: "<%= features.database || features.logging ? `./${projectName}/src/bootstrap.ts` : null %>"
---
<% if (features.database) { -%>
import 'reflect-metadata';
<% } -%>
<% if (features.logging) { -%>
import { DefaultLogger } from '@rosen-bridge/abstract-logger';
import WinstonLogger from '@rosen-bridge/winston-logger';

import { logs } from './configs';

DefaultLogger.init(WinstonLogger.createLogger(logs));
<% } -%>
