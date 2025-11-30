#!/bin/bash
# create-tier3.sh
# Creates all Tier 3 solutions (Specialized - 16 repos)

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${YELLOW}Creating Tier 3 Solutions (Specialized)${NC}"
echo "This will create 16 sector-specific repositories"
echo ""

# LOCAL GOVERNMENT SOLUTIONS (6)
echo -e "${BLUE}=== LOCAL GOVERNMENT SOLUTIONS ===${NC}"
echo ""

echo "1/16: Benefits Navigator"
./scripts/create-solution.sh \
  benefits-navigator \
  "Benefits & Entitlements Navigator" \
  "SMS and web chatbot for benefits applications and eligibility. Integrates with Civica, NEC, Capita benefits systems and DWP APIs." \
  "local-government,benefits,welfare,universal-credit"

sleep 2

echo ""
echo "2/16: FOI Manager"
./scripts/create-solution.sh \
  foi-manager-ai \
  "FOI & Transparency Manager" \
  "AI management of Freedom of Information requests. Searches systems, drafts responses, tracks deadlines. Integrates with iCasework." \
  "local-government,foi,transparency,compliance"

sleep 2

echo ""
echo "3/16: Council Tax Collection AI"
./scripts/create-solution.sh \
  council-tax-ai \
  "Council Tax Collection Intelligence" \
  "AI to improve council tax collection and identify support needs. Predictive arrears detection. Integrates with Civica, NEC revenues." \
  "local-government,revenues,council-tax,collection"

sleep 2

echo ""
echo "4/16: Social Care Case AI"
./scripts/create-solution.sh \
  social-care-case-ai \
  "Social Services Case AI" \
  "AI assistant for social workers managing cases. Case summaries, risk flags, handovers. Integrates with social care management systems." \
  "local-government,social-care,case-management,safeguarding"

sleep 2

echo ""
echo "5/16: Waste Collection Assistant"
./scripts/create-solution.sh \
  waste-collection-ai \
  "Waste Collection Assistant" \
  "AI assistant for waste and recycling queries. Collection schedules, missed bins, bulky waste. Integrates with Bartec, Whitespace." \
  "local-government,waste-management,recycling,environmental-services"

sleep 2

echo ""
echo "6/16: Parking Services AI"
./scripts/create-solution.sh \
  parking-services-ai \
  "Parking Services AI" \
  "AI for parking permit applications, PCN appeals, and enforcement queries. Integrates with parking management systems." \
  "local-government,parking,permits,enforcement"

sleep 2

# HOUSING ASSOCIATION SOLUTIONS (5)
echo ""
echo -e "${BLUE}=== HOUSING ASSOCIATION SOLUTIONS ===${NC}"
echo ""

echo "7/16: Arrears Predictor"
./scripts/create-solution.sh \
  arrears-predictor-ai \
  "Rent Arrears Predictor" \
  "Predictive AI for identifying tenants at risk of rent arrears. Early intervention triggers. Integrates with housing management rent accounts." \
  "housing-association,rent,arrears,income-management"

sleep 2

echo ""
echo "8/16: Compliance Tracker"
./scripts/create-solution.sh \
  compliance-tracker-ai \
  "Property Compliance Tracker" \
  "AI tracking of statutory compliance - gas, electrical, fire, legionella, asbestos. Renewal scheduling and reporting. Integrates with HMS." \
  "housing-association,compliance,health-safety,gas-safety"

sleep 2

echo ""
echo "9/16: Disrepair Claims Analyser"
./scripts/create-solution.sh \
  disrepair-claims-ai \
  "Housing Disrepair Claims Analyser" \
  "AI analysis and response to disrepair claims. Assesses claims against records, generates defence. Integrates with HMS and legal systems." \
  "housing-association,disrepair,legal,claims-management"

sleep 2

echo ""
echo "10/16: Void Turnaround Manager"
./scripts/create-solution.sh \
  void-turnaround-ai \
  "Void Property Turnaround Manager" \
  "AI optimization of void property workflow. Contractor scheduling, progress tracking, void loss reduction. Integrates with HMS and repairs." \
  "housing-association,voids,lettings,property-management"

sleep 2

echo ""
echo "11/16: ASB Case Manager"
./scripts/create-solution.sh \
  asb-case-manager-ai \
  "Anti-Social Behaviour Case Manager" \
  "AI for ASB case management. Pattern detection, risk assessment, evidence gathering. Integrates with ASB case management systems." \
  "housing-association,asb,case-management,tenancy-management"

sleep 2

# THIRD SECTOR SOLUTIONS (5)
echo ""
echo -e "${BLUE}=== THIRD SECTOR SOLUTIONS ===${NC}"
echo ""

echo "12/16: Donor Communications AI"
./scripts/create-solution.sh \
  donor-comms-ai \
  "Donor Communications Personalizer" \
  "AI-generated personalized donor communications. Thank you letters, impact updates, appeals. Integrates with Salesforce NPSP, Mailchimp." \
  "third-sector,fundraising,donor-relations,communications"

sleep 2

echo ""
echo "13/16: Impact Reporter"
./scripts/create-solution.sh \
  impact-reporter-ai \
  "Impact Measurement & Reporter" \
  "AI-powered impact reporting for charities. Aggregates outcomes, generates reports, tells impact stories. Integrates with Lamplight, Salesforce." \
  "third-sector,impact,outcomes,reporting"

sleep 2

echo ""
echo "14/16: Volunteer Management AI"
./scripts/create-solution.sh \
  volunteer-management-ai \
  "Volunteer Management AI" \
  "AI for volunteer recruitment, scheduling, and retention. Skills matching, communication, DBS tracking. Integrates with Assemble, Better Impact." \
  "third-sector,volunteers,workforce-management,recruitment"

sleep 2

echo ""
echo "15/16: Fundraising Appeal Generator"
./scripts/create-solution.sh \
  fundraising-appeal-ai \
  "Fundraising Appeal Generator" \
  "AI generation of fundraising appeal letters and campaigns. Personalized messaging based on donor history. Integrates with donor CRM systems." \
  "third-sector,fundraising,appeals,donor-engagement"

sleep 2

echo ""
echo "16/16: Beneficiary Support Chatbot"
./scripts/create-solution.sh \
  beneficiary-chatbot-ai \
  "Beneficiary Support Chatbot" \
  "AI chatbot for charity beneficiaries and service users. 24/7 support, service navigation, crisis signposting. Integrates with case management." \
  "third-sector,beneficiary-support,service-delivery,chatbot"

echo ""
echo -e "${GREEN}✅ Tier 3 Complete!${NC}"
echo ""
echo "Created 16 repositories. Total so far: 30 (67%)"
echo ""
echo "Breakdown:"
echo "  • Local Government: 6 solutions"
echo "  • Housing Associations: 5 solutions"
echo "  • Third Sector: 5 solutions"
echo ""
echo "Run ./scripts/create-tier4.sh when ready for final batch"
