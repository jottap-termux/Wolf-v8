#!/bin/bash

# Verifica se o pip/pip3 está instalado
if ! command -v pip3 &> /dev/null && ! command -v pip &> /dev/null; then
    echo "❌ Pip não encontrado. Instale o Python e o Pip primeiro."
    exit 1
fi

# Usa pip3 se existir, senão usa pip
PIP_CMD=$(command -v pip3 || command -v pip)

echo "🔧 Instalando dependências..."
$PIP_CMD install --upgrade requests yt-dlp

if [ $? -eq 0 ]; then
    echo "✅ Tudo pronto! Agora execute o Wolf-v8 normalmente."
else
    echo "❌ Erro na instalação. Tente:"
    echo "   - Usar 'sudo $PIP_CMD install...' (se der erro de permissão)"
    echo "   - Ou adicionar '--user' (para instalar só no seu usuário)"
    exit 1
fi
