@echo off

set "nome_modulo=%~1"

mason make module --name %nome_modulo% -o ../lib/app/modules/

echo Módulo criado com sucesso!

