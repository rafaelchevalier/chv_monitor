# 🔧 Solução para Erro de Build

## Problema Identificado

O erro `-[PBXFileReference buildPhase]: unrecognized selector` está ocorrendo porque:

1. **Xcode 26.1 RC tem bugs**: Esta versão Release Candidate tem problemas conhecidos com projetos Xcode
2. **Workflow não foi atualizado**: O arquivo `.github/workflows/build.yml` no GitHub ainda está usando `latest-stable` em vez de uma versão específica

## ✅ Solução

### Passo 1: Atualizar o Workflow

O arquivo `.github/workflows/build.yml` foi atualizado para usar Xcode 16.4 (versão estável disponível no GitHub Actions).

**IMPORTANTE**: Você precisa fazer commit e push deste arquivo atualizado!

### Passo 2: Fazer Commit e Push

```powershell
cd "C:\Git\Monitorar_Microfone\chv_monitor"
git add .github/workflows/build.yml
git commit -m "Forçar uso do Xcode 16.4 em vez de latest-stable"
git push
```

### Passo 3: Verificar se o Arquivo Foi Enviado

1. Acesse: `https://github.com/rafaelchevalier/chv_monitor/blob/main/.github/workflows/build.yml`
2. Verifique se a linha 21 mostra: `xcode-version: '16.4'`
3. Se ainda mostrar `latest-stable`, o arquivo não foi atualizado

### Passo 4: Executar o Workflow Novamente

1. Vá na aba "Actions" do GitHub
2. Execute o workflow "Build iOS App" manualmente
3. Verifique se agora está usando Xcode 16.4

## 📋 Versões de Xcode Disponíveis no GitHub Actions

Segundo o log, estas versões estão disponíveis:
- ✅ Xcode 16.4.0 (16F6) - **RECOMENDADO**
- ✅ Xcode 16.3.0 (16E140)
- ✅ Xcode 16.2.0 (16C5032a)
- ✅ Xcode 16.1.0 (16B40)
- ✅ Xcode 16.0.0 (16A242d)
- ❌ Xcode 26.1.0 (17B54) - **EVITAR** (tem bugs)

## 🔍 Verificação

Após fazer push, verifique nos logs do workflow:
- Deve mostrar: `Xcode 16.4` ou similar
- NÃO deve mostrar: `Xcode 26.1` ou `Release_Candidate`

## ⚠️ Se o Erro Persistir

Se mesmo com Xcode 16.4 o erro continuar, pode ser necessário:

1. **Recriar o projeto no Xcode**: Abrir o Xcode, criar um novo projeto iOS e copiar os arquivos Swift
2. **Usar uma versão mais antiga**: Tentar Xcode 15.4 ou 16.0
3. **Verificar estrutura do projeto**: Certificar-se de que todos os arquivos estão corretos

## 📝 Nota Importante

O arquivo `project.pbxproj` foi recriado do zero com uma estrutura válida. Se o erro persistir mesmo com Xcode 16.4, pode ser um problema específico do formato do arquivo que precisa ser gerado pelo próprio Xcode.

