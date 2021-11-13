# Automação de Testes com Robot Framework - Básico

## Objetivo:

Automações simples em uma página web de exemplo, explorando recursos de interação
com o browser.

## Ambiente

- Python 3.7.0
- RobotFramework (pip install robotframework)
- SeleniumLibrary (pip install --upgrade robotframework-seleniumlibrary)
- Webdriver (Versão do chromedriver compatível com a versão do seu navegador. Se precisar testar em outro navegador, basta configurar o webdriver nas variáveis do ambiente e alterar no arquivo "Resource.robot" a variável ${BROWSER} ou passar valor personalizado na comando
  de execução do terminal)

## Executando

### Executando várias suites de teste

Executar no terminal: `robot -d<pasta_destino_logs> <pasta_da_suite>`

**Exemplo:** `robot -d ./results ./tests`

### Executando apenas uma suite de teste

Executar no terminal: `robot -d<pasta_destino_logs> <caminho_da_suite>`

**Exemplo:** `robot -d ./results ./tests/TestSitePratice.robot`

### Executando apenas um caso de teste da suite

Executar no terminal: `robot -d<pasta_destino_logs> -t "<nome_do_caso_de_teste" <pasta_da_suite>`

**Exemplo:** `robot -d ./results -t "Caso de Teste 01: Pesquisar produto existente" ./tests`

### Executando com outro navegador

Executar no terminal: `robot -d<pasta_destino_logs> <caminho_da_suite> -v BROWSER:{browserdriver}`

**Exemplo:** `robot -d ./results -v BROWSER:edge ./tests/TestSitePratice.robot`
