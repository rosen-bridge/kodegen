---
to: "<%= features.database || features.logging ? `./${servicePath}/src/bootstrap.ts` : null %>"
---
<% if (features.database) { -%>
import 'reflect-metadata';
<% } -%>
<% if (features.logging) { -%>
import { DefaultLogger } from '@rosen-bridge/abstract-logger';
import WinstonLogger from '@rosen-bridge/winston-logger';
import CallbackLogger from '@rosen-bridge/callback-logger';

import { logs } from './configs';

DefaultLogger.init(new CallbackLogger(WinstonLogger.createLogger(logs)));
<% } -%>
