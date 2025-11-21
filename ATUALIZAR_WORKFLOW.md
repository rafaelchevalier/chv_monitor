# 🔄 Como Atualizar o Workflow no GitHub

## ⚠️ Problema Atual

O GitHub Actions ainda está usando Xcode 26.1 RC (com bugs) em vez de uma versão estável. Isso acontece porque o arquivo `.github/workflows/build.yml` não foi atualizado no GitHub.

## ✅ Solução Passo a Passo

### Passo 1: Verificar se você está na pasta correta

```powershell
cd "C:\Git\Monitorar_Microfone\chv_monitor"
```

### Passo 2: Verificar o status do Git

```powershell
git status
```

Você deve ver o arquivo `.github/workflows/build.yml` listado como modificado.

### Passo 3: Adicionar o arquivo ao Git

```powershell
git add .github/workflows/build.yml
```

### Passo 4: Fazer commit

```powershell
git commit -m "Atualizar workflow para usar Xcode 16.0 estável"
```

### Passo 5: Fazer push para o GitHub

```powershell
git push origin main
```

**OU se sua branch se chama `master`:**

```powershell
git push origin master
```

### Passo 6: Verificar no GitHub

1. Acesse: `https://github.com/rafaelchevalier/chv_monitor/blob/main/.github/workflows/build.yml`
2. Verifique se a linha 21 mostra: `xcode-version: '16.0'`
3. Se ainda mostrar `latest-stable`, aguarde alguns segundos e atualize a página

### Passo 7: Executar o Workflow

1. Vá na aba "Actions" do GitHub
2. Clique em "Build iOS App"
3. Clique em "Run workflow" (botão no canto superior direito)
4. Selecione a branch "main"
5. Clique em "Run workflow"

## 🔍 Verificação nos Logs

Após executar o workflow, verifique nos logs:

**✅ CORRETO:**
```
Xcode 16.0
Build version 16A242d
```

**❌ ERRADO (ainda usando versão antiga):**
```
Xcode 26.1
Build version 17B54
```

## 🆘 Se Ainda Não Funcionar

Se mesmo após fazer push o workflow ainda usar Xcode 26.1, tente:

1. **Forçar uma versão ainda mais antiga:**
   - Edite o arquivo `.github/workflows/build.yml`
   - Mude para: `xcode-version: '15.4'`
   - Faça commit e push novamente

2. **Verificar se há cache:**
   - No GitHub Actions, clique em "Clear workflow runs"
   - Execute o workflow novamente

3. **Verificar se o arquivo foi enviado:**
   - No GitHub, vá em "Code" > "chv_monitor" > ".github" > "workflows" > "build.yml"
   - Verifique se o conteúdo está correto

## 📝 Comandos Completos (Copiar e Colar)

Se você quiser fazer tudo de uma vez:

```powershell
cd "C:\Git\Monitorar_Microfone\chv_monitor"
git add .github/workflows/build.yml
git commit -m "Atualizar workflow para usar Xcode 16.0 estável"
git push origin main
```

**IMPORTANTE**: Substitua `main` por `master` se sua branch se chama `master`.

