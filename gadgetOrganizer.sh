#!/bin/bash
#
# gadgetOrganizer.sh
#     leveraging ROPgadget, sort gadgets
#     by address; mindful of the stack
# 
# REQUIREMENTS:
#     -capstone
#         sudo pip install capstone
#         http://www.capstone-engine.org/
#     -ropgadget
#         sudo pip install ropgadget
#         https://github.com/JonathanSalwan/ROPgadget
#
# **************
# * escollapse *
# * CISSP, PT+ *
# *  20200109  *
# **************
if [[ $1 ]]; then
    ROPgadget --binary $1 | tail -$(expr $(ROPgadget --binary $1 | wc -l) - 2) | head -n -2 | sort | grep -v leave | grep -v 'pop ebp'
else
    echo "Usage: $0 </path/to/binary>"
fi
