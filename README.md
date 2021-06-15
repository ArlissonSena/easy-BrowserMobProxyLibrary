# Robot-BrowserMobProxyLibrary
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
