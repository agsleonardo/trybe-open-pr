## Trybe Open PR
Este script foi desenvolvido com intuito de facilitar o processo de abertura de Pull Requests nos projetos para os alunos da Trybe.

Basicamente, o script pede o caminho SSH do repositório, o nome e sobrenome da pessoa que está abrindo o Pull Request, e o token de acesso pessoal do Github (caso seja a primeira execução).

O processo de abertura é realizado via CLI proprietária do Github (gh), que o script se encarrega de instalar caso ainda não tenha no sistema.
## Funcionalidades

- Abre o PR para os projetos da Trybe de forma automatizada.


## Rodando localmente

Crie um token de acesso pessoal do GITHUB

```bash
  https://docs.github.com/pt/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
```
Clone o projeto

```bash
  git clone git@github.com:agsleonardo/trybe-open-pr.git
```

Entre no diretório do projeto

```bash
  cd trybe-open-pr
```

Copie o script para a pasta onde você armazena os projetos

```bash
  cp openpr.sh /pasta-dos-projetos
```
Entre na pasta onde você armazena os projetos

```bash
  cd /pasta-dos-projetos
```
Execute o script

```bash
  bash openpr.sh
```
