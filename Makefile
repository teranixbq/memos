# Root Makefile for the memos repository.
# Use this to run the backend and frontend as separate development servicesd.

.PHONY: help backend backend-build frontend-install frontend frontend-build frontend-release publish

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@echo "  backend            Run backend dev server on localhost:8081"
	@echo "  backend-build      Build backend binary to build/memos"
	@echo "  frontend-install   Install frontend dependencies in web/"
	@echo "  frontend           Run frontend dev server on localhost:3001"
	@echo "  frontend-build     Build frontend static assets using Vite"
	@echo "  frontend-release   Build frontend for production output to server/router/frontend/dist"
	@echo "  publish            Build frontend for production and then build backend binary"

backend:
	go run ./cmd/memos --port 8081

backend-build:
	go build -o build/memos ./cmd/memos

frontend-install:
	cd web && pnpm install

frontend:
	cd web && pnpm dev

frontend-build:
	cd web && pnpm build

frontend-release:
	cd web && pnpm release

publish:
	cd web && pnpm install && pnpm release
	go build -o build/memos ./cmd/memos


