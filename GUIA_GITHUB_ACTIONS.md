# 🚀 Guia Completo: Compilar iOS App com GitHub Actions

## 📋 Pré-requisitos

- Conta no GitHub (gratuita)
- Git instalado no seu computador (Windows)
- Projeto `chv_monitor` pronto

## 🎯 Passo a Passo Completo

### PASSO 1: Instalar Git (se não tiver)

1. Baixe Git para Windows: https://git-scm.com/download/win
2. Instale com as opções padrão
3. Abra o **Git Bash** ou **PowerShell**

### PASSO 2: Criar Conta no GitHub

1. Acesse: https://github.com
2. Clique em **"Sign up"** (se não tiver conta)
3. Preencha os dados e confirme o email

### PASSO 3: Criar Repositório no GitHub

1. Faça login no GitHub
2. Clique no **"+"** no canto superior direito
3. Selecione **"New repository"**
4. Preencha:
   - **Repository name**: `chv_monitor` (ou outro nome)
   - **Description**: "App de monitoramento de áudio para iOS 18"
   - **Visibility**: 
     - ✅ **Public** (gratuito, Actions ilimitado)
     - ⚠️ **Private** (gratuito, mas Actions limitado a 2000 min/mês)
   - ❌ **NÃO marque** "Add a README file"
   - ❌ **NÃO marque** "Add .gitignore"
   - ❌ **NÃO marque** "Choose a license"
5. Clique em **"Create repository"**

### PASSO 4: Preparar o Projeto Localmente

1. Abra o **PowerShell** ou **Git Bash**
2. Navegue até a pasta do projeto:
```bash
cd "C:\Git\Monitorar Microfone\chv_monitor"
```

3. Verifique se a pasta `.github/workflows/` existe:
```bash
dir .github\workflows
```
   (Deve mostrar o arquivo `build.yml`)

### PASSO 5: Inicializar Git e Fazer Upload

Execute os comandos abaixo **um por vez**:

```bash
# 1. Inicializar repositório Git
git init

# 2. Adicionar todos os arquivos
git add .

# 3. Fazer primeiro commit
git commit -m "Initial commit - App iOS chv_monitor"

# 4. Renomear branch para main (se necessário)
git branch -M main

# 5. Conectar ao repositório GitHub
# SUBSTITUA "SEU_USUARIO" pelo seu nome de usuário do GitHub
git remote add origin https://github.com/SEU_USUARIO/chv_monitor.git

# 6. Enviar código para o GitHub
git push -u origin main
```

**⚠️ IMPORTANTE**: Na linha 5, substitua `SEU_USUARIO` pelo seu nome de usuário do GitHub!

**Exemplo**: Se seu usuário for `joaosilva`, use:
```bash
git remote add origin https://github.com/joaosilva/chv_monitor.git
```

### PASSO 6: Verificar se o Upload Funcionou

1. Acesse seu repositório no GitHub: `https://github.com/SEU_USUARIO/chv_monitor`
2. Você deve ver todos os arquivos do projeto
3. Verifique se existe a pasta `.github/workflows/build.yml`

### PASSO 7: Ativar GitHub Actions

1. No seu repositório, clique na aba **"Actions"** (menu superior)
2. Se aparecer uma mensagem sobre ativar Actions, clique em **"I understand my workflows, go ahead and enable them"**
3. Você verá o workflow **"Build iOS App"** na lista

### PASSO 8: Executar a Compilação

O workflow pode executar automaticamente, mas você também pode executar manualmente:

1. Vá na aba **"Actions"**
2. Clique em **"Build iOS App"** (ou no workflow que aparecer)
3. Clique no botão **"Run workflow"** (canto superior direito)
4. Selecione a branch **"main"**
5. Clique em **"Run workflow"**

### PASSO 9: Acompanhar a Compilação

1. Você verá o workflow em execução (bolinha amarela)
2. Clique no workflow para ver os detalhes
3. Aguarde ~5-10 minutos
4. Status:
   - 🟡 **Amarelo** = Executando
   - ✅ **Verde** = Sucesso
   - ❌ **Vermelho** = Erro

### PASSO 10: Baixar o Resultado

Quando a compilação terminar com sucesso (✅):

1. Clique no workflow concluído
2. Role até a seção **"Artifacts"**
3. Clique em **"xcarchive"** para baixar
4. O arquivo será um `.zip` com o `.xcarchive` dentro

## 📦 O que você receberá

- **Arquivo `.xcarchive`**: Projeto compilado
- **Não é um `.ipa` instalável diretamente**: Para gerar `.ipa`, ainda precisa de certificado

## ⚠️ Limitações Importantes

### Para Instalar no iPhone:

O `.xcarchive` compilado pelo GitHub Actions **NÃO pode ser instalado diretamente** porque:

1. **Não tem assinatura digital** (certificado)
2. **iOS requer assinatura** para instalar apps

### Soluções:

**Opção A: Usar o .xcarchive em um Mac**
- Baixe o `.xcarchive`
- Abra no Xcode (em um Mac)
- Exporte como `.ipa` com seu certificado
- Instale via sideloading

**Opção B: Compilar localmente uma vez**
- Use um Mac (emprestado/virtual) uma vez
- Compile e assine com seu certificado
- Gere o `.ipa` instalável

**Opção C: Usar serviço de assinatura**
- Alguns serviços fazem a assinatura por você
- Mas custam dinheiro

## 🔧 Solução de Problemas

### Erro: "git: command not found"
- **Solução**: Instale o Git (Passo 1)

### Erro: "remote origin already exists"
- **Solução**: Execute:
```bash
git remote remove origin
git remote add origin https://github.com/SEU_USUARIO/chv_monitor.git
```

### Erro: "Authentication failed"
- **Solução**: 
  1. GitHub não aceita mais senha via HTTPS
  2. Use **Personal Access Token**:
     - GitHub > Settings > Developer settings > Personal access tokens
     - Generate new token (classic)
     - Marque "repo"
     - Use o token como senha

### Workflow falha na compilação
- **Solução**: 
  1. Clique no workflow para ver os erros
  2. Verifique os logs
  3. Pode ser problema de configuração do projeto Xcode

### Não aparece a aba "Actions"
- **Solução**: 
  1. Verifique se o repositório não está vazio
  2. Verifique se o arquivo `.github/workflows/build.yml` existe
  3. Tente acessar diretamente: `https://github.com/SEU_USUARIO/chv_monitor/actions`

## 📝 Comandos Úteis

### Ver status do Git:
```bash
git status
```

### Ver commits:
```bash
git log
```

### Atualizar código no GitHub (após fazer mudanças):
```bash
git add .
git commit -m "Descrição das mudanças"
git push
```

### Baixar atualizações do GitHub:
```bash
git pull
```

## ✅ Checklist Final

- [ ] Git instalado
- [ ] Conta GitHub criada
- [ ] Repositório criado no GitHub
- [ ] Código enviado para GitHub
- [ ] Workflow executado
- [ ] Compilação concluída com sucesso
- [ ] Arquivo `.xcarchive` baixado

## 🎉 Próximos Passos

Após baixar o `.xcarchive`:

1. **Se tiver acesso a um Mac**:
   - Abra o `.xcarchive` no Xcode
   - Exporte como `.ipa`
   - Assine com seu certificado
   - Instale no iPhone

2. **Se não tiver Mac**:
   - Use um Mac virtual (MacinCloud, etc.)
   - Ou peça para alguém fazer a assinatura final
   - Ou use um serviço de assinatura

## 💡 Dica Extra

Você pode configurar o workflow para executar automaticamente sempre que fizer push:

O arquivo `.github/workflows/build.yml` já está configurado para isso! Sempre que você fizer `git push`, o GitHub Actions compilará automaticamente.

---

**Precisa de ajuda?** Me avise se encontrar algum problema nos passos acima!

