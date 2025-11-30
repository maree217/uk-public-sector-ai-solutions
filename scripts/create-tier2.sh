#!/bin/bash
# create-tier2.sh
# Creates all Tier 2 solutions (High Impact)

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Creating Tier 2 Solutions (High Impact)${NC}"
echo "This will create 9 cross-sector high-value repositories"
echo ""

# Solution 1
echo "1/9: Recruitment Screening Engine"
./scripts/create-solution.sh \
  recruitment-screening-ai \
  "Recruitment Screening Engine" \
  "AI-powered CV and application screening for UK public sector recruitment. Integrates with Tribepad, Jobtrain, Networx ATS systems." \
  "human-resources,recruitment,ats,hiring"

sleep 2

# Solution 2
echo ""
echo "2/9: Tenant Portal Intelligence"
./scripts/create-solution.sh \
  tenant-portal-ai \
  "Tenant Portal Intelligence" \
  "Conversational AI for housing tenant portals. Handles repairs, rent queries, ASB reporting. Integrates with Civica Cx, NEC, MRI housing systems." \
  "housing-association,tenant-services,repairs,rent"

sleep 2

# Solution 3
echo ""
echo "3/9: Resident Feedback Analyzer"
./scripts/create-solution.sh \
  resident-feedback-ai \
  "Resident Feedback Analyzer" \
  "AI analysis of citizen and tenant feedback. Categorizes complaints, identifies trends. Integrates with survey tools and CRM systems." \
  "local-government,housing-association,feedback-analysis,sentiment"

sleep 2

# Solution 4
echo ""
echo "4/9: Programme Risk Monitor"
./scripts/create-solution.sh \
  programme-risk-ai \
  "Programme Risk Monitor" \
  "AI-powered programme and project risk monitoring. Continuous risk identification across multiple sources. Integrates with 4Risk, Pentana." \
  "project-management,risk-management,programme-delivery"

sleep 2

# Solution 5
echo ""
echo "5/9: Contact Centre AI Platform"
./scripts/create-solution.sh \
  contact-centre-ai \
  "Contact Centre AI Platform" \
  "Full AI-powered contact centre solution for UK public sector. Handles calls, webchat, email. Integrates with Avaya, Mitel, 8x8, Teams." \
  "contact-centre,customer-service,telephony,omnichannel"

sleep 2

# Solution 6
echo ""
echo "6/9: Repairs Scheduling Optimiser"
./scripts/create-solution.sh \
  repairs-scheduler-ai \
  "Repairs Scheduling Optimiser" \
  "AI optimization of housing repairs scheduling. Reduces travel time, improves completion rates. Integrates with Oneserve, Totalmobile, DRS." \
  "housing-association,repairs,scheduling,optimization"

sleep 2

# Solution 7
echo ""
echo "7/9: Resident 360 View"
./scripts/create-solution.sh \
  resident-360-ai \
  "Resident 360 View" \
  "Unified 360-degree view of residents/tenants across all systems. Complete interaction history. Integrates with CRM, HMS, service systems." \
  "local-government,housing-association,customer-data,360-view"

sleep 2

# Solution 8
echo ""
echo "8/9: Meeting Intelligence Suite"
./scripts/create-solution.sh \
  meeting-intelligence-ai \
  "Meeting Intelligence Suite" \
  "AI meeting transcription and analysis. Extracts actions, decisions, risks. Integrates with Teams, Zoom, Google Meet." \
  "project-management,meetings,transcription,collaboration"

sleep 2

# Solution 9
echo ""
echo "9/9: Planning Application Analyser"
./scripts/create-solution.sh \
  planning-analyser-ai \
  "Planning Application Analyser" \
  "AI analysis of planning applications. Extracts key information, checks policies, generates reports. Integrates with Idox, NEC Assure, Arcus." \
  "local-government,planning,development-control,applications"

echo ""
echo -e "${GREEN}✅ Tier 2 Complete!${NC}"
echo ""
echo "Created 9 repositories. Total so far: 14 (31%)"
echo ""
echo "Run ./scripts/create-tier3.sh when ready for next batch"
