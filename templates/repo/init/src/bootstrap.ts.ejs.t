---
to: "<%= features.database || features.logging ? `./${projectName}/src/bootstrap.ts` : null %>"
---
<% if (features.database) { -%>
import 'reflect-metadata';
<% } -%>
<% if (features.logging) { -%>
import WinstonLogger from '@rosen-bridge/winston-logger';

import {
  maxLogSize,
  maxLogFilesCount,
  logsPath,
  logLevel,
} from './configs';

await WinstonLogger.init([{
  type: 'file',
  maxSize: maxLogSize,
  maxFiles: maxLogFilesCount,
  path: logsPath,
  level: logLevel,
}]);
<% } -%>
