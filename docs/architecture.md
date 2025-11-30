# Architecture Guide

Technical architecture patterns for deploying AI solutions in UK public sector organisations.

## 🏗️ Reference Architecture

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        User Layer                            │
│  Web Portal │ Mobile App │ Chat │ Teams/Slack │ Voice       │
└──────────────────────────┬──────────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                    API Gateway Layer                         │
│  Authentication │ Rate Limiting │ Routing │ Monitoring      │
└──────────────────────────┬──────────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                    AI Services Layer                         │
│  NLP Engine │ Document AI │ Prediction │ Analytics          │
└──────────────────────────┬──────────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────────┘
│                 Integration Layer                            │
│  CRM Connector │ HMS Connector │ HR Connector │ Finance     │
└──────────────────────────┬──────────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                  Back-Office Systems                         │
│  Civica │ NEC │ MS Dynamics │ iTrent │ SharePoint          │
└─────────────────────────────────────────────────────────────┘
```

## 📐 Deployment Models

### 1. Cloud-Hosted Architecture

**Recommended for:** Most organisations, fastest deployment

```
┌─────────────────────────────────────────────────────────┐
│                     Azure UK South                       │
│                                                          │
│  ┌──────────────┐     ┌─────────────┐   ┌───────────┐  │
│  │   App        │────▶│   AI         │──▶│  Cosmos   │  │
│  │   Service    │     │   Services   │   │   DB      │  │
│  └──────────────┘     └─────────────┘   └───────────┘  │
│         │                                                │
│         │              ┌─────────────┐                  │
│         └─────────────▶│  Key Vault  │                  │
│                        └─────────────┘                  │
└────────────────────┬────────────────────────────────────┘
                     │ Secure Tunnel (VPN/PSN)
                     │
┌────────────────────▼────────────────────────────────────┐
│              On-Premise Systems                         │
│   Civica │ NEC │ Active Directory │ File Servers       │
└─────────────────────────────────────────────────────────┘
```

**Components:**
- **Azure App Service** - Web hosting, auto-scaling
- **Azure AI Services** - Cognitive Services, OpenAI
- **Cosmos DB** - User data, conversation history
- **Key Vault** - Secrets management
- **Application Insights** - Monitoring and logging
- **VPN Gateway** - Secure connection to on-premise

**Benefits:**
- Low infrastructure costs
- Automatic scaling
- 99.9% uptime SLA
- Pay-as-you-go pricing
- Automatic updates

**Typical Cost:** £3-10 per user/home per year

---

### 2. Hybrid Architecture

**Recommended for:** Data sovereignty requirements, gradual cloud adoption

```
┌─────────────────────────────────────────────────────────┐
│                     Cloud (Azure/AWS)                    │
│  ┌──────────────┐     ┌─────────────┐                   │
│  │   Web UI     │────▶│   AI        │                   │
│  │              │     │   Engine    │                   │
│  └──────────────┘     └──────┬──────┘                   │
└────────────────────────────┬──┬──────────────────────────┘
                             │  │
                      API Gateway │
                             │  │
┌────────────────────────────▼──▼──────────────────────────┐
│              On-Premise Infrastructure                   │
│  ┌──────────────┐     ┌─────────────┐   ┌───────────┐   │
│  │   API        │────▶│   Data      │──▶│  Existing │   │
│  │   Gateway    │     │   Store     │   │  Systems  │   │
│  └──────────────┘     └─────────────┘   └───────────┘   │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

**Components:**

**Cloud:**
- AI processing and training
- Web/mobile interfaces
- Analytics and reporting

**On-Premise:**
- Data storage
- System integration
- Active Directory
- Existing back-office systems

**Benefits:**
- Data stays on-premise
- Leverage cloud AI capabilities
- Gradual migration path
- Control over sensitive data

**Typical Cost:** £5-15 per user/home per year

---

### 3. On-Premise Architecture

**Recommended for:** Strict data policies, air-gapped environments

```
┌─────────────────────────────────────────────────────────┐
│              On-Premise Data Centre                      │
│                                                          │
│  ┌──────────────┐     ┌─────────────┐   ┌───────────┐  │
│  │   Web        │────▶│   AI        │──▶│  Database │  │
│  │   Servers    │     │   Runtime   │   │           │  │
│  └──────────────┘     └─────────────┘   └───────────┘  │
│         │                                                │
│         │              ┌─────────────┐                  │
│         └─────────────▶│  Integration│──────────┐       │
│                        │  Layer      │          │       │
│                        └─────────────┘          │       │
│                                                 │       │
│  ┌──────────────┐     ┌─────────────┐   ┌──────▼────┐  │
│  │  Civica      │     │    NEC      │   │  iTrent   │  │
│  └──────────────┘     └─────────────┘   └───────────┘  │
└──────────────────────────────────────────────────────────┘
```

**Infrastructure Requirements:**
- **Compute:** 8+ vCPU, 32GB+ RAM per service
- **Storage:** 500GB+ SSD for models and data
- **GPU:** Optional for advanced AI models
- **Network:** 1Gbps+ internal network
- **Backup:** Regular backup infrastructure

**Benefits:**
- Complete data control
- No cloud dependency
- Existing infrastructure use
- Air-gapped capability

**Typical Cost:** £8-25 per user/home per year + infrastructure

---

## 🔌 Integration Patterns

### Pattern 1: API Gateway Pattern

**Best for:** RESTful system integration

```
┌──────────────┐         ┌──────────────┐         ┌─────────┐
│   AI         │────────▶│    API       │────────▶│  Civica │
│   Service    │  HTTPS  │    Gateway   │  HTTPS  │  CRM    │
└──────────────┘         └──────┬───────┘         └─────────┘
                                │
                         ┌──────▼───────┐
                         │  Rate Limit  │
                         │  Auth Token  │
                         │  Transform   │
                         └──────────────┘
```

**Configuration:**
- OAuth 2.0 or API key authentication
- Rate limiting (e.g., 100 req/min)
- Request/response transformation
- Error handling and retry logic

**Example (Azure API Management):**
```xml
<policies>
  <inbound>
    <rate-limit calls="100" renewal-period="60" />
    <validate-jwt header-name="Authorization" />
    <set-backend-service base-url="https://civica.example.com/api" />
  </inbound>
</policies>
```

---

### Pattern 2: Event-Driven Pattern

**Best for:** Real-time processing, high-volume events

```
┌──────────────┐         ┌──────────────┐         ┌─────────┐
│  Source      │  Event  │  Event Hub/  │  Event  │   AI    │
│  System      │────────▶│  Service Bus │────────▶│ Processor│
└──────────────┘         └──────────────┘         └────┬────┘
                                                       │
                                                  ┌────▼────┐
                                                  │  Action │
                                                  └─────────┘
```

**Use Cases:**
- Repairs logging triggers AI triage
- UC payment received triggers arrears update
- Planning app submitted triggers analysis
- Employee absence triggers workflow

**Example (Azure Service Bus):**
```json
{
  "eventType": "RepairReported",
  "data": {
    "tenantId": "12345",
    "description": "Boiler not working",
    "urgency": "high"
  },
  "timestamp": "2025-11-30T10:30:00Z"
}
```

---

### Pattern 3: Batch Integration Pattern

**Best for:** Nightly data sync, bulk processing

```
┌──────────────┐    Daily   ┌──────────────┐         ┌─────────┐
│  Source      │   Extract  │  Data Lake   │  Batch  │   AI    │
│  System      │───────────▶│   Storage    │────────▶│ Process │
└──────────────┘            └──────────────┘         └────┬────┘
                                                          │
                                                     ┌────▼────┐
                                                     │ Results │
                                                     │ Load    │
                                                     └─────────┘
```

**Use Cases:**
- Nightly arrears prediction
- Weekly stock condition analysis
- Monthly performance reporting
- Quarterly impact analysis

**Example (Azure Data Factory):**
```json
{
  "name": "DailyArrearsSync",
  "type": "Copy",
  "source": {
    "type": "SqlSource",
    "sqlReaderQuery": "SELECT * FROM Tenancies WHERE LastModified > @{yesterday}"
  },
  "sink": {
    "type": "BlobSink"
  }
}
```

---

### Pattern 4: Webhook Pattern

**Best for:** Event callbacks, real-time notifications

```
┌──────────────┐         ┌──────────────┐
│   AI         │  POST   │  Webhook     │
│   Service    │────────▶│  Endpoint    │
└──────────────┘  HTTPS  └──────────────┘
                             │
                        ┌────▼────┐
                        │  Your   │
                        │  System │
                        └─────────┘
```

**Use Cases:**
- AI completes document analysis → notify user
- Risk threshold breached → alert manager
- Compliance check failed → trigger workflow

**Example Webhook Payload:**
```json
{
  "event": "document.analyzed",
  "documentId": "DOC-12345",
  "results": {
    "confidence": 0.95,
    "category": "planning-application",
    "extractedData": {...}
  },
  "timestamp": "2025-11-30T10:30:00Z"
}
```

---

## 🔐 Security Architecture

### Network Security

```
                         Internet
                            │
                    ┌───────▼───────┐
                    │  Azure Front  │
                    │   Door / WAF  │
                    └───────┬───────┘
                            │
              ┌─────────────▼─────────────┐
              │      Public Subnet         │
              │   ┌─────────────────┐     │
              │   │  API Gateway    │     │
              │   └────────┬────────┘     │
              └────────────┬──────────────┘
                           │
              ┌────────────▼──────────────┐
              │    Private Subnet         │
              │   ┌─────────────────┐    │
              │   │  AI Services    │    │
              │   └────────┬────────┘    │
              └────────────┬──────────────┘
                           │
              ┌────────────▼──────────────┐
              │    Database Subnet        │
              │   ┌─────────────────┐    │
              │   │   Cosmos DB     │    │
              │   └─────────────────┘    │
              └───────────────────────────┘
```

**Security Layers:**
1. **WAF** - Web Application Firewall
2. **DDoS Protection** - Azure/AWS DDoS shield
3. **Network Segmentation** - VNet/VPC subnets
4. **Private Endpoints** - No public database access
5. **NSG/Security Groups** - Firewall rules

---

### Authentication & Authorization

**SSO Integration (SAML 2.0):**
```
┌──────────┐       ┌──────────┐       ┌──────────┐
│  User    │──────▶│  Azure   │──────▶│   AI     │
│          │  1.Auth│   AD     │ 3.Token│ Service  │
└──────────┘       └──────────┘       └──────────┘
     ▲  2. SAML Response
     │
```

**Role-Based Access Control (RBAC):**
- **Public** - General queries
- **Staff** - Internal use, case access
- **Manager** - Team data, reports
- **Admin** - Configuration, user management
- **Data Steward** - Data access, exports

---

### Data Encryption

**At Rest:**
- AES-256 encryption
- Managed keys (Azure Key Vault, AWS KMS)
- Database encryption (TDE)

**In Transit:**
- TLS 1.2+ for all connections
- Certificate pinning
- VPN/PSN for on-premise connectivity

**Key Management:**
```
┌─────────────────────────────────────┐
│         Azure Key Vault             │
│  ┌─────────────┐  ┌──────────────┐ │
│  │   Keys      │  │   Secrets    │ │
│  │   (AES-256) │  │   (API Keys) │ │
│  └─────────────┘  └──────────────┘ │
└─────────────────────────────────────┘
           │
    ┌──────▼──────┐
    │ AI Services │
    │   (RBAC)    │
    └─────────────┘
```

---

## 📊 Data Architecture

### Data Flow

```
Source Systems          Data Lake            AI Processing
┌──────────┐         ┌──────────┐         ┌──────────┐
│ Civica   │────────▶│  Bronze  │────────▶│  Model   │
│  CRM     │         │  (Raw)   │         │ Training │
└──────────┘         └──────────┘         └──────────┘
                           │                     │
┌──────────┐         ┌─────▼────┐         ┌─────▼────┐
│   NEC    │────────▶│  Silver  │────────▶│  Predict │
│   HMS    │         │(Cleansed)│         │          │
└──────────┘         └──────────┘         └──────────┘
                           │                     │
┌──────────┐         ┌─────▼────┐         ┌─────▼────┐
│ iTrent   │────────▶│  Gold    │────────▶│  Serve   │
│   HR     │         │(Analytics)         │(API/UI)  │
└──────────┘         └──────────┘         └──────────┘
```

---

### Data Retention

| Data Type | Retention Period | Storage Tier |
|-----------|-----------------|--------------|
| Raw logs | 90 days | Hot storage |
| Conversations | 12 months | Cool storage |
| Analytics | 7 years | Archive |
| Models | Lifecycle | Hot storage |
| Backups | 7 years | Archive |

---

## 🔍 Monitoring & Observability

### Monitoring Stack

```
┌─────────────────────────────────────────────────────────┐
│              Application Insights / CloudWatch          │
│  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐        │
│  │ Metrics│  │  Logs  │  │ Traces │  │ Alerts │        │
│  └────────┘  └────────┘  └────────┘  └────────┘        │
└───────┬──────────────────────────────────────┬──────────┘
        │                                      │
   ┌────▼────┐                            ┌───▼─────┐
   │  Power  │                            │  Teams/ │
   │   BI    │                            │  Email  │
   └─────────┘                            └─────────┘
```

**Key Metrics:**
- Request latency (p50, p95, p99)
- Error rates
- AI model confidence scores
- Integration success rates
- User satisfaction scores
- Cost per transaction

**Alerting:**
- Error rate > 5%
- Latency > 2 seconds (p95)
- Integration failure
- Security events
- Budget threshold

---

## 🚀 Scalability

### Auto-Scaling Configuration

**Azure App Service:**
```json
{
  "autoscale": {
    "rules": [
      {
        "metricTrigger": {
          "metricName": "CpuPercentage",
          "threshold": 70,
          "direction": "Increase"
        },
        "scaleAction": {
          "direction": "Increase",
          "value": "1",
          "cooldown": "PT5M"
        }
      }
    ],
    "minimum": 2,
    "maximum": 10
  }
}
```

---

## 📚 Technology Stack

### Recommended Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| Web UI | React, Vue.js | User interface |
| Mobile | React Native | Mobile apps |
| API | ASP.NET Core, Node.js | Backend services |
| AI | Azure OpenAI, Azure AI | Language understanding |
| Database | Cosmos DB, PostgreSQL | Data storage |
| Cache | Redis | Performance |
| Queue | Service Bus, RabbitMQ | Async processing |
| Monitoring | App Insights, CloudWatch | Observability |

---

For deployment instructions, see [Deployment Guide](deployment.md).

For security details, see [Security & Compliance](security-compliance.md).
