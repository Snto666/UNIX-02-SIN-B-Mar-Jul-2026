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
# ------------------------------------------------------------------------------
# Block c: Environment Variables
# ------------------------------------------------------------------------------
# ENV sets global environment variables that affect how programs execute within 
# the shell (env vars — BHB Ch.1).
# DEBIAN_FRONTEND=noninteractive: Forces silent operation for APT, preventing 
# installation prompts from stalling the build.
# LANG & LC_ALL: Set the locale to es_ES.UTF-8, ensuring correct handling of 
# character encoding in data streams.
# TERM=xterm-256color: Informs the terminal that it supports 256 colors for 
# improved CLI tool visualization.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color
# ------------------------------------------------------------------------------
# Block d: Pre-answering Interactive Prompts
# ------------------------------------------------------------------------------
# We use the pipe (|) to direct the output of echo into debconf-set-selections 
# (redirection and pipes — BHB Ch.1). This pre-configures Wireshark to 'false' 
# for non-root packet capturing, preventing the build from pausing for manual 
# interaction.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections
# ------------------------------------------------------------------------------
# Block e: Package Installation
# ------------------------------------------------------------------------------
# Update vs Install: 'apt-get update' syncs the package index, while 'install' 
# fetches binaries. We chain them with '&&', ensuring installation only runs 
# if the update succeeds (control operators — BHB Ch.1).
# Using a single RUN block minimizes layers (Docker / containers — BHB Ch.3).
# Tools like gawk, sed, and grep (text processing — BHB Ch.2), along with 
# nmap/tshark/tor are critical for our lab operations.
RUN apt-get update && apt-get install -y --no-install-recommends \
    neovim vim zsh bash-completion \
    perl make gawk sed grep \
    coreutils findutils procps less tree jq \
    man-db manpages manpages-posix \
    curl wget git git-lfs ca-certificates locales \
    shellcheck \
    nmap masscan \
    tcpdump tshark \
    netcat-traditional socat dnsutils whois traceroute mtr-tiny iproute2 net-tools iputils-ping \
    tor torsocks proxychains4 obfs4proxy \
    httpie