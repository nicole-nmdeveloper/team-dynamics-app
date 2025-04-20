# Team Dynamics App

Sistema de gerenciamento de dinâmicas de equipe.

## 📌 Instalação

Certifique-se de ter o Docker instalado em sua máquina.

Clone o repositório com o seguinte comando: 

```bash
  git clone https://github.com/nicole-nmdeveloper/team_dynamics_app.git
```

Acesse a pasta do projeto:

```bash
cd team_dynamics_app/
```

Execute o script de inicialização ```setup.sh```:

```bash
./setup.sh
```

O projeto estará pronto para ser acessado na url: http://localhost:3000/

### Instalação Manual

Após clonar o repositório, crie um arquivo ```.env``` a partir do arquivo ```env_example```.
Em seguida, execute os seguintes comandos:

```bash
docker-compose build
```

```bash
docker-compose up
```

Em outro terminal, execute o comando abaixo para criar o banco de dados e executar as migrações.

```bash
docker-compose exec web rails db:create db:migrate
```

Acesse o projeto na url: http://localhost:3000/

## 💻 Desenvolvimento e Funcionalidades

O projeto foi feito utilizando a arquitetura MVC com Ruby on Rails.

Ao abrir o projeto pela primeira vez, poderá cadastrar uma nova dinâmica e já incluir uma review ou não (comentário e nota). Elas poderão ser adicionadas posteriormente.

É possível também editar e excluir uma dinâmica. Note que ao excluir a dinâmica, todas as reviews relacionadas também serão excluídas.

Na tela de visualização de apenas uma dinâmica (aleatória ou não), é possível ver todas as informações referentes a ela. Inclusive uma listagem de suas reviews. Cada review possui um link para atualização das informações. 

Na página inicial, poderá visualizar uma lista de dinâmicas com o título de cada uma e suas respectivas avaliações médias.
