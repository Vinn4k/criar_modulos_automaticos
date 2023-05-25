#!/bin/bash

nome_rota=$1

# Converter o nome da rota para kebab case (palavras separadas por "-")
nome_rota_kebab=$(echo "$nome_rota" | sed 's/\(.\)\([A-Z]\)/\1-\2/g' | tr '[:upper:]' '[:lower:]')
linha_rota="  static const $nome_rota = '/$nome_rota_kebab';"

output="../lib/app/shared/app_routes.dart"
temp="../lib/app/shared/temp.dart"

# Flag para indicar se a linha deve ser adicionada
adicionar_linha=0

# Flag para indicar se a nova linha já foi adicionada
linha_adicionada=0

# Ler o arquivo linha por linha
while IFS= read -r line
do
  if [[ $line == *"static const"* ]]; then
    # Encontrou uma linha com a palavra "static const"
    adicionar_linha=1
  fi

  if [[ $adicionar_linha -eq 1 ]]; then
    # Adicionar a nova linha após a última linha com static const
    echo "$line" >> "$temp"
    if [[ $linha_adicionada -eq 0 ]]; then
      echo "$linha_rota" >> "$temp"
      linha_adicionada=1
    fi
  else
    echo "$line" >> "$temp"
  fi

done < "$output"

# Adicionar o fechamenecho "}" >> "$temp"to da classe

# Substituir o arquivo original pelo arquivo atualizado
mv "$temp" "$output"

echo "Variável adicionada com sucesso!"
