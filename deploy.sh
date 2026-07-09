#!/bin/bash

# Portfolio Auto Deploy Script
# Usage: ./deploy.sh YOUR_GITHUB_USERNAME

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if username is provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide your GitHub username${NC}"
    echo "Usage: ./deploy.sh YOUR_GITHUB_USERNAME"
    exit 1
fi

USERNAME=$1
REPO_NAME="dhizt-portfolio"
REPO_URL="https://github.com/$USERNAME/$REPO_NAME.git"

echo -e "${GREEN}Starting deployment...${NC}"
echo -e "${YELLOW}Username: $USERNAME${NC}"
echo -e "${YELLOW}Repository: $REPO_NAME${NC}"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is not installed${NC}"
    exit 1
fi

# Check if files exist
if [ ! -f "index.html" ] || [ ! -f "404.html" ]; then
    echo -e "${RED}Error: index.html or 404.html not found${NC}"
    echo "Make sure you're in the portfolio directory"
    exit 1
fi

# Initialize git repository
echo -e "${YELLOW}Initializing git repository...${NC}"
git init
git checkout -b main

# Add files
echo -e "${YELLOW}Adding files...${NC}"
git add index.html 404.html DEPLOY.md

# Commit
echo -e "${YELLOW}Committing files...${NC}"
git commit -m "Initial portfolio commit"

# Add remote
echo -e "${YELLOW}Adding remote...${NC}"
git remote add origin $REPO_URL

# Push
echo -e "${YELLOW}Pushing to GitHub...${NC}"
git push -u origin main

echo ""
echo -e "${GREEN}✓ Files pushed to GitHub!${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Open https://github.com/$USERNAME/$REPO_NAME"
echo "2. Go to Settings → Pages"
echo "3. Set Source: Deploy from a branch"
echo "4. Set Branch: main, Folder: / (root)"
echo "5. Click Save"
echo ""
echo -e "${GREEN}Your portfolio will be live at:${NC}"
echo -e "${GREEN}https://$USERNAME.github.io/$REPO_NAME/${NC}"
echo ""
echo -e "${YELLOW}Note: It may take 1-2 minutes for GitHub Pages to build and deploy${NC}"
