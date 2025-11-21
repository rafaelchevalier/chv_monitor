# 📖 Passo a Passo Visual - GitHub Actions

## 🎯 Resumo Rápido

1. ✅ Criar conta GitHub
2. ✅ Criar repositório
3. ✅ Enviar código
4. ✅ GitHub compila automaticamente
5. ✅ Baixar resultado

---

## 📝 PASSO 1: Criar Conta no GitHub

1. Acesse: **https://github.com**
2. Clique em **"Sign up"** (canto superior direito)
3. Preencha:
   - Username (ex: `joaosilva`)
   - Email
   - Senha
4. Confirme seu email (verifique a caixa de entrada)

---

## 📦 PASSO 2: Criar Repositório

1. Após fazer login, clique no **"+"** (canto superior direito)
2. Clique em **"New repository"**

3. Preencha o formulário:
   ```
   Repository name: chv_monitor
   Description: App de monitoramento de áudio iOS 18
   ✅ Public (recomendado - Actions ilimitado)
   ❌ NÃO marque "Add a README file"
   ❌ NÃO marque "Add .gitignore"  
   ❌ NÃO marque "Choose a license"
   ```

4. Clique em **"Create repository"** (botão verde)

---

## 💻 PASSO 3: Instalar Git (se não tiver)

### Verificar se já tem Git:

Abra o **PowerShell** e digite:
```powershell
git --version
```

Se aparecer uma versão (ex: `git version 2.40.0`), você já tem Git! Pule para o Passo 4.

### Se não tiver Git:

1. Baixe: **https://git-scm.com/download/win**
2. Execute o instalador
3. Use as opções padrão (Next, Next, Install)
4. Reinicie o PowerShell após instalar

---

## 📤 PASSO 4: Enviar Código para GitHub

### 4.1. Abrir PowerShell

1. Pressione **Windows + X**
2. Clique em **"Windows PowerShell"** ou **"Terminal"**

### 4.2. Navegar até a pasta do projeto

Digite (ajuste o caminho se necessário):
```powershell
cd "C:\Git\Monitorar Microfone\chv_monitor"
```

### 4.3. Verificar se está na pasta correta

```powershell
dir
```

Você deve ver:
- Pasta `chv_monitor`
- Pasta `.github`
- Arquivo `README.md`
- etc.

### 4.4. Executar comandos Git

**Execute um comando por vez:**

```powershell
# 1. Inicializar Git
git init
```

```powershell
# 2. Adicionar todos os arquivos
git add .
```

```powershell
# 3. Fazer primeiro commit
git commit -m "Initial commit - App iOS chv_monitor"
```

```powershell
# 4. Renomear branch para main
git branch -M main
```

```powershell
# 5. Conectar ao GitHub
# ⚠️ SUBSTITUA "SEU_USUARIO" pelo seu username do GitHub!
git remote add origin https://github.com/SEU_USUARIO/chv_monitor.git
```

**Exemplo real:**
Se seu usuário for `joaosilva`, digite:
```powershell
git remote add origin https://github.com/joaosilva/chv_monitor.git
```

```powershell
# 6. Enviar código
git push -u origin main
```

### 4.5. Autenticação

Quando executar `git push`, o GitHub pedirá login:

**Opção A: Personal Access Token (Recomendado)**

1. GitHub não aceita mais senha normal
2. Crie um token:
   - Vá em: **https://github.com/settings/tokens**
   - Clique em **"Generate new token"** > **"Generate new token (classic)"**
   - Nome: `chv_monitor`
   - Marque: ✅ **repo** (todas as opções)
   - Clique em **"Generate token"**
   - **COPIE O TOKEN** (você não verá novamente!)
3. No PowerShell:
   - Username: seu username do GitHub
   - Password: **cole o token** (não sua senha!)

**Opção B: GitHub Desktop (Mais Fácil)**

1. Baixe: **https://desktop.github.com**
2. Instale e faça login
3. Use a interface gráfica para fazer push

---

## ✅ PASSO 5: Verificar Upload

1. Acesse: **https://github.com/SEU_USUARIO/chv_monitor**
2. Você deve ver todos os arquivos do projeto
3. Verifique se existe: `.github/workflows/build.yml`

---

## 🚀 PASSO 6: Executar Compilação

### 6.1. Ativar Actions (primeira vez)

1. No seu repositório, clique na aba **"Actions"** (menu superior)
2. Se aparecer mensagem, clique em:
   **"I understand my workflows, go ahead and enable them"**

### 6.2. Executar Workflow

**Opção A: Automático**
- O workflow executa automaticamente após o push
- Vá em **"Actions"** e veja rodando

**Opção B: Manual**
1. Aba **"Actions"**
2. Clique em **"Build iOS App"**
3. Botão **"Run workflow"** (canto superior direito)
4. Branch: **main**
5. Clique em **"Run workflow"**

---

## ⏳ PASSO 7: Acompanhar Compilação

1. Na aba **"Actions"**, você verá:
   - 🟡 **Amarelo** = Executando
   - ✅ **Verde** = Sucesso
   - ❌ **Vermelho** = Erro

2. Clique no workflow para ver detalhes:
   - Logs de cada etapa
   - Tempo de execução
   - Erros (se houver)

3. Aguarde **5-10 minutos**

---

## 📥 PASSO 8: Baixar Resultado

Quando aparecer ✅ (sucesso):

1. Clique no workflow concluído
2. Role até a seção **"Artifacts"**
3. Clique em **"xcarchive"**
4. O download começará automaticamente
5. Você receberá um arquivo `.zip`

### Extrair o arquivo:

1. Extraia o `.zip`
2. Dentro terá: `chv_monitor.xcarchive`
3. Este é o app compilado!

---

## ⚠️ IMPORTANTE: Limitações

### O que você tem:
✅ App compilado (`.xcarchive`)  
✅ Código testado e funcionando  

### O que você NÃO tem:
❌ Arquivo `.ipa` instalável  
❌ Assinatura digital (certificado)  

### Para instalar no iPhone:

Você precisa de **um destes**:

1. **Mac com Xcode**:
   - Abra o `.xcarchive` no Xcode
   - Exporte como `.ipa`
   - Assine com seu certificado
   - Instale via sideloading

2. **Serviço de assinatura**:
   - Alguns serviços fazem isso por você
   - Mas custam dinheiro

3. **Compilar uma vez localmente**:
   - Use Mac emprestado/virtual
   - Compile e assine
   - Depois só reinstala quando necessário

---

## 🐛 Solução de Problemas

### Erro: "git: command not found"
**Solução**: Instale Git (Passo 3)

### Erro: "remote origin already exists"
**Solução**:
```powershell
git remote remove origin
git remote add origin https://github.com/SEU_USUARIO/chv_monitor.git
```

### Erro: "Authentication failed"
**Solução**: Use Personal Access Token (veja Passo 4.5)

### Erro: "fatal: not a git repository"
**Solução**: Execute `git init` primeiro

### Workflow falha
**Solução**: 
1. Clique no workflow para ver erros
2. Verifique os logs
3. Me avise qual erro apareceu

---

## 📋 Checklist Final

- [ ] Conta GitHub criada
- [ ] Repositório criado
- [ ] Git instalado
- [ ] Código enviado para GitHub
- [ ] Workflow executado
- [ ] Compilação concluída (✅)
- [ ] Arquivo `.xcarchive` baixado

---

## 🎉 Pronto!

Agora você tem o app compilado! 

**Próximo passo**: Para instalar no iPhone, você precisará de um Mac (ou serviço) para fazer a assinatura final e gerar o `.ipa`.

---

## 💡 Dica

O workflow está configurado para executar **automaticamente** sempre que você fizer `git push`. Então, se fizer mudanças no código, basta fazer push e o GitHub compilará novamente!

---

**Precisa de ajuda?** Me avise se tiver alguma dúvida em qualquer passo!

