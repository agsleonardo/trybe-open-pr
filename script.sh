#!/usr/bin/env bash
echo "Informe o caminho SSH do repositório do projeto:"
read URL
echo -e "\n"

if [[ "$NAME_USER" == "" ]] ; then
  echo "Digite o seu Nome e Sobrenome:"
  read NAME_USER
  echo -e "\n"
  read -p "Deseja salvar o nome para os próximos projetos (s/N)" -n 1 -r
  echo -e "\n"
fi
[[ ! $REPLY =~ ^[Ss]$ ]] && echo 'NAME_USER="$NAME_USER"' >> ~/.bashrc && echo 'NAME_USER="$NAME_USER"' >> ~/.zshrc

if gh auth status ; then
  echo 'GH Autenticado!'
else
  echo "Digite o token de acesso do GITHUB:"
  read GITHUB_TOKEN
  read -p "Deseja salvar o token para os próximos projetos (s/N)" -n 1 -r
  [[ ! $REPLY =~ ^[Ss]$ ]] && echo 'GITHUB_TOKEN="$GITHUB_TOKEN"' >> ~/.bashrc && echo 'GITHUB_TOKEN="$GITHUB_TOKEN"' >> ~/.zshrc
fi

# if [[ "$GITHUB_TOKEN" == "" ]] ; then
# fi
#
#
#A variavel de ambiente é vazia?
#	Digite o token de acesso do GITHUB:
#	-GITHUB_TOKEN
