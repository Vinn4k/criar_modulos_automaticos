#!/bin/bash

read -p "Digite o nome do módulo: " nome_modulo
# Chamar o comando mason make module com o nome do módulo fornecido
echo "Criando Modulo"
./create_module.bat "$nome_modulo"

echo "Adicionando Modulo no app_module.dart"
nome_modulo_pascal=$(echo "$nome_modulo" | sed 's/.*/\u&/')
nome_modulo_camel=$(echo "$nome_modulo" | sed 's/.*/\l&/')

linha="    ModuleRoute(AppRoutes.$nome_modulo_camel, module: ${nome_modulo_pascal}Module()),"

output="../lib/app/app_module.dart"
temp="../lib/app/temp.dart"

# Flag para indicar se a linha deve ser adicionada
adicionar_linha=0

# Ler o arquivo linha por linha
while IFS= read -r line
do
  if [[ $line == *"List<ModularRoute> get routes => ["* ]]; then
    # Encontrou a linha de início do array routes
    adicionar_linha=1
  fi

  if [[ $adicionar_linha -eq 1 ]]; then
    # Adicionar a nova linha após a última linha do array routes
    if [[ $line == *"module: "* ]]; then
      echo "$line" >> "$temp"
      echo "$linha" >> "$temp"
      adicionar_linha=0
    else
      echo "$line" >> "$temp"
    fi
  else
    echo "$line" >> "$temp"
  fi

done < "$output"

# Substituir o arquivo original pelo arquivo atualizado
mv "$temp" "$output"

echo "Linha adicionada com sucesso!"

echo "Adicionando Import"
./import_module.sh "$nome_modulo"


