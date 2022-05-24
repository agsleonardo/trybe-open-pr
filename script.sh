#!/bin/sh
echo "what is your name?"
read name
echo "How do you do, $name?"
read remark
echo "I am $remark too!"
github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/'`;
branch_name=`git symbolic-ref HEAD | cut -d"/" -f 3,4`;
pr_url=$github_url"/compare/main..."$branch_name
chrome $pr_url;
