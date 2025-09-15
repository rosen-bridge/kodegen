---
to: "<%= features.database || features.logging ? `./${projectName}/src/bootstrap.ts` : null %>"
---
<% if (features.database) { -%>
import 'reflect-metadata';
<% } -%>
<% if (features.logging) { -%>
import { CallbackLoggerFactory } from '@rosen-bridge/callback-logger';
import WinstonLogger from '@rosen-bridge/winston-logger';

import {
  maxLogSize,
  maxLogFilesCount,
  logsPath,
  logLevel,
} from './configs';

CallbackLoggerFactory.init(new WinstonLogger([{
    type: 'file',
    path: logsPath,
    maxSize: maxLogSize,
    maxFiles: maxLogFilesCount,
    level: logLevel
}]));
<% } -%>
