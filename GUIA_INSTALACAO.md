# 📱 Guia Completo: Baixar e Instalar o App no iPhone

## 📥 PASSO 1: Baixar o Arquivo Compilado do GitHub

### 1.1. Acessar o GitHub Actions

1. Abra seu navegador e vá para: `https://github.com/SEU_USUARIO/chv_monitor`
2. Clique na aba **"Actions"** (no topo do repositório)
3. Você verá uma lista de workflows executados
4. Clique no workflow mais recente que teve **✅ sucesso** (ícone verde)

### 1.2. Baixar o Artifact

1. Role a página até encontrar a seção **"Artifacts"**
2. Você verá um arquivo chamado **"xcarchive"**
3. Clique em **"xcarchive"** para baixar
4. O download começará automaticamente
5. Você receberá um arquivo `.zip` (exemplo: `xcarchive.zip`)

### 1.3. Extrair o Arquivo

1. Localize o arquivo `.zip` baixado (geralmente na pasta Downloads)
2. Clique com botão direito e selecione **"Extrair Tudo"** (Windows) ou **"Expandir"** (Mac)
3. Dentro você encontrará: `chv_monitor.xcarchive`

---

## 🍎 PASSO 2: Preparar o Ambiente (Mac Necessário)

⚠️ **IMPORTANTE**: Para instalar no iPhone, você precisa de um **Mac com Xcode instalado**.

### 2.1. Requisitos

- ✅ Mac com macOS instalado
- ✅ Xcode instalado (versão 16.0 ou superior)
- ✅ Certificado de Desenvolvedor Apple (gratuito ou pago)
- ✅ iPhone com iOS 18.0 ou superior
- ✅ Cabo USB para conectar iPhone ao Mac

### 2.2. Instalar Xcode (se não tiver)

1. Abra a **App Store** no Mac
2. Procure por **"Xcode"**
3. Clique em **"Obter"** ou **"Instalar"**
4. Aguarde o download (é grande, ~15GB)
5. Após instalar, abra o Xcode uma vez para aceitar os termos

---

## 🔐 PASSO 3: Configurar Certificado de Desenvolvedor

### 3.1. Criar Conta de Desenvolvedor (Gratuita)

1. Abra o Xcode
2. Vá em **Xcode > Settings** (ou **Preferences**)
3. Clique na aba **"Accounts"**
4. Clique no botão **"+"** (adicionar conta)
5. Faça login com seu **Apple ID** (mesmo da App Store)
6. Selecione sua conta e clique em **"Manage Certificates"**
7. Clique no **"+"** e selecione **"Apple Development"**
8. O certificado será criado automaticamente

### 3.2. Verificar Certificado

1. No Xcode, vá em **Xcode > Settings > Accounts**
2. Selecione sua conta Apple
3. Clique em **"Manage Certificates"**
4. Você deve ver um certificado do tipo **"Apple Development"**
5. Se não aparecer, crie um novo (Passo 3.1)

---

## 📦 PASSO 4: Abrir o Arquivo .xcarchive no Xcode

### 4.1. Abrir o Archive

1. Abra o **Xcode**
2. Vá em **File > Open** (ou pressione `Cmd + O`)
3. Navegue até a pasta onde você extraiu o `.xcarchive`
4. Selecione o arquivo **`chv_monitor.xcarchive`**
5. Clique em **"Open"**

### 4.2. Verificar o Archive

1. O Xcode abrirá a janela **"Organizer"**
2. Você verá o app **"chv_monitor"** listado
3. Clique no app para ver os detalhes

---

## 📤 PASSO 5: Exportar como .ipa

### 5.1. Iniciar Exportação

1. Na janela **"Organizer"**, selecione **"chv_monitor"**
2. Clique no botão **"Distribute App"** (no canto direito)
3. Selecione **"Development"** (para instalação em seu próprio dispositivo)
4. Clique em **"Next"**

### 5.2. Selecionar Método de Distribuição

1. Escolha **"Development"** (se não estiver selecionado)
2. Clique em **"Next"**
3. Selecione seu **certificado de desenvolvedor** (criado no Passo 3)
4. Clique em **"Next"**

### 5.3. Escolher Local de Salvamento

1. Escolha onde salvar o arquivo `.ipa`
2. Clique em **"Export"**
3. Aguarde a exportação (pode levar alguns minutos)
4. Você terá um arquivo **`chv_monitor.ipa`**

---

## 📱 PASSO 6: Instalar no iPhone

### Opção A: Via Xcode (Recomendado)

#### 6.1. Conectar iPhone ao Mac

1. Conecte seu iPhone ao Mac usando cabo USB
2. No iPhone, aparecerá uma mensagem: **"Confiar neste computador?"**
3. Toque em **"Confiar"**
4. Digite a senha do iPhone se solicitado

#### 6.2. Instalar via Xcode

1. Abra o **Xcode**
2. Vá em **Window > Devices and Simulators** (ou `Cmd + Shift + 2`)
3. Selecione seu iPhone na lista à esquerda
4. Clique na aba **"Installed Apps"**
5. Clique no botão **"+"** (adicionar app)
6. Navegue até o arquivo **`chv_monitor.ipa`**
7. Selecione e clique em **"Open"**
8. O app será instalado no iPhone

### Opção B: Via Sideloading (AltStore/Sideloadly)

#### 6.1. Usar AltStore (Recomendado)

1. **Baixar AltStore**:
   - Acesse: https://altstore.io
   - Baixe o **AltServer** para Mac
   - Instale o AltServer

2. **Instalar AltStore no iPhone**:
   - Abra o AltServer no Mac
   - Conecte o iPhone ao Mac
   - Clique no ícone do AltServer na barra de menu
   - Selecione **"Install AltStore"** > Seu iPhone
   - Siga as instruções na tela

3. **Instalar o App**:
   - Abra o AltStore no iPhone
   - Toque na aba **"My Apps"**
   - Toque no botão **"+"** (canto superior direito)
   - Selecione o arquivo **`chv_monitor.ipa`**
   - Aguarde a instalação

#### 6.2. Usar Sideloadly (Alternativa)

1. **Baixar Sideloadly**:
   - Acesse: https://sideloadly.io
   - Baixe e instale o Sideloadly

2. **Instalar o App**:
   - Abra o Sideloadly
   - Conecte seu iPhone ao Mac
   - Arraste o arquivo **`chv_monitor.ipa`** para o Sideloadly
   - Faça login com seu Apple ID
   - Clique em **"Start"**
   - Aguarde a instalação

---

## ⚙️ PASSO 7: Configurar Permissões no iPhone

### 7.1. Permitir App Não Verificado

1. No iPhone, vá em **Configurações > Geral > Gerenciamento de VPN e Dispositivo**
2. Procure por seu **Apple ID** ou **certificado de desenvolvedor**
3. Toque nele
4. Toque em **"Confiar em [Seu Nome]"**
5. Confirme na mensagem de confirmação

### 7.2. Permitir Acesso ao Microfone

1. No iPhone, vá em **Configurações > Privacidade e Segurança > Microfone**
2. Procure por **"chv_monitor"**
3. Ative o toggle para permitir acesso ao microfone

### 7.3. Configurar Background Modes

1. No iPhone, vá em **Configurações > chv_monitor**
2. Ative **"Ativar Gravação"** se disponível
3. Verifique outras configurações do app

---

## ✅ PASSO 8: Verificar Instalação

### 8.1. Encontrar o App

1. No iPhone, procure pelo app **"chv_monitor"** na tela inicial
2. O ícone deve aparecer normalmente

### 8.2. Testar o App

1. Toque no app para abrir
2. Se aparecer uma mensagem sobre **"App Não Verificado"**:
   - Vá em **Configurações > Geral > Gerenciamento de VPN e Dispositivo**
   - Confie no desenvolvedor (Passo 7.1)
3. Teste a funcionalidade de gravação

---

## 🔄 PASSO 9: Renovar Certificado (Quando Necessário)

⚠️ **IMPORTANTE**: Certificados gratuitos expiram após **7 dias**.

### 9.1. Renovar via Xcode

1. Abra o Xcode
2. Vá em **Xcode > Settings > Accounts**
3. Selecione sua conta
4. Clique em **"Download Manual Profiles"**
5. O certificado será renovado

### 9.2. Reinstalar App (Se Expirar)

Se o app parar de funcionar após 7 dias:

1. Siga os Passos 4-6 novamente
2. Exporte um novo `.ipa` com certificado renovado
3. Reinstale no iPhone

---

## 🐛 Solução de Problemas

### Erro: "App não pode ser instalado"

**Solução**:
1. Verifique se o certificado está válido
2. Certifique-se de que confiou no desenvolvedor (Passo 7.1)
3. Tente reinstalar o app

### Erro: "Certificado expirado"

**Solução**:
1. Renove o certificado (Passo 9)
2. Exporte um novo `.ipa`
3. Reinstale o app

### Erro: "Microfone não funciona"

**Solução**:
1. Vá em **Configurações > Privacidade > Microfone**
2. Ative a permissão para **"chv_monitor"**
3. Reinicie o app

### Erro: "App não aparece na tela inicial"

**Solução**:
1. Verifique se a instalação foi concluída
2. Procure em todas as telas do iPhone
3. Use a busca do iOS para encontrar "chv_monitor"

---

## 📋 Checklist Final

- [ ] Arquivo `.xcarchive` baixado do GitHub
- [ ] Xcode instalado no Mac
- [ ] Certificado de desenvolvedor criado
- [ ] Arquivo `.ipa` exportado
- [ ] iPhone conectado ao Mac
- [ ] App instalado no iPhone
- [ ] Permissões configuradas
- [ ] App funcionando corretamente

---

## 💡 Dicas Importantes

1. **Certificado Gratuito**: Válido por 7 dias, depois precisa renovar
2. **Certificado Pago**: Válido por 1 ano (requer Apple Developer Program - $99/ano)
3. **Backup**: Sempre mantenha uma cópia do arquivo `.ipa` exportado
4. **Atualizações**: Quando fizer mudanças no código, recompile e reinstale

---

## 🎉 Pronto!

Agora você tem o app instalado no seu iPhone! 

**Precisa de ajuda?** Me avise se tiver algum problema durante a instalação!

