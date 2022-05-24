#!/bin/sh
#echo "what is your name?"
#read name
#echo "How do you do, $name?"
#read remark
#echo "I am $remark too!"
#github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/'`;
#branch_name=`git symbolic-ref HEAD | cut -d"/" -f 3,4`;
#pr_url=$github_url"/compare/main..."$branch_name
#chrome $pr_url;
echo -e "\033[0;32m* * * * * * * * * * * * * * * * * *\033[0m\n"
echo    "Boas-vindas ao script de "
echo -e "abertura de Pull Request"
echo -e "para projetos \n"
echo -e "\033[0;32m* * * * * * * * * * * * * * * * * *\033[0m\n"

if [[ $GITHUB_TOKEN == "" ]] ; then
 echo "existe"
else
 echo "nao existe"
fi
