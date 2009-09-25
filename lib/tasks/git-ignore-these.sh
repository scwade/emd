#!/bin/bash
# {RAILSROOT}git-ignore-these.sh 


#########################
# Programming hints to augment this list
#
# Append files with this command to fix new files
# find . -name \*log -print >> git-ignore-these.sh
# sed -i 's/.*/git rm --cached &/' git-ignore-these.sh
# Please ignore messages with " fatal: pathspec " -- these were not tracked

#Below are files that should be ignored

git rm --cached ./log/log.rb~
git rm --cached ./vendor/plugins/validates_date_time/test/debug.log
git rm -r --cached log  #ignores the director and all below it
