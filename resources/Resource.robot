*** Settings ***
Library           SeleniumLibrary    #pip install --upgrade robotframework-seleniumlibrary

*** Variable ***
${URL}            http://automationpractice.com/index.php
${BROWSER}        chrome

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    SeleniumLibrary.Open Browser    url=${URL}    browser=${BROWSER}

Fechar navegador
    SeleniumLibrary.Close Browser
#### Passo-a-passo

Acessar a página home do site
    SeleniumLibrary.Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
    SeleniumLibrary.Input Text    //*[@id="search_query_top"]    ${PRODUTO}

Clicar no botão Pesquisar
    SeleniumLibrary.Click Button    //*[@id="searchbox"]/button

Conferir se o produto "${PRODUTO}" foi listado no site
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="center_column"]    20
    SeleniumLibrary.Element Attribute Value Should Be    //*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img    title    ${PRODUTO}

Conferir mensagem de erro "${NOTFOUND_MSG}"
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="center_column"]    20
    SeleniumLibrary.Element Text Should Be    //*[@id="center_column"]/p    ${NOTFOUND_MSG}
