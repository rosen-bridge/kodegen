---
to: ./src/configs/index.ts
---
import config from 'config';

<% if (features.express) { -%>
export const apiPort = config.get<number>('apiPort');
<% } -%>
<% if (features.logging) { -%>

export const maxLogSize = config.get<string>('logs.maxSize');
export const maxLogFilesCount = config.get<string>('logs.maxFilesCount');
export const logsPath = config.get<string>('logs.path');
export const logLevel = config.get<string>('logs.level');
<% } -%>
