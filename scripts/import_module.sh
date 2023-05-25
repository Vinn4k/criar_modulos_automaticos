#!/bin/bash

nome_modulo=$1

nome_modulo_snake=$(echo "$nome_modulo" | sed -r 's/([A-Z])/_\L\1/g' | sed -r 's/^_//')

linha_import="import 'modules/${nome_modulo_snake}/${nome_modulo_snake}_module.dart';"

output="../lib/app/app_module.dart"
temp="../lib/app/temp.dart"

# Flag para indicar se a linha deve ser adicionada
adicionar_linha=0

# Flag para indicar se o novo import já foi adicionado
import_adicionado=0

# Ler o arquivo linha por linha
while IFS= read -r line
do
  if [[ $line == *"import"* ]]; then
    # Encontrou uma linha com a palavra "import"
    adicionar_linha=1
  fi

  if [[ $adicionar_linha -eq 1 ]]; then
    # Adicionar a nova linha após a última linha com o import
    echo "$line" >> "$temp"
    if [[ $line == *"import"* ]]; then
      # Verifica se é a última linha com o import
      if [[ $import_adicionado -eq 0 ]]; then
        # Adiciona o novo import logo abaixo
        echo "$linha_import" >> "$temp"
        import_adicionado=1
      fi
    fi
  else
    echo "$line" >> "$temp"
  fi

done < "$output"

# Substituir o arquivo original pelo arquivo atualizado
mv "$temp" "$output"

echo "Linha e import adicionados com sucesso!"


