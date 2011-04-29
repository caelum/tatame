#!/bin/bash

source ~/.profile
source ~/.bashrc
source ~/.rvm/scripts/rvm

rvm --create 1.8.7-p302@tatame
rvm gemset import tatame.gems
cp ./config/database.yml.example ./config/database.yml
rake db:create RAILS_ENV=test

rake spec features RAILS_ENV=test
