# What This Is

A Dockerized version of Kippo-Graph

# Quick Start (assuming local environment)

1. Clone this repository `git clone https://github.com/mchow01/kippo-graph-docker`
2. Make a copy of `config.php.dist` found in `https://github.com/ikoniaris/kippo-graph/blob/master/config.php.dist` as `config.php` into the `kippo-graph-docker` folder.  Fill in MySQL server configuration information.
3. `cd kippo-graph-docker`
4. Run `docker-compose up -d` or `docker compose up -d`
5. Go to `http://localhost:8080` on a web browser

# Overview

Kippo-Graph is a full featured script to visualize statistics for a Cowrie (formerly Kippo) based SSH honeypot.  Kippo-Graph repository is available at https://github.com/ikoniaris/kippo-graph.  As a web application, it works great.

# The Problem

Kippo-Graph hasn't been updated for over 9 years.  It requires PHP version 7, not 8.  The current version of PHP is 8, and Kippo-Graph cannot be run on PHP version 8.  Instructions to use and install PHP 7.4 is available at https://www.digitalocean.com/community/tutorials/how-to-install-php-7-4-and-set-up-a-local-development-environment-on-ubuntu-20-04.  This leads to another problem: installing PHP 7.4 and Nginx all separately.  It is much cleaner to launch on Docker container containing the web app.

# Requirements

* nginx (latest version is good)
* PHP 7.4
* kippo-graph

# Instructions

Create a `docker-compose.yml` file that spins up a dockerized version of Kippo-Graph.  MySQL database access to Cowrie honeypot is available, needed for `config.php` file for Kippo-Graph (make a copy of `config.php.dist`).