# 🔧 Correção do Projeto Xcode

## Problema Identificado

O erro `-[PBXFileReference buildPhase]: unrecognized selector` ocorre quando o Xcode tenta processar o arquivo `project.pbxproj` e encontra referências incorretas.

## Correções Aplicadas

1. ✅ **objectVersion corrigido**: De 56 para 54 (versão suportada)
2. ✅ **IDs únicos adicionados**: Todos os objetos agora têm IDs únicos de 24 caracteres hexadecimais
3. ✅ **Info.plist removido de Resources**: Info.plist não deve estar em PBXResourcesBuildPhase
4. ✅ **Settings.bundle removido temporariamente**: Removido do build para testar se era a causa do erro
5. ✅ **Arquivo de scheme criado**: Scheme necessário para o build
6. ✅ **Estrutura completa**: Todas as seções necessárias foram adicionadas
7. ✅ **Xcode versão forçada**: Forçado uso do Xcode 15.4 (versão estável) em vez de 26.1 RC

## Se o Erro Persistir

### Opção 1: Validar o Projeto Localmente (se tiver Mac)

```bash
cd chv_monitor
xcodebuild -project chv_monitor.xcodeproj -scheme chv_monitor -list
```

Se houver erros, o Xcode mostrará onde está o problema.

### Opção 2: Usar Xcode para Recriar o Projeto

1. Abra o Xcode
2. Crie um novo projeto iOS
3. Adicione os arquivos Swift manualmente
4. Configure o Info.plist e Settings.bundle
5. Exporte o projeto

### Opção 3: Verificar Versão do Xcode no GitHub Actions

O GitHub Actions está usando Xcode 26.1 RC, que pode ter bugs. Tente forçar uma versão estável:

```yaml
- name: Setup Xcode
  uses: maxim-lobanov/setup-xcode@v1
  with:
    xcode-version: '15.4'  # Versão estável
```

### Opção 4: Verificar Estrutura de Arquivos

Certifique-se de que todos os arquivos existem:

```
chv_monitor/
├── chv_monitor/
│   ├── AppDelegate.swift
│   ├── ViewController.swift
│   ├── AudioRecorderManager.swift
│   ├── FileManagerHelper.swift
│   ├── SettingsObserver.swift
│   ├── Info.plist
│   └── Settings.bundle/
│       ├── Root.plist
│       └── Root.strings
└── chv_monitor.xcodeproj/
    ├── project.pbxproj
    └── xcshareddata/
        └── xcschemes/
            └── chv_monitor.xcscheme
```

## Próximos Passos

1. Faça commit das alterações:
```bash
git add .
git commit -m "Corrigir estrutura do projeto Xcode"
git push
```

2. Execute o workflow novamente no GitHub Actions

3. Se ainda houver erro, verifique os logs detalhados na aba "Actions"

## Nota Importante

O erro pode estar relacionado à versão do Xcode (26.1 RC) que pode ter bugs. Se possível, tente usar uma versão estável do Xcode.

