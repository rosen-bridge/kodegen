---
to: ./<%= servicePath %>/src/configs/index.ts
---
import config from 'config';
<% if (features.logging) { -%>
import { TransportOptions } from '@rosen-bridge/winston-logger';

export const logs = config.get<TransportOptions[]>('logs') ?? [];
<% } -%>

<% if (features.express) { -%>
export const apiPort = config.get<number>('api.port');
export const apiHost = config.get<string>('api.host');
<% } -%>
