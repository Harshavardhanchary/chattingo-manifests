#!/bin/bash

# --------------------------
# Script: update-all-yaml.sh
# Purpose: Update image tags in backend, frontend, and database deploy.yaml files
# Usage: ./update-all-yaml.sh <build-number>
# --------------------------

BUILD_NUMBER=${BUILD_NUMBER:-$1}

if [ -z "$BUILD_NUMBER" ]; then
  echo "❌ Error: No build number provided."
  echo "Usage: $0 <build-number> or export BUILD_NUMBER"
  exit 1
fi

# --- Backend ---
BACKEND_FILE="k8s/backend/deploy.yaml"
BACKEND_IMAGE="harshavardhan303/chattingo-backend"
sed -i "s|image: ${BACKEND_IMAGE}:.*|image: ${BACKEND_IMAGE}:${BUILD_NUMBER}|" "$BACKEND_FILE"
echo "✅ Updated backend image tag to :${BUILD_NUMBER}"

# --- Frontend ---
FRONTEND_FILE="k8s/frontend/deploy.yaml"
FRONTEND_IMAGE="harshavardhan303/chattingo-frontend"
sed -i "s|image: ${FRONTEND_IMAGE}:.*|image: ${FRONTEND_IMAGE}:${BUILD_NUMBER}|" "$FRONTEND_FILE"
echo "✅ Updated frontend image tag to :${BUILD_NUMBER}"
