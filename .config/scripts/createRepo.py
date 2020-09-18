#!/bin/python3.8

import os
import sys
from github import Github

# Usage createRepo.py 'name-of-project'

projectName = sys.argv[1]

username = os.getenv('GITHUB_USER')
password = os.getenv('GITHUB_PASSWORD')
g = Github(username, password)
user = g.get_user()
repo = user.create_repo(projectName)

print(user.get_repo(projectName).full_name)
