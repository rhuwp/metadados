# Script de Busca e Análise de Arquivos por Domínio
Este script automatiza a busca, download e análise de arquivos hospedados em um domínio específico. Utilizando o navegador em linha de comando Lynx e a ferramenta ExifTool, ele é ideal para tarefas como coleta de informações e extração de metadados.

## Pré-requisitos
 as seguintes ferramentas devem ester instaladas:

- Lynx: Navegador em linha de comando usado para realizar buscas no Google.
- ExifTool: Utilitário para análise de metadados de arquivos.
- Wget: Ferramenta para download de arquivos via linha de comando.

## Uso
Execute o script fornecendo dois parâmetros obrigatórios:

**Domínio alvo** (exemplo: exemplo.com)
**Extensão do arquivo** (exemplo: pdf, docx, jpg).

### Comando:

./script.sh <alvo> <tipo_de_arquivo>
## Exemplo:
./script.sh exemplo.com pdf

## Funcionamento
- Busca de Arquivos: Realiza uma pesquisa no Google por arquivos da extensão especificada dentro do domínio fornecido.
- Download: Salva os links encontrados e baixa os arquivos listados.
- Análise de Metadados: Extrai e exibe metadados dos arquivos baixados.
- Limpeza Opcional: Remove os arquivos baixados e a lista de links após a execução.
