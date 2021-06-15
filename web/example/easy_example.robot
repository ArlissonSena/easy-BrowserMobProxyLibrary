*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         OperatingSystem
Library         BrowserMobProxyLibrary

*** Variables ***
${BROWSER}      Chrome
${PAGE_URL}     https://www.google.com


*** Test Cases ***
Coletando o tráfego do google e salvando num arquivo file .har 
    #Iniciando servidor local na porta escolhida
    Start Local Server              <path para o binário do browsermob-proxy>
    &{port}                         Create Dictionary       port=<defina uma porta para comunicação>
    ${BrowserMob_Proxy}=            Create Proxy            ${port}
    ${options}=                     Evaluate                sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method                     ${options}              add_argument       --proxy-server\=localhost:8086
    
    #Cria webdriver do Chrome com as opções do servidor local 
    Create WebDriver    ${BROWSER}    chrome_options=${options}

    #Inicia coleta do tráfego
    New Har             <nome_do_har>

    Go To               ${PAGE_URL}
    Title Should Be     Google
    
    #Coleta o tráfego de network e cria arquivo .har como um json
    ${har}=             Get Har As Json
    Create File         ${EXECDIR}${/}<nome_da_pasta>/<nome_do_arquivo>.har     ${har}

    #Finaliza o servidor local
    Stop Local Server
    Close All Browsers