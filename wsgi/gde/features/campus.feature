Feature: Funcionalidade Campus


  Background: Em todos os testes o usuário deve estar logado.
    Given Eu sou um usuario logado

  Scenario: Cadastrar um novo campus
    Given que eu estou na pagina de cadastrar campus
    And Informo um nome ainda nao cadastrado no sistema
    When clico no botão enviar
    Then sou redirecionado para a pagina com a lista de campi cadastrados
    And o campus deve estar devidamento cadastrado

    Given que eu estou na pagina de cadastrar campus
    And preencho o nome do campus em branco
    When clico no botão enviar
    Then nao conseguirei cadastrar o campus ate que eu preencha o campo nome

    Given que eu estou na pagina de cadastrar campus
    And informo um nome ja cadastrado no sistema
    When clico no botão enviar
    Then recebo uma mensagem de erro informando que este nome ja existe
    And nao conseguirei cadastrar o campus ate que eu o preencha com um nome diferente

  Scenario: Editar um campus
    Given Estou na pagina com a lista de campus
    And Possui um ou mais campus cadastrados
    And Seleciono o botao editar de um campus
    And Sou redirecionado para a pagina com seus dados do campus ja preenchidos
    And Preencho o campo campus com um novo nome
   When Clico no botao salvar
   Then sou redirecionado para a pagina com a lista de campi cadastrados

  Given Estou na pagina com a lista de campus
    And Possui um ou mais campus cadastrados
    And Seleciono o botao editar de um campus
    And Sou redirecionado para a pagina com seus dados do campus ja preenchidos
    And Edito o campo campus e o deixo em branco
   When Clico no botao salvar
   Then recebo uma mensagem de erro informando que o campo e obrigatorio
    And Nao conseguirei editar campus ate que preencha o campo nome

    Given Estou na pagina com a lista de campus
    And Possui um ou mais campus cadastrados
    And Seleciono o botao editar de um campus
    And Sou redirecionado para a pagina com seus dados do campus ja preenchidos
    And Edito o nome do campus e coloco um nome que ja esta cadastrado
   When Clico no botao salvar
   Then recebo uma mensagem de erro informando que o nome ja existe
    And Nao conseguirei salvar o campus ate que eu o preencha com um nome diferente.

  Given Estou na pagina com a lista de campus
    And Possui um ou mais campus cadastrados
    And Seleciono o botao editar de um campus
    And Sou redirecionado para a pagina com seus dados do campus ja preenchidos
    And Nao altero o campus deixando com o nome ja preenchido
   When Clico no botao salvar
   Then recebo uma mensagem de erro informando que o nome ja existe
    And Nao conseguirei salvar o campus ate que eu o preencha com um nome diferente.

    Scenario: Visualizar Campus
  Given Um campus foi cadastrado
  When  sou redirecionado para a pagina com a lista de campi cadastrados
  Then  O campus devera aparecer na lista.

  Given Estou na pagina principal do sistema
    And Possui um ou mais campi cadastrados
  When  clico no botao visualizar campus
  Then  sou redirecionado para a pagina com a lista de campi cadastrados

  Scenario: Excluir campus
   Given Estou na pagina com a lista de campus
     And que existem campi cadastrados
    When clico no botao excluir.
    Then o campus deixara de existir.
