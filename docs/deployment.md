# Deployment Guide

Step-by-step guide to deploying AI solutions to production.

## 🚀 Quick Start

### Azure Deployment

```bash
# Login to Azure
az login

# Create resource group
az group create --name rg-ai-solution --location uksouth

# Deploy using ARM template
az deployment group create \
  --resource-group rg-ai-solution \
  --template-file azuredeploy.json \
  --parameters @parameters.json
```

### AWS Deployment

```bash
# Configure AWS CLI
aws configure

# Deploy using CloudFormation
aws cloudformation create-stack \
  --stack-name ai-solution \
  --template-body file://template.yaml \
  --parameters file://parameters.json \
  --region eu-west-2
```

## 📦 Deployment Checklist

- [ ] Infrastructure provisioned
- [ ] SSL certificates configured
- [ ] DNS records updated
- [ ] Environment variables set
- [ ] API connections tested
- [ ] Authentication configured
- [ ] Monitoring enabled
- [ ] Backups configured
- [ ] Security review completed
- [ ] User acceptance testing passed

## 🔧 Configuration

### Environment Variables

```bash
# Azure App Service
AI_SERVICE_ENDPOINT=https://ai.azure.com
AI_SERVICE_KEY=<your-key>
DB_CONNECTION_STRING=<cosmos-db-connection>
AUTH_DOMAIN=<your-org>.onmicrosoft.com
```

### Integration Configuration

```json
{
  "integrations": {
    "civica": {
      "baseUrl": "https://api.civica.example.com",
      "apiKey": "${CIVICA_API_KEY}",
      "timeout": 30000
    },
    "nec": {
      "baseUrl": "https://nec.example.com/api",
      "authType": "oauth2",
      "clientId": "${NEC_CLIENT_ID}"
    }
  }
}
```

## 📊 Post-Deployment

### Verification
1. Check service health endpoints
2. Test authentication flow
3. Validate integrations
4. Run smoke tests
5. Review logs

### Monitoring Setup
- Configure Application Insights / CloudWatch
- Set up alert rules
- Create dashboards
- Enable log aggregation

---

For full architecture details, see [Architecture Guide](architecture.md).
