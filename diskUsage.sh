#!/bin/bash
#
# diskUsage.sh
#	how to determine disk usage by folder,
#	sort the data, and save to a file
#
# **************
# * escollapse *
# * CISSP, PT+ *
# *  20191021  *
# **************
#
ls | xargs du -sh | sort -rh | tee diskusage.txt

