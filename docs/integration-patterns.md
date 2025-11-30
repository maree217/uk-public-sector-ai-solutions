# Integration Patterns

Common integration patterns for UK Public Sector AI solutions with existing systems.

## 🔌 Integration Methods

### 1. REST API Integration
Most modern systems support RESTful APIs. This is the recommended approach for most integrations.

**Supported Systems:**
- Civica Cx (CRM, Housing)
- NEC Housing
- MRI Software
- Salesforce
- Microsoft Dynamics

**Example:**
```javascript
// Retrieve tenant information
GET https://api.civica.example.com/tenants/{tenantId}
Authorization: Bearer {token}

// Response
{
  "tenantId": "12345",
  "name": "John Smith",
  "property": "123 Main Street",
  "rentAccount": {...}
}
```

### 2. SOAP Integration
Legacy enterprise systems often use SOAP web services.

**Supported Systems:**
- Older NEC systems
- Some Northgate systems
- Legacy Capita systems

### 3. Event-Driven Integration
Real-time event processing for immediate action.

**Use Cases:**
- Repairs reported → AI triage
- Arrears threshold → early intervention
- Safeguarding alert → immediate escalation

### 4. File-Based Integration
Batch processing for bulk data exchange.

**Use Cases:**
- Nightly data extracts
- Monthly reporting
- Bulk imports

## 🔐 Authentication Methods

### OAuth 2.0
Modern API authentication standard.

**Supported by:**
- Salesforce
- Microsoft 365
- Modern Civica APIs

### API Keys
Simple authentication for internal systems.

### Active Directory / LDAP
Enterprise authentication.

### SAML 2.0
SSO for web applications.

## 📊 Common Integrations by System

### Civica Systems
- **Civica Cx** - REST API, OAuth 2.0
- **Icon Revenues** - SOAP, API key
- **Planning** - REST API
- **Financials** - SOAP/REST

### NEC Systems
- **NEC Housing** - REST API, SOAP
- **NEC Revenues** - SOAP
- **Planning (NEC)** - REST API

### Microsoft Systems
- **Dynamics 365** - Web API, OAuth
- **SharePoint** - Graph API, OAuth
- **Teams** - Graph API, Webhooks
- **Power BI** - REST API, OAuth

### HR Systems
- **iTrent** - REST API, SOAP
- **ResourceLink** - REST API
- **People HR** - REST API

---

For detailed architecture, see [Architecture Guide](architecture.md).
