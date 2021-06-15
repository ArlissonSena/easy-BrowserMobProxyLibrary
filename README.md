# RobotFramework-BrowserMobProxyLibrary
Um exemplo prático para utilizar o Robot Framework com Selenium e BrowserMobProxy.


## Introdução
BrowserMobProxyLibrary é uma biblioteca para [Robot Framework](http://robotframework.org/). Mais sobre [BrowserMob Proxy](https://bmp.lightbody.net/).

Eu tive que utilizar a biblioteca com o uso do Robot Framework e Selenium e vi apenas um exemplo prático de como utiliza-la, por conta disso, resolvi criar um template que pode ser usado e replicado de maneira simples. 

BrowserMob Proxy é um utilitário simples para capturar dados de desempenho para aplicativos web (por meio do formato HAR),
além de manipular o tráfego e o comportamento do navegador, whitelisting e blacklisting,
simular tráfego de rede e latência e reescrever solicitações e respostas HTTP.

Mais informação sobre essa biblioteca pode ser encontrado na [Keyword Documentation](https://rawgit.com/s4int/robotframework-BrowserMobProxyLibrary/master/doc/BrowserMobProxyLibrary.html).

## Dependências (Importante)

Além da instalação das ferramentas citadas você precisará configurar o browser que deseja usar para realizar a captura do tráfego.

O [Artur Spirin](https://www.youtube.com/c/ArturSpirin/videos) descreve como instalar os certificados do BrowserMobProxy.
(Uma vez o teste realizado remova o certificado do Browser por ele não ser seguro)

Ele tem um video ensinando como fazer isso para [Chrome](https://www.youtube.com/watch?v=HbfMmrnLedE) ou para [Firefox](https://www.youtube.com/watch?v=RSALSSGowRw)

## Exemplo
Exemplo fácil já configurado:
```robotframework

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
```
