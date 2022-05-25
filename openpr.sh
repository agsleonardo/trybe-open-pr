#!/usr/bin/env bash
echo "Informe o caminho SSH do repositório do projeto:"
read URL
echo "---------------------------------------------------------------"
if [[ "$NAME_USER" == "" ]] ; then
  echo "Digite o seu Nome e Sobrenome:"
  read NAME_USER
  read -p "Deseja salvar o nome para os próximos projetos (s/N)" -n 1 -r
  [[ $REPLY =~ ^[Ss]$ ]] && echo 'NAME_USER="$NAME_USER"' >> ~/.bashrc && echo 'NAME_USER="$NAME_USER"' >> ~/.zshrc
fi
echo -e "\n"
PATH_PROJECT=$(echo $URL | cut -d'/' -f 2 | rev | cut -c5- | rev)
NAME_LOWER=$(echo "${NAME_USER// /-}" | tr '[:upper:]' '[:lower:]')
PROJECT_NAME=$(echo $URL | cut -d'/' -f 2 | rev | cut -c5- | rev | cut -c10-)
BRANCH_NAME=$(echo $NAME_LOWER-$PROJECT_NAME)

until git clone $URL
cd $PATH_PROJECT
git checkout -b $BRANCH_NAME
echo "\n" >> .gitignore
git add .
git commit -m 'iniciando o projeto. VAMOS COM TUDO :rocket:'
git push -u origin $BRANCH_NAME
do
  echo "Repositório ainda não liberado ou URL inválida"
done
echo -e "\n"
echo "Push realizado com sucesso, aguarde a abertura do PR"
echo -e "\n"
echo "---------------------------------------------------------------"
echo -e "\n"
if gh auth status ; then
  echo 'GH Autenticado!'
else
  if ! gh --version ; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install gh
  fi
  if [[ "$GITHUB_TOKEN" == "" ]] ; then
    echo "Digite o token de acesso do GITHUB:"
    read GITHUB_TOKEN
    read -p "Deseja salvar o token para os próximos projetos (s/N)" -n 1 -r
    echo -e "\n"
    [[ $REPLY =~ ^[Ss]$ ]] && echo 'GITHUB_TOKEN="$GITHUB_TOKEN"' >> ~/.bashrc && echo 'GITHUB_TOKEN="$GITHUB_TOKEN"' >> ~/.zshrc
  fi
  echo "$GITHUB_TOKEN" >> token.txt
  if gh auth login --with-token < token.txt ; then
    echo "Login realizado com sucesso!"
  else
    echo "Token inválido!"
  fi
  rm -rf token.txt
fi
echo -e "\n"
if gh pr create --title "[$NAME_USER] $PROJECT_NAME" --body "#VQV $PROJECT_NAME" ; then
  echo "PR aberto com sucesso!!!!"
else
  echo "Houve um erro durante a abertura do PR!"
fi