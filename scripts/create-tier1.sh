#!/bin/bash
# create-tier1.sh
# Creates all Tier 1 solutions (Quick Wins)

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Creating Tier 1 Solutions (Quick Wins)${NC}"
echo "This will create 3 repositories focused on HR and Project Management"
echo ""

# Solution 1: Grant Writer AI
echo "1/3: Grant Application Assistant"
./scripts/create-solution.sh \
  grant-writer-ai \
  "Grant Application Assistant" \
  "AI assistant for UK charities and nonprofits writing funding applications. Integrates with Salesforce NPSP, Xero, and major UK grant databases." \
  "third-sector,grant-writing,fundraising,charities"

sleep 2

# Solution 2: HR Advisor AI
echo ""
echo "2/3: HR Policy Assistant"
./scripts/create-solution.sh \
  hr-advisor-ai \
  "HR Policy Assistant" \
  "AI-powered HR assistant for UK public sector organisations. Integrates with iTrent, ResourceLink, People HR. Answers policy queries 24/7." \
  "human-resources,hr-tech,policy-management,employee-support"

sleep 2

# Solution 3: Project Intelligence AI
echo ""
echo "3/3: Project Intelligence Assistant"
./scripts/create-solution.sh \
  project-intelligence-ai \
  "Project Intelligence Assistant" \
  "AI project management assistant for UK public sector. Integrates with MS Project, Jira, Smartsheet. Provides real-time insights and risk analysis." \
  "project-management,prince2,agile,pm-tools"

echo ""
echo -e "${GREEN}✅ Tier 1 Complete!${NC}"
echo ""
echo "Created 3 repositories:"
echo "  • https://github.com/maree217/grant-writer-ai"
echo "  • https://github.com/maree217/hr-advisor-ai"
echo "  • https://github.com/maree217/project-intelligence-ai"
echo ""
echo "Next steps:"
echo "  1. Customize each README with detailed content (4-5 hours each)"
echo "  2. Add architecture diagrams"
echo "  3. Create case studies"
echo "  4. Share on LinkedIn"
echo ""
echo "Run ./scripts/create-tier2.sh when ready for next batch"
