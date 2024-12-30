#!/bin/bash

# Verificar se os parâmetros foram fornecidos
if [ $# -ne 2 ]; then
    echo "Uso: $0 <alvo> <tipo_de_arquivo>"
    echo " "
    echo "Exemplo: $0 alvo.com docx"
    exit 1
fi

# Parâmetros
ALVO=$1
TIPO=$2

# Buscar arquivos no Google e salvar os links em um arquivo
echo "Buscando arquivos do tipo $TIPO no domínio $ALVO..."
lynx --dump "https://google.com/search?&q=site:$ALVO+ext:$TIPO" | \
    grep ".$TIPO" | \
    cut -d "=" -f2 | \
    egrep -v "site|google" | \
    sed 's/...$//' > links.txt

# Verificar se algum link foi encontrado
if [ ! -s links.txt ]; then
    echo "Nenhum link encontrado para $TIPO no domínio $ALVO."
    rm -f links.txt
    exit 1
fi

# Baixar os arquivos listados
echo "Baixando arquivos..."
for url in $(cat links.txt); do
    wget -q "$url"
done

# Analisar metadados dos arquivos baixados
echo "Analisando metadados dos arquivos baixados..."
exiftool *.$TIPO

# Limpeza opcional (descomente para excluir os arquivos baixados e a lista de links)
 rm -f *.$TIPO links.txt

echo "Processo concluído."
