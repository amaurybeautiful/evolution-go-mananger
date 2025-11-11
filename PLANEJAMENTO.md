# Evolution GO Manager - Planejamento de Desenvolvimento

## Visão Geral do Projeto

**Evolution GO Manager** é uma interface web moderna e intuitiva para gerenciamento de instâncias WhatsApp através da API Evolution GO. O projeto será desenvolvido em React 19 + TypeScript + Vite, utilizando o design system interno `@evoapi/design-system` para manter consistência visual com os demais produtos da plataforma EvoAI.

---

## Objetivos Principais

1. **Gerenciamento de Instâncias**: Interface completa para criar, conectar, desconectar e deletar instâncias WhatsApp
2. **QR Code Authentication**: Display de QR Code para autenticação de novas instâncias
3. **Monitoramento em Tempo Real**: WebSocket para eventos e status das conexões
4. **Envio de Mensagens**: Interface para testes de envio de mensagens (texto, mídia, contatos, localização)
5. **Configuração de Webhooks**: Gerenciamento de webhooks por instância
6. **Dashboard Analytics**: Visualização de métricas e estatísticas das instâncias

---

## Stack Tecnológica

### Core
- **React** 19.0.0 - Framework UI
- **TypeScript** ~5.7.2 - Type safety
- **Vite** ^6.3.1 - Build tool e dev server
- **React Router DOM** ^7.6.0 - Roteamento

### UI/UX
- **@evoapi/design-system** ^0.0.5 - Design system interno
- **Tailwind CSS** ^4.1.11 - Utility-first CSS
- **Lucide React** ^0.525.0 - Ícones
- **class-variance-authority** ^0.7.1 - Component variants
- **clsx** + **tailwind-merge** - Class management

### Formulários & Validação
- **React Hook Form** ^7.56.3 - Form management
- **Zod** ^3.24.4 - Schema validation
- **@hookform/resolvers** ^5.0.1 - Form validation integration

### State Management
- **Zustand** ^5.0.7 - Global state management (leve e performático)

### HTTP & WebSocket
- **Axios** ^1.11.0 - HTTP client
- **Native WebSocket API** - Para eventos em tempo real

### Utilitários
- **date-fns** ^4.1.0 - Manipulação de datas
- **uuid** ^11.1.0 - Geração de IDs únicos

---

## Arquitetura de Pastas

```
evolution-go-manager/
├── public/
│   └── favicon.ico
├── src/
│   ├── components/
│   │   ├── instances/
│   │   │   ├── InstanceCard.tsx           # Card de instância com status
│   │   │   ├── InstanceList.tsx           # Lista de instâncias
│   │   │   ├── CreateInstanceModal.tsx    # Modal de criação
│   │   │   ├── QRCodeDisplay.tsx          # Display QR Code
│   │   │   ├── ConnectionStatusBadge.tsx  # Badge de status
│   │   │   └── InstanceActions.tsx        # Ações (connect, disconnect, delete)
│   │   ├── messages/
│   │   │   ├── MessageSender.tsx          # Form de envio
│   │   │   ├── MediaUploader.tsx          # Upload de mídia
│   │   │   ├── MessageHistory.tsx         # Histórico
│   │   │   └── MessagePreview.tsx         # Preview de mensagem
│   │   ├── webhooks/
│   │   │   ├── WebhookForm.tsx            # Configuração de webhook
│   │   │   ├── WebhookList.tsx            # Lista de webhooks
│   │   │   └── WebhookTestPanel.tsx       # Painel de teste
│   │   ├── events/
│   │   │   ├── EventMonitor.tsx           # Monitor em tempo real
│   │   │   ├── EventLogViewer.tsx         # Log de eventos
│   │   │   └── EventFilter.tsx            # Filtros de eventos
│   │   └── base/
│   │       ├── Layout.tsx                 # Layout principal
│   │       ├── Sidebar.tsx                # Sidebar navigation
│   │       ├── Header.tsx                 # Header com user menu
│   │       ├── LoadingScreen.tsx          # Loading state
│   │       └── ErrorBoundary.tsx          # Error handling
│   ├── pages/
│   │   ├── Dashboard.tsx                  # Overview e métricas
│   │   ├── Instances.tsx                  # Gerenciamento de instâncias
│   │   ├── InstanceDetail.tsx             # Detalhes de uma instância
│   │   ├── Messages.tsx                   # Envio de mensagens
│   │   ├── Events.tsx                     # Monitor de eventos
│   │   ├── Settings.tsx                   # Configurações globais
│   │   └── Login.tsx                      # Autenticação (API key)
│   ├── services/
│   │   ├── api/
│   │   │   ├── client.ts                  # Axios client configurado
│   │   │   ├── instances.ts               # Instance API calls
│   │   │   ├── messages.ts                # Message API calls
│   │   │   ├── webhooks.ts                # Webhook API calls
│   │   │   └── events.ts                  # Events API calls
│   │   └── websocket/
│   │       └── eventService.ts            # WebSocket connection manager
│   ├── hooks/
│   │   ├── useInstances.ts                # Hook para instâncias
│   │   ├── useWebSocket.ts                # Hook para WebSocket
│   │   ├── useMessages.ts                 # Hook para mensagens
│   │   ├── useAuth.ts                     # Hook para autenticação
│   │   └── useEventLog.ts                 # Hook para log de eventos
│   ├── store/
│   │   ├── authStore.ts                   # Zustand: Auth state
│   │   ├── instancesStore.ts              # Zustand: Instances state
│   │   ├── eventsStore.ts                 # Zustand: Events state
│   │   └── settingsStore.ts               # Zustand: Settings state
│   ├── types/
│   │   ├── instance.ts                    # Types para instâncias
│   │   ├── message.ts                     # Types para mensagens
│   │   ├── webhook.ts                     # Types para webhooks
│   │   ├── event.ts                       # Types para eventos
│   │   └── api.ts                         # Types gerais da API
│   ├── utils/
│   │   ├── apiHelpers.ts                  # Helpers para API
│   │   ├── formatters.ts                  # Formatação de dados
│   │   ├── validators.ts                  # Validações customizadas
│   │   └── constants.ts                   # Constantes da aplicação
│   ├── styles/
│   │   └── globals.css                    # Estilos globais
│   ├── App.tsx                            # App root
│   ├── main.tsx                           # Entry point
│   └── vite-env.d.ts                      # Vite types
├── .gitignore
├── Dockerfile                             # Docker build
├── docker-compose.yml                     # Standalone compose
├── eslint.config.js                       # ESLint config
├── index.html                             # HTML entry
├── package.json                           # Dependencies
├── tailwind.config.js                     # Tailwind config
├── tsconfig.json                          # TypeScript config
├── vite.config.ts                         # Vite config
├── PLANEJAMENTO.md                        # Este arquivo
└── README.md                              # Documentação do projeto
```

---

## Fases de Desenvolvimento

### **Fase 1: Setup Inicial (Sprint 1 - 2 dias)**

#### 1.1 Configuração do Projeto ✅
- [x] Criar estrutura de diretórios
- [x] Inicializar projeto com Vite + React + TypeScript
- [x] Configurar package.json com todas dependências (444 packages instalados)
- [x] Setup Tailwind CSS + PostCSS (via @tailwindcss/vite)
- [x] Configurar path aliases no vite.config.ts
- [x] Setup ESLint (com typescript-eslint)
- [x] Criar index.html
- [x] Criar README.md
- [x] Build teste executado com sucesso (194.83 kB / 60.95 kB gzipped)

#### 1.2 Configuração Base ✅
- [x] Implementar ErrorBoundary (com UI amigável e error details)
- [x] Implementar LoadingScreen (fullScreen e inline variants)
- [x] Setup React Router com rotas principais (6 páginas criadas)
- [x] Criar Layout base (Header + Sidebar + navegação funcional)
- [x] Configurar Axios client com interceptors:
  - [x] Adicionar header `apikey` automaticamente de authStore
  - [x] Usar baseURL dinâmica de authStore
  - [x] Interceptor de resposta para tratar 401 (logout automático)
  - [x] Interceptor de erro para mensagens amigáveis
- [x] Setup Zustand stores básicos (authStore com persistência)
- [x] Criar useAuth hook customizado
- [x] Integrar auth em App.tsx e Header.tsx
- [x] Build teste executado (305.41 kB / 100.37 kB gzipped)

#### 1.3 Autenticação ✅
- [x] Criar página de Login com campos:
  - [x] API URL (base URL da Evolution GO)
  - [x] API Key (GLOBAL_API_KEY configurado no Evolution GO)
  - [x] Botão "Conectar" com validação
  - [x] Layout idêntico ao evo-ai-frontend
  - [x] Componentes do @evoapi/design-system
- [x] Implementar authStore (Zustand) com:
  - [x] `apiUrl` - URL base da API
  - [x] `apiKey` - Token de autenticação global
  - [x] `isAuthenticated` - Estado de autenticação
  - [x] `login()` - Método para validar e salvar credenciais usando `/server/ok`
  - [x] `logout()` - Método para limpar credenciais
  - [x] Persistência no localStorage
- [x] Criar hook useAuth para acesso ao authStore
- [x] Implementar validação de conexão:
  - [x] Testar conexão com endpoint `/server/ok` ✅
  - [x] Validar se API Key é válida (header `apikey`)
  - [x] React Hook Form + Zod para validação
- [x] Configurar Tailwind com CSS custom properties
- [x] Importar design system CSS
- [ ] Criar ProtectedRoute component
- [ ] Adicionar Toaster (Sonner) para notificações

**Entregável Fase 1**: Projeto rodando com autenticação funcional ✅ (falta apenas ProtectedRoute + Toaster)

---

### **Fase 2: Gerenciamento de Instâncias (Sprint 2 - 5 dias)**

#### 2.1 API Service - Instâncias
- [ ] Implementar `services/api/instances.ts`:
  - [ ] `fetchInstances()` - GET /instance/fetchInstances
  - [ ] `createInstance()` - POST /instance/create
  - [ ] `connectInstance()` - GET /instance/connect/:instanceName
  - [ ] `disconnectInstance()` - DELETE /instance/logout/:instanceName
  - [ ] `deleteInstance()` - DELETE /instance/delete/:instanceName
  - [ ] `getConnectionState()` - GET /instance/connectionState/:instanceName

#### 2.2 Types & Store
- [ ] Definir types em `types/instance.ts`:
  ```typescript
  type InstanceStatus = 'open' | 'connecting' | 'close'
  interface Instance {
    instanceName: string
    status: InstanceStatus
    serverUrl?: string
    apikey?: string
    owner: string
    profileName?: string
    profilePicUrl?: string
    createdAt: string
    updatedAt: string
  }
  ```
- [ ] Implementar `store/instancesStore.ts` com Zustand

#### 2.3 Componentes de Instâncias
- [ ] **InstanceCard.tsx**: Card visual com status, nome, foto
- [ ] **InstanceList.tsx**: Grid/List de cards
- [ ] **CreateInstanceModal.tsx**: Modal com formulário (react-hook-form + zod)
- [ ] **QRCodeDisplay.tsx**: Display de QR code com polling de status
- [ ] **ConnectionStatusBadge.tsx**: Badge colorido (verde/amarelo/vermelho)
- [ ] **InstanceActions.tsx**: Botões de ação (connect, disconnect, delete)

#### 2.4 Páginas
- [ ] **Dashboard.tsx**:
  - [ ] Cards de métricas (total, conectadas, desconectadas)
  - [ ] Lista resumida de instâncias
  - [ ] Gráfico de atividade (opcional)
- [ ] **Instances.tsx**:
  - [ ] Botão "Nova Instância"
  - [ ] Listagem completa com search/filter
  - [ ] Actions por instância
- [ ] **InstanceDetail.tsx**:
  - [ ] Detalhes completos da instância
  - [ ] Configurações de webhook
  - [ ] Histórico de eventos

#### 2.5 Hooks
- [ ] **useInstances.ts**:
  - [ ] useInstancesList
  - [ ] useInstanceDetail
  - [ ] useCreateInstance
  - [ ] useConnectInstance
  - [ ] useDeleteInstance

**Entregável Fase 2**: CRUD completo de instâncias com QR code

---

### **Fase 3: Sistema de Mensagens (Sprint 3 - 4 dias)**

#### 3.1 API Service - Mensagens
- [ ] Implementar `services/api/messages.ts`:
  - [ ] `sendTextMessage()`
  - [ ] `sendMediaMessage()`
  - [ ] `sendContactMessage()`
  - [ ] `sendLocationMessage()`
  - [ ] `fetchMessages()` - Histórico

#### 3.2 Types
- [ ] Definir types em `types/message.ts`:
  ```typescript
  type MessageType = 'text' | 'image' | 'video' | 'audio' | 'document' | 'contact' | 'location'
  interface SendMessagePayload {
    number: string
    text?: string
    mediaUrl?: string
    mediaCaption?: string
    // ... outros campos
  }
  ```

#### 3.3 Componentes de Mensagens
- [ ] **MessageSender.tsx**: Form completo com tabs (texto, mídia, contato, localização)
- [ ] **MediaUploader.tsx**: Upload com preview e validação
- [ ] **MessageHistory.tsx**: Lista de mensagens enviadas/recebidas
- [ ] **MessagePreview.tsx**: Preview antes de enviar

#### 3.4 Página
- [ ] **Messages.tsx**:
  - [ ] Seletor de instância
  - [ ] Form de envio com tabs
  - [ ] Preview de mensagem
  - [ ] Histórico (opcional)

#### 3.5 Hooks
- [ ] **useMessages.ts**:
  - [ ] useSendMessage
  - [ ] useMessageHistory

**Entregável Fase 3**: Envio de mensagens funcionando com todos os tipos

---

### **Fase 4: Webhooks (Sprint 4 - 3 dias)**

#### 4.1 API Service - Webhooks
- [ ] Implementar `services/api/webhooks.ts`:
  - [ ] `setWebhook()`
  - [ ] `getWebhook()`

#### 4.2 Types
- [ ] Definir types em `types/webhook.ts`:
  ```typescript
  interface WebhookConfig {
    url: string
    enabled: boolean
    events?: string[]
    webhookByEvents?: boolean
    webhookBase64?: boolean
  }
  ```

#### 4.3 Componentes
- [ ] **WebhookForm.tsx**: Formulário de configuração
- [ ] **WebhookList.tsx**: Lista de webhooks configurados
- [ ] **WebhookTestPanel.tsx**: Enviar evento de teste

#### 4.4 Integração
- [ ] Adicionar configuração de webhook no InstanceDetail.tsx
- [ ] Criar seção em Settings.tsx para webhooks globais

**Entregável Fase 4**: Configuração de webhooks por instância

---

### **Fase 5: Eventos em Tempo Real (Sprint 5 - 4 dias)**

#### 5.1 WebSocket Service
- [ ] Implementar `services/websocket/eventService.ts`:
  - [ ] Conexão WebSocket
  - [ ] Reconnection logic
  - [ ] Event handlers
  - [ ] Subscribe/Unsubscribe

#### 5.2 Types
- [ ] Definir types em `types/event.ts`:
  ```typescript
  type EventType = 'messages.upsert' | 'connection.update' | 'qr.code' | ...
  interface Event {
    event: EventType
    instance: string
    data: any
    timestamp: string
  }
  ```

#### 5.3 Store
- [ ] **eventsStore.ts**:
  - [ ] Buffer de eventos (últimos 100)
  - [ ] Filtros ativos
  - [ ] Status da conexão WebSocket

#### 5.4 Componentes
- [ ] **EventMonitor.tsx**: Display em tempo real com auto-scroll
- [ ] **EventLogViewer.tsx**: Histórico navegável
- [ ] **EventFilter.tsx**: Filtros por tipo, instância, timestamp

#### 5.5 Página
- [ ] **Events.tsx**:
  - [ ] Monitor em tempo real
  - [ ] Filtros
  - [ ] Estatísticas

#### 5.6 Hooks
- [ ] **useWebSocket.ts**: Gerenciamento de conexão
- [ ] **useEventLog.ts**: Acesso ao buffer de eventos

#### 5.7 Integração
- [ ] Adicionar indicador de eventos no Dashboard
- [ ] Notificações toast para eventos importantes
- [ ] Badge de eventos não lidos no Sidebar

**Entregável Fase 5**: Monitor de eventos em tempo real funcionando

---

### **Fase 6: Settings & Refinamentos (Sprint 6 - 3 dias)**

#### 6.1 Configurações
- [ ] **Settings.tsx**:
  - [ ] API URL configuration
  - [ ] Global API key
  - [ ] WebSocket URL
  - [ ] Tema (dark/light)
  - [ ] Idioma (i18n preparado)

#### 6.2 Store
- [ ] **settingsStore.ts**:
  - [ ] Persistência com localStorage
  - [ ] Validação de URLs

#### 6.3 Melhorias de UX
- [ ] Implementar skeleton loaders
- [ ] Adicionar empty states
- [ ] Melhorar error handling
- [ ] Adicionar confirmações (delete, disconnect)
- [ ] Implementar toast notifications (sonner)

#### 6.4 Responsividade
- [ ] Testar e ajustar em mobile
- [ ] Sidebar responsiva (hamburguer)
- [ ] Cards responsivos

**Entregável Fase 6**: Aplicação completa e polida

---

### **Fase 7: Docker & Deploy (Sprint 7 - 2 dias)**

#### 7.1 Containerização
- [ ] Criar Dockerfile multi-stage:
  ```dockerfile
  FROM node:20-alpine AS builder
  # Build da aplicação

  FROM nginx:alpine
  # Servir build estático
  ```

#### 7.2 Docker Compose
- [ ] Criar docker-compose.yml standalone
- [ ] Integrar no docker-compose do evoai-services
- [ ] Configurar networks e depends_on

#### 7.3 CI/CD (Opcional)
- [ ] Setup GitHub Actions
- [ ] Build automatizado
- [ ] Deploy automatizado

**Entregável Fase 7**: Aplicação rodando em container

---

## API Endpoints do Evolution GO

**IMPORTANTE**: Todos os endpoints requerem o header `apikey` com o valor do `GLOBAL_API_KEY`.

### Autenticação
```
Header: apikey: <GLOBAL_API_KEY>
```

### Server Status (para validação de conexão)
```
GET    /server/ok
       Retorna: { "status": "ok" } - Usado para validar conexão no login
```

### Instance Management
```
POST   /instance/create
       Body: { "name": "string", "token": "string", "proxy": {...}, "advancedSettings": {...} }
       Retorna: { "message": "success", "data": {...} }

GET    /instance/all
       Retorna: { "message": "success", "data": [...] } - Lista todas as instâncias

GET    /instance/info/:instanceId
       Retorna: Detalhes de uma instância específica

POST   /instance/connect
       Body: { "webhookUrl": "string", "subscribe": [], "immediate": bool, "phone": "string" }
       Retorna: { "message": "success", "data": { "jid": "...", "webhookUrl": "...", "eventString": "..." } }

POST   /instance/reconnect
       Reconecta a instância (requer instanceName no header Auth)

POST   /instance/disconnect
       Desconecta a instância (requer instanceName no header Auth)

DELETE /instance/logout
       Faz logout da instância (requer instanceName no header Auth)

DELETE /instance/delete/:instanceId
       Remove a instância permanentemente

GET    /instance/status
       Retorna: Status da conexão (requer instanceName no header Auth)

GET    /instance/qr
       Retorna: QR Code para autenticação (requer instanceName no header Auth)

POST   /instance/pair
       Body: { "phone": "5511999999999", "subscribe": [] }
       Retorna: Código de pareamento (alternativa ao QR Code)

POST   /instance/proxy/:instanceId
       Body: { "host": "string", "port": "string", "username": "string", "password": "string" }
       Configura proxy para a instância

DELETE /instance/proxy/:instanceId
       Remove configuração de proxy

POST   /instance/forcereconnect/:instanceId
       Body: { "number": "5511999999999" }
       Força reconexão com número específico

GET    /instance/logs/:instanceId?start_date=YYYY-MM-DD&end_date=YYYY-MM-DD&level=INFO&limit=100
       Retorna: Logs da instância

GET    /instance/:instanceId/advanced-settings
       Retorna: Configurações avançadas da instância

PUT    /instance/:instanceId/advanced-settings
       Body: { "alwaysOnline": bool, "rejectCall": bool, "readMessages": bool, "ignoreGroups": bool, "ignoreStatus": bool }
       Atualiza configurações avançadas
```

### Messages (Autenticação por instanceName no header)
```
POST   /send/text
       Body: { "number": "5511999999999", "text": "Hello" }

POST   /send/media
       Body: { "number": "5511999999999", "mediaUrl": "url", "caption": "text" }

POST   /send/contact
       Body: { "number": "5511999999999", "contact": {...} }

POST   /send/location
       Body: { "number": "5511999999999", "latitude": -23.5, "longitude": -46.6 }

POST   /send/link
       Body: { "number": "5511999999999", "url": "...", "caption": "..." }

POST   /send/poll
       Body: { "number": "5511999999999", "poll": {...} }

POST   /send/sticker
       Body: { "number": "5511999999999", "sticker": {...} }

POST   /send/button
       Body: { "number": "5511999999999", "buttons": [...] }

POST   /send/list
       Body: { "number": "5511999999999", "list": {...} }
```

### Events (WebSocket)
```
WS     /ws?token=<GLOBAL_API_KEY>&instanceId=<instanceName>
       Eventos: messages.upsert, connection.update, qr.code, etc
```

---

## Configuração

**Nota**: URL da API e API Key são configurados dinamicamente via formulário de login e armazenados no localStorage do navegador.
Isso permite que o manager seja usado com múltiplas instâncias Evolution GO sem rebuild.

---

## Comandos Make (Sugestões)

```makefile
# Makefile
.PHONY: dev build preview install clean

dev:
	npm run dev

build:
	npm run build

preview:
	npm run preview

install:
	npm install

lint:
	npm run lint

lint-fix:
	npm run lint:fix

clean:
	rm -rf node_modules dist

docker-build:
	docker build -t evolution-go-manager:latest .

docker-run:
	docker run -p 5173:80 evolution-go-manager:latest
```

---

## Integração com evoai-services

### docker-compose.yml (adicionar)
```yaml
evolution-go-manager:
  build:
    context: ./evolution-go-manager
    dockerfile: Dockerfile
  container_name: evolution-go-manager
  ports:
    - "5174:80"
  networks:
    - local-net
  depends_on:
    - evolution-go
  profiles:
    - evolution
    - full
```

## Considerações de Design

### Paleta de Cores (seguir design system)
- Primary: Cores do @evoapi/design-system
- Status:
  - Verde: Conectado
  - Amarelo: Conectando
  - Vermelho: Desconectado
  - Cinza: Inativo

### Ícones (Lucide React)
- Instance: `Smartphone`
- Messages: `MessageSquare`
- Webhooks: `Webhook`
- Events: `Activity`
- Settings: `Settings`
- QR Code: `QrCode`

### Componentes do Design System a Utilizar
- Button
- Card
- Input
- Select
- Modal
- Badge
- Table
- Toast
- Skeleton
- Tabs

---

## Métricas de Sucesso

1. **Performance**
   - First Contentful Paint < 1s
   - Time to Interactive < 2s
   - WebSocket reconnection < 500ms

2. **UX**
   - Todas as ações com feedback visual
   - Loading states em todas operações async
   - Error handling com mensagens claras

3. **Código**
   - 100% TypeScript (sem `any`)
   - Componentes reutilizáveis
   - Hooks customizados para lógica complexa
   - Zero warnings no console

---

## Testes (Fase 8 - Opcional)

### Unit Tests (Vitest)
- [ ] Testar hooks customizados
- [ ] Testar utils/helpers
- [ ] Testar stores (Zustand)

### Integration Tests
- [ ] Testar fluxos principais
- [ ] Testar API service com mocks

### E2E Tests (Playwright - Opcional)
- [ ] Fluxo de criação de instância
- [ ] Fluxo de envio de mensagem
- [ ] Fluxo de configuração de webhook

---

## Documentação

### README.md deve conter:
- [ ] Descrição do projeto
- [ ] Screenshots
- [ ] Setup inicial
- [ ] Comandos disponíveis
- [ ] Variáveis de ambiente
- [ ] Estrutura de pastas
- [ ] Contribuindo

### Swagger/Postman (Opcional)
- [ ] Collection de endpoints da API Evolution GO
- [ ] Exemplos de payloads

---

## Timeline Estimado

| Fase | Descrição | Duração | Status |
|------|-----------|---------|--------|
| 1 | Setup Inicial | 2 dias | **Em Progresso** (1.1 ✅ 1.2 ✅) |
| 2 | Gerenciamento de Instâncias | 5 dias | Pendente |
| 3 | Sistema de Mensagens | 4 dias | Pendente |
| 4 | Webhooks | 3 dias | Pendente |
| 5 | Eventos em Tempo Real | 4 dias | Pendente |
| 6 | Settings & Refinamentos | 3 dias | Pendente |
| 7 | Docker & Deploy | 2 dias | Pendente |
| 8 | Testes (Opcional) | 3 dias | Pendente |

**Total Estimado**: 23-26 dias úteis (~5-6 semanas)

---

## Próximos Passos Imediatos

1. [x] ~~Inicializar projeto com `npm create vite@latest`~~
2. [x] ~~Instalar todas dependências~~
3. [x] ~~Configurar Tailwind CSS~~
4. [x] ~~Configurar path aliases~~
5. [ ] **[PRÓXIMO]** Implementar componentes base (ErrorBoundary, LoadingScreen, Layout)
6. [ ] Configurar Axios client com interceptors
7. [ ] Implementar authStore (Zustand)
8. [ ] Criar página de Login
9. [ ] Implementar autenticação completa

---

## Notas Adicionais

- **Design System**: Garantir que todos componentes usem o `@evoapi/design-system`
- **Responsividade**: Mobile-first approach
- **Acessibilidade**: ARIA labels em todos elementos interativos
- **Internacionalização**: Estrutura pronta para i18n (React i18next)
- **Performance**: Code splitting por rota
- **Segurança**: Validação de inputs, sanitização de HTML

---

**Versão do Planejamento**: 1.1
**Data Última Atualização**: 2025-11-11 15:24
**Autor**: Claude Code + etus_0104
**Status**: Em Desenvolvimento - Fase 1.1 Completa ✅

---

## Changelog

### 2025-11-11 15:24 - Fase 1.1 Completa
- ✅ Projeto inicializado com Vite + React 19 + TypeScript
- ✅ 444 dependências instaladas
- ✅ Tailwind CSS configurado
- ✅ Path aliases configurados
- ✅ ESLint configurado
- ✅ Build teste executado com sucesso

### 2025-11-11 15:35 - Fase 1.2 Completa
- ✅ ErrorBoundary implementado (tratamento de erros com UI)
- ✅ LoadingScreen implementado (fullScreen + inline)
- ✅ React Router configurado (6 páginas criadas)
- ✅ Layout completo (Header + Sidebar + navegação)
- ✅ Axios client com interceptors (apikey, baseURL dinâmica, 401 handling)
- ✅ authStore (Zustand) com persistência em localStorage
- ✅ useAuth hook customizado
- ✅ Build executado: 305.41 kB JS / 13.30 kB CSS
- ✅ 19 arquivos TypeScript/TSX criados
- 📝 Próximo: Fase 1.3 - Implementar formulário de Login
