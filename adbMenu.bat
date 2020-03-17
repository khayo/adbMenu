cls
:menu
cls

@echo              MENU ADB
@echo ================================
@echo * 1 - Abrir NOX                *
@echo * 2 - Localizar porta          *
@echo * 3 - Conectar a porta padrao  *
@echo * 4 - Conectar a outra porta   *
@echo * 5 - Conexoes ativas          *
@echo * 6 - Desconetar porta         *
@echo * 7 - Configurar               *
@echo * 8 - Sair                     *
@echo ================================

@set /p opcao= Escolha uma opcao: 
echo --------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto submenuConfig
if %opcao% equ 8 goto opcao8


:opcao1
cls
start "NOX" "D:\Program Files\Nox\bin\Nox.exe"
goto menu

:opcao2
cls
@set /p PID= Informe o PID do processo NOXVMHandle.exe: 
CALL netstat -aon | findstr %PID%
pause
goto menu 

:opcao3
cls
@echo Conectando a porta padrão
START /wait "ADB" adb connect 127.0.0.1:62001

pause
goto menu

:opcao4
cls
@set /p porta= Informe a porta que deseja conectar: 
start /wait "ADB" adb connect 127.0.0.1:%porta%
pause
goto menu

:opcao5
cls
@echo Verificando conexoes ativas
CALL adb devices -l
pause
goto menu

:opcao6
cls
@set /p porta= Infome a porta que deseja desconectar: 
@echo Desconectando da porta %porta% ...
CALL adb disconnect 127.0.0.1:%porta%
pause 
goto menu 

:submenuConfig
cls

@echo          Configurar ADB
@echo ================================
@echo * 1 - Adicionar ADB ao path    *
@echo * 2 - Verificar PATH           *
@echo * 3 - Voltar ao menu principal *
@echo ================================
@set /p opcao= Escolha uma opcao: 
@echo --------------------------------
if %opcao% equ 1 goto configADB
if %opcao% equ 2 goto verificarPath
if %opcao% equ 3 goto menu

:configADB
cls
@echo                            IMPORTANTE!!!!!
@echo ======================================================================    
@echo +                                                                    +
@echo +  O adb normalmente esta localizado no caminho:                     +
@echo +  "C:\Users\seu_usuario\AppData\Local\Android\sdk\platform-tools\"  +
@echo +                                                                    +
@echo ======================================================================       
@echo Para adicionar o caminho ao path:
@echo 1 - win+pause
@echo 2 - Configuracoes avancadas do sistema 
@echo 3 - Variaveis de ambiente
@echo 4 - Em variaveis de usuario selecione path e clique no botao editar
@echo 5 - De um clique duplo em uma linha vazia
@echo 6 - Entre com o endereco do adb, sem incluir adb.exe ao endereco
@echo 7 - clique em todos os oks das janelas abertas 
pause
goto :submenuConfig 

:verificarPath
cls
@echo IMPORTE: Necessario reiniciar este arquivo bat para verificar atualizacao
@echo do PATH
@echo Se voce realizou o procedimento corretamente o ultimo endereco desta lista
@echo separada por ponto e virgula, sera o endereco do adb. 
@echo -----------------------------------------------------------------------------
PATH
pause
goto :submenuConfig

:opcao8
exit