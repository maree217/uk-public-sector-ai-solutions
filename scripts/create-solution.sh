#!/bin/bash
# create-solution.sh
# Creates a new solution repository from template

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check arguments
if [ "$#" -lt 3 ]; then
    echo -e "${RED}Usage: ./create-solution.sh <repo-name> <display-name> <description> [topics]${NC}"
    echo ""
    echo "Example:"
    echo "  ./create-solution.sh grant-writer-ai \"Grant Application Assistant\" \"AI assistant for charity grant applications\" \"third-sector,grant-writing\""
    exit 1
fi

REPO_NAME=$1
DISPLAY_NAME=$2
DESCRIPTION=$3
EXTRA_TOPICS=${4:-""}

echo -e "${YELLOW}Creating solution: $DISPLAY_NAME${NC}"
echo "Repository name: $REPO_NAME"
echo ""

# Check if directory already exists
if [ -d "$REPO_NAME" ]; then
    echo -e "${RED}Error: Directory $REPO_NAME already exists${NC}"
    exit 1
fi

# Create directory
echo "📁 Creating directory structure..."
mkdir -p "$REPO_NAME"
cd "$REPO_NAME"

# Copy template files
echo "📄 Copying template files..."
cp ../SOLUTION-TEMPLATE.md README.md
cp ../citizen-service-assistant/.gitignore .
cp ../citizen-service-assistant/LICENSE .

# Create directory structure
echo "📂 Creating subdirectories..."
mkdir -p docs/{architecture,integration,deployment,security}
mkdir -p terraform/{azure-uk,aws-london,on-premise}
mkdir -p src/{api,models,config,utils}
mkdir -p examples/{azure,aws,hybrid,on-premise}
mkdir -p tests/{unit,integration,e2e}

# Create placeholder files
cat > docs/architecture.md << 'EOF'
# Architecture

## Overview

[Architecture description]

## Components

### Frontend

### Backend

### AI/ML

### Data Store

## Integration Points

[Integration architecture]
EOF

cat > docs/integration.md << 'EOF'
# Integration Guide

## Supported Systems

[List of integrated systems]

## API Requirements

[API specifications]

## Configuration

[Integration configuration]
EOF

cat > docs/deployment.md << 'EOF'
# Deployment Guide

## Prerequisites

[Prerequisites list]

## Azure UK Deployment

[Azure deployment steps]

## AWS London Deployment

[AWS deployment steps]

## On-Premise Deployment

[On-premise deployment steps]
EOF

# Replace template placeholders in README
echo "✏️  Customizing README..."
sed -i '' "s/\[Solution Name\]/$DISPLAY_NAME/g" README.md

# Git setup
echo "🔧 Initializing git repository..."
git init -q
git add .
git commit -q -m "Initial commit: $DISPLAY_NAME - $DESCRIPTION"

# Create GitHub repo
echo "🚀 Creating GitHub repository..."
gh repo create "$REPO_NAME" --public --source=. \
  --description="$DESCRIPTION" --push

# Add topics
echo "🏷️  Adding topics..."
TOPIC_CMD="gh repo edit maree217/$REPO_NAME --add-topic uk-public-sector --add-topic production-ready"

if [ ! -z "$EXTRA_TOPICS" ]; then
    IFS=',' read -ra TOPIC_ARRAY <<< "$EXTRA_TOPICS"
    for topic in "${TOPIC_ARRAY[@]}"; do
        TOPIC_CMD="$TOPIC_CMD --add-topic $(echo $topic | xargs)"
    done
fi

eval $TOPIC_CMD

echo ""
echo -e "${GREEN}✅ Successfully created: https://github.com/maree217/$REPO_NAME${NC}"
echo ""
echo "Next steps:"
echo "  1. cd $REPO_NAME"
echo "  2. Edit README.md with solution-specific content"
echo "  3. Add architecture diagrams to docs/"
echo "  4. Create example configurations in examples/"
echo ""

cd ..
