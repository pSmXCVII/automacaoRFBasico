*** Settings ***
Library           SeleniumLibrary    #pip install --upgrade robotframework-seleniumlibrary
Library           FakerLibrary    #pip install robotframework-faker

*** Variable ***
${URL}            http://automationpractice.com/index.php
${BROWSER}        chrome
${TIMEOUT}        5

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    SeleniumLibrary.Open Browser    url=${URL}    browser=${BROWSER}

Fechar navegador
    SeleniumLibrary.Close Browser
#### Passo-a-passo

Acessar página home do site
    SeleniumLibrary.Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    SeleniumLibrary.Input Text    //*[@id="search_query_top"]    ${PRODUTO}

Clicar no botão Pesquisar
    Clicar no elemento    //*[@id="searchbox"]/button

Conferir se o produto "${PRODUTO}" foi listado no site
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="center_column"]    20
    SeleniumLibrary.Element Attribute Value Should Be    //*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img    title    ${PRODUTO}

Conferir mensagem de erro "${NOTFOUND_MSG}"
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="center_column"]    20
    SeleniumLibrary.Element Text Should Be    //*[@id="center_column"]/p    ${NOTFOUND_MSG}

Passar o mouse por cima do elemento
    [Arguments]    ${ELEMENT_LOCATOR}
    SeleniumLibrary.Wait Until Element Is Visible    ${ELEMENT_LOCATOR}    ${TIMEOUT}
    SeleniumLibrary.Mouse Down    ${ELEMENT_LOCATOR}

Clicar no elemento
    [Arguments]    ${ELEMENT_LOCATOR}
    SeleniumLibrary.Wait Until Element Is Visible    ${ELEMENT_LOCATOR}    ${TIMEOUT}
    SeleniumLibrary.Click Element    ${ELEMENT_LOCATOR}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Passar o mouse por cima do elemento    //a[@title="${CATEGORIA}"]

Clicar na sub categoria "${SUBCATEGORIA}"
    Clicar no elemento    (//*[@title="${SUBCATEGORIA}"])[1]

Clicar no botão "Add to cart" do produto
    Passar o mouse por cima do elemento    //*[@class="right-block"]
    Clicar no elemento    //*[@title="Add to cart"]

Clicar no botão "Proceed to checkout"
    SeleniumLibrary.Page Should Contain Element    //*[@id="layer_cart"]
    Clicar no elemento    //*[@title="Proceed to checkout"]

Clicar no ícone carrinho de compras no menu superior direito
    Clicar no elemento    //*[@title="View my shopping cart"]

Clicar no botão de remoção de produtos (delete) no produto do carrinho
    Clicar no elemento    //*[@title="Delete"]

Clicar no botão superior direito “Sign in”
    Clicar no elemento    //*[@title="Log in to your customer account"]

Preencher o campo
    [Arguments]    ${INPUT_LOCATOR}    ${VALUE}
    SeleniumLibrary.Wait Until Element Is Visible    ${INPUT_LOCATOR}    ${TIMEOUT}
    SeleniumLibrary.Element Should Be Enabled    ${INPUT_LOCATOR}
    SeleniumLibrary.Input Text    ${INPUT_LOCATOR}    ${VALUE}

Clicar no botão "Create na account"
    ${RANDON_EMAIL}=    FakerLibrary.Email
    Preencher o campo    //*[@id="email_create"]    ${RANDON_EMAIL}
    Clicar no elemento    //*[@id="SubmitCreate"]

Preencher os campos obrigatórios
    ${FIRST_NAME}=    FakerLibrary.First Name
    ${LAST_NAME}=    FakerLibrary.Last Name
    ${PASSWORD}=    FakerLibrary.Password    digits=6
    ${ADDRESS}=    FakerLibrary.Address
    ${CITY}=    FakerLibrary.City
    ${STATE_INDEX}=    FakerLibrary.Random Int    min=1    max=53
    ${POSTAL_CODE}=    FakerLibrary.Postalcode
    ${MOBILE_PHONE}=    FakerLibrary.Phone Number
    Preencher o campo    //*[@id="customer_firstname"]    ${FIRST_NAME}
    Preencher o campo    //*[@id="customer_lastname"]    ${LAST_NAME}
    Preencher o campo    //*[@id="address1"]    Rua Teste
    Preencher o campo    //*[@id="city"]    ${CITY}
    SeleniumLibrary.Select From List By Value    //*[@id="id_state"]    ${STATE_INDEX}
    Preencher o campo    //*[@id="passwd"]    ${PASSWORD}
    Preencher o campo    //*[@id="postcode"]    ${POSTAL_CODE}
    Preencher o campo    //*[@id="phone_mobile"]    55678902623

Clicar em "Register" para finalizar o cadastro
    Clicar no elemento    //*[@id="submitAccount"]
    SeleniumLibrary.Wait Until Page Contains Element    //*[@class="myaccount-link-list"]
    SeleniumLibrary.Element Text Should Be    //*[@id="center_column"]/h1    MY ACCOUNT
    SeleniumLibrary.Title Should Be    My account - My Store
