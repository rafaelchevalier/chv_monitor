# 📤 Instruções para Fazer Push das Correções

## ✅ Branch: main

Você tem apenas uma branch chamada **`main`**.

## 🚀 Comandos para Executar

Execute estes comandos no PowerShell:

```powershell
cd "C:\Git\Monitorar_Microfone\chv_monitor"
git add .
git commit -m "Corrigir IDs do scheme, objectVersion e compatibilidade do projeto"
git push origin main
```

## 📋 O que será enviado

- ✅ `chv_monitor.xcodeproj/project.pbxproj` (objectVersion corrigido)
- ✅ `chv_monitor.xcodeproj/xcshareddata/xcschemes/chv_monitor.xcscheme` (IDs corrigidos)
- ✅ `.github/workflows/build.yml` (Xcode 16.0)
- ✅ Todos os outros arquivos do projeto

## 🔍 Verificação Após Push

1. Acesse: `https://github.com/rafaelchevalier/chv_monitor`
2. Verifique se os arquivos foram atualizados
3. Vá em "Actions" > "Build iOS App" > "Run workflow"
4. Verifique nos logs se está usando Xcode 16.0

## ⚠️ Se Der Erro no Push

Se aparecer erro de autenticação:
- Use Personal Access Token (não sua senha)
- Ou configure o Git com suas credenciais

