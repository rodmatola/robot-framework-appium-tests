*** Settings ***
Documentation     demo for appium library
Library           AppiumLibrary
#Test Template  Cenário: Triângulo
*** Test Cases ***
Cenário: Teste Triângulo
    [Template]   Cenário: Triângulo
    #numero1    #numero2    #numero3    #mensagem
    3           3           3           O triângulo é Equilátero
    1           2           2           O triângulo é Isósceles
    1           2           3           O triângulo é Escaleno

*** Keywords ***
Cenário: Triângulo
    [Arguments]  ${numero1}  ${numero2}  ${numero3}  ${mensagem}
    Dado que estou na tela do TrianguloApp
    Quando eu preencher os campos com ${numero1} ${numero2} ${numero3}
    E clicar em Calcular
    Então a mensagem ${mensagem} sera exibida

Dado que estou na tela do TrianguloApp
    Open Application    http://localhost:4723/wd/hub  platformName=Android    platformVersion=6.0
    ...  deviceName=emulator-5554    app=com.eliasnogueira.trianguloapp  automationName=appium
    ...  appPackage=com.eliasnogueira.trianguloapp  appActivity=com.eliasnogueira.trianguloapp.MainActivity


Quando eu preencher os campos com ${numero1} ${numero2} ${numero3}
    #[Arguments]  ${numero1}  ${numero2}  ${numero3}
    Input Text  id=txtLado1  ${numero1}
    Input Text  id=txtLado2  ${numero2}
    Input Text  id=txtLado3  ${numero3}

E clicar em Calcular
    click element  id=btnCalcular

Então a mensagem ${mensagem} sera exibida
    element text should be  id=txtResultado  ${mensagem}