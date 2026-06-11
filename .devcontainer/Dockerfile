#!/bin/bash
# ==============================================================================
# Course Devcontainer Dockerfile Specification-Documenting the Course Dockerfile
# Branch: dev2
# Description: Automated deployment instructions for the Kali Linux lab environment.
# ==============================================================================
# ------------------------------------------------------------------------------
# Block a: Base Image Declaration
# ------------------------------------------------------------------------------
# FROM defines the starting point of our image. We use 'kalilinux/kali-rolling' 
# because it provides a pre-configured environment for penetration testing, 
# ensuring all essential security tools are available in a single, stable base 
# (Setting up the lab / Kali — BHB Ch.3).
FROM kalilinux/kali-rolling:latest
# ------------------------------------------------------------------------------
# Block b: Layering and Caching Mechanics
# ------------------------------------------------------------------------------
# Docker images are built in layers; every instruction creates a new, immutable 
# filesystem layer. Docker utilizes a cache to skip unchanged layers during 
# subsequent builds. Instruction order is critical because changing a high-level 
# instruction invalidates the cache for all subsequent layers, requiring a full 
# rebuild (Docker / containers — BHB Ch.3).