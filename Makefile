# ===============================================================
# Anne Huntington Laboratory - Corporate Website
# ===============================================================
# File: Makefile
# Purpose: Development and deployment automation for AHL website
#
# Description: Build automation for the Anne Huntington Laboratory
# corporate website providing development environment management,
# Docker orchestration, and standardized operational commands following
# AHL infrastructure patterns.
#
# Architecture: GNU Make automation pattern (Operations Layer)
#   - Target definitions: Development (dev), production (up)
#   - Environment management: Docker Compose orchestration with AHL port standards
#   - Health monitoring: Service status checking and log aggregation
#
# Uses:
#   - External: Docker, Make, Node.js, npm
#   - Internal: Docker files, environment configuration, port allocation
#   - Cross-project: AHL infrastructure conventions

.PHONY: help dev up down clean logs install status health test docker-build frontend-dev

.DEFAULT_GOAL := help

# === Environment Configuration ===
PROJECT_NAME := annehuntingtonlaboratory
FRONTEND_DIR := frontend
FRONTEND_PORT := 3021

# Color definitions for output formatting
GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
RED := \033[0;31m
NC := \033[0m

# === Help ===
define PRINT_HELP_PYSCRIPT
import re, sys
for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:  ## Show this help menu
	@echo "$(GREEN)Anne Huntington Laboratory - Corporate Website$(NC)"
	@echo "$(BLUE)====================================================$(NC)"
	@python3 -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)
	@echo ""

# === Development Targets ===
install:  ## Install Node.js dependencies
	@echo "$(BLUE)Installing $(PROJECT_NAME) dependencies...$(NC)"
	@cd $(FRONTEND_DIR) && npm install
	@echo "$(GREEN)Dependencies installed successfully$(NC)"

dev:  ## Start development server
	@echo "$(GREEN)Starting $(PROJECT_NAME) development server...$(NC)"
	@cd $(FRONTEND_DIR) && npm run dev
	@echo "$(GREEN)Development server ready at http://localhost:$(FRONTEND_PORT)$(NC)"

frontend-dev:  ## Start frontend development server (alias)
	@$(MAKE) dev

# === Docker Targets ===
docker-build:  ## Build Docker image
	@echo "$(BLUE)Building Docker image for $(PROJECT_NAME)...$(NC)"
	@cd $(FRONTEND_DIR) && docker build -t $(PROJECT_NAME):latest .
	@echo "$(GREEN)Docker image built successfully$(NC)"

up:  ## Start production server with Docker
	@echo "$(GREEN)Starting $(PROJECT_NAME) production server...$(NC)"
	@cd $(FRONTEND_DIR) && docker run -d -p $(FRONTEND_PORT):$(FRONTEND_PORT) --name $(PROJECT_NAME) $(PROJECT_NAME):latest
	@$(MAKE) status
	@echo "$(GREEN)Production server ready at http://localhost:$(FRONTEND_PORT)$(NC)"

down:  ## Stop Docker container
	@echo "$(YELLOW)Stopping $(PROJECT_NAME) container...$(NC)"
	@docker stop $(PROJECT_NAME) 2>/dev/null || true
	@docker rm $(PROJECT_NAME) 2>/dev/null || true
	@echo "$(GREEN)Container stopped$(NC)"

clean:  ## Clean up containers and dependencies
	@echo "$(RED)Cleaning up $(PROJECT_NAME)...$(NC)"
	@$(MAKE) down
	@cd $(FRONTEND_DIR) && rm -rf node_modules package-lock.json
	@docker rmi $(PROJECT_NAME):latest 2>/dev/null || true
	@echo "$(GREEN)Cleanup complete$(NC)"

# === Monitoring Targets ===
status:  ## Show service status
	@echo "$(BLUE)$(PROJECT_NAME) Service Status:$(NC)"
	@docker ps | grep $(PROJECT_NAME) || echo "$(YELLOW)Container not running$(NC)"

health:  ## Check service health
	@echo "$(BLUE)Checking service health...$(NC)"
	@curl -sf http://localhost:$(FRONTEND_PORT)/health && echo "$(GREEN)✓ Service healthy$(NC)" || echo "$(RED)✗ Service down$(NC)"

logs:  ## Show Docker container logs
	@echo "$(BLUE)Showing logs for $(PROJECT_NAME):$(NC)"
	@docker logs -f $(PROJECT_NAME) 2>/dev/null || echo "$(YELLOW)No container running$(NC)"

# === Testing Targets ===
test:  ## Run tests (placeholder)
	@echo "$(BLUE)Running tests for $(PROJECT_NAME)...$(NC)"
	@cd $(FRONTEND_DIR) && npm test
	@echo "$(GREEN)Tests complete$(NC)"

# === Utility Targets ===
restart:  ## Restart the service
	@$(MAKE) down
	@$(MAKE) up

ps:  ## Show running containers
	@docker ps --filter "name=$(PROJECT_NAME)"
