# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Dockerized version of Kippo-Graph, a web application for visualizing statistics from Cowrie (formerly Kippo) SSH honeypot logs. The original Kippo-Graph requires PHP 7.4 and hasn't been updated in over 9 years, making containerization necessary for modern deployment.

## Architecture

- **Target Stack**: nginx + PHP 7.4 + Kippo-Graph web application
- **Database**: External MySQL database containing Cowrie honeypot data
- **Configuration**: Requires `config.php` file (copy from `config.php.dist`) with database credentials

## Database Connection Details

The application connects to an external MySQL database containing Cowrie honeypot data. Database credentials should be configured via environment variables or the config.php file.

## Development Tasks

Based on the README.md, the primary development task is to create a `docker-compose.yml` file that:
1. Sets up nginx (latest version)
2. Configures PHP 7.4 environment
3. Includes Kippo-Graph application
4. Connects to the external MySQL database

## Repository Status

This is a minimal repository containing only the README.md file. No source code, Docker files, or configuration files exist yet - they need to be created as part of the implementation.