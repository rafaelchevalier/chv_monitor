# Guia de Instalação Detalhado - chv_monitor

## 📱 Pré-requisitos

1. **Mac com macOS** (necessário para Xcode)
2. **Xcode 16.0 ou superior**
3. **Conta de Desenvolvedor Apple** (gratuita ou paga)
4. **Dispositivo iOS 18.0+** para testar

## 🔧 Passo a Passo

### 1. Preparar o Ambiente

1. Abra o **Terminal** no Mac
2. Navegue até a pasta do projeto:
```bash
cd "caminho/para/chv_monitor"
```

### 2. Abrir no Xcode

1. Abra o **Xcode**
2. Selecione `File > Open`
3. Navegue até a pasta `chv_monitor`
4. Abra o arquivo `chv_monitor.xcodeproj`

### 3. Configurar o Projeto

#### 3.1. Configurar Signing

1. No navegador de projetos (lado esquerdo), clique em **chv_monitor** (ícone azul no topo)
2. Selecione o **target** `chv_monitor`
3. Vá para a aba **"Signing & Capabilities"**
4. Marque **"Automatically manage signing"**
5. Selecione seu **Team** (sua conta de desenvolvedor Apple)
6. O Xcode gerará automaticamente um Bundle Identifier único

#### 3.2. Adicionar Background Modes

1. Ainda na aba **"Signing & Capabilities"**
2. Clique no botão **"+ Capability"** (canto superior esquerdo)
3. Procure por **"Background Modes"**
4. Adicione a capability
5. Marque a opção **"Audio, AirPlay, and Picture in Picture"**

#### 3.3. Verificar Deployment Target

1. Na aba **"General"**
2. Verifique se **"Minimum Deployments"** está configurado para **iOS 18.0**

### 4. Conectar o Dispositivo

1. Conecte seu iPhone/iPad via cabo USB
2. No dispositivo, vá em **Configurações > Geral > Gerenciamento de VPN e Dispositivo**
3. Toque em **"Confiar"** no computador (se solicitado)
4. No Xcode, no menu de seleção de dispositivos (topo), selecione seu dispositivo

### 5. Compilar e Instalar

1. Pressione **⌘ + R** (Cmd + R) ou clique em **▶️ Run**
2. O Xcode compilará o projeto
3. Na primeira vez, você precisará:
   - Autorizar o desenvolvedor no dispositivo (Configurações > Geral > Gerenciamento de VPN e Dispositivo)
   - Confiar no certificado

### 6. Configurar Permissões no Dispositivo

1. Após a instalação, abra o app **chv_monitor** no dispositivo
2. Quando solicitado, conceda permissão de **Microfone**
3. Vá em **Configurações > chv_monitor**
4. Ative o toggle **"Ativar Gravação"**

## 🚀 Instalação via Sideloading (Sem Xcode)

### Opção 1: AltStore

1. Instale o **AltStore** no Mac: https://altstore.io
2. No Xcode, compile o projeto: **Product > Archive**
3. Exporte o `.ipa`: **Distribute App > Development**
4. Use o AltStore para instalar no dispositivo

### Opção 2: Sideloadly

1. Baixe o **Sideloadly**: https://sideloadly.io
2. Compile e exporte o `.ipa` no Xcode
3. Abra o Sideloadly
4. Arraste o arquivo `.ipa`
5. Conecte o dispositivo e instale

### Opção 3: 3uTools

1. Baixe o **3uTools**: https://www.3u.com
2. Compile e exporte o `.ipa` no Xcode
3. Use o 3uTools para instalar

## ⚙️ Verificação Pós-Instalação

### Verificar se está funcionando:

1. **Ative a gravação** nas Configurações
2. **Aguarde alguns segundos**
3. **Feche o app** (não force o fechamento, apenas volte à tela inicial)
4. **Aguarde 1-2 minutos**
5. **Reabra o app** e verifique se ainda está gravando

### Verificar arquivos gravados:

1. No Xcode: **Window > Devices and Simulators**
2. Selecione seu dispositivo
3. Selecione o app **chv_monitor**
4. Clique em **"Download Container"**
5. Navegue até: `App Data/Documents/chv_audios/`
6. Você deve ver arquivos `.m4a` com o formato `chv_YYYYMMDD_HH:mm:ss_HH:mm:ss.m4a`

## 🐛 Problemas Comuns

### Erro: "No signing certificate found"
- **Solução**: Configure seu Team nas configurações de Signing

### Erro: "App installation failed"
- **Solução**: Verifique se o dispositivo está confiando no desenvolvedor (Configurações > Geral > Gerenciamento de VPN e Dispositivo)

### Gravação não funciona em background
- **Solução**: 
  - Verifique se Background Modes está configurado
  - Certifique-se de que a permissão de microfone foi concedida
  - iOS pode limitar apps em background - abra o app periodicamente

### App não aparece nas Configurações
- **Solução**: 
  - Certifique-se de que o Settings.bundle está incluído no projeto
  - Reinstale o app
  - Reinicie o dispositivo

## 📝 Notas Importantes

- **Certificados gratuitos** expiram após 7 dias
- **Certificados pagos** duram 1 ano
- Apps instalados via sideloading precisam ser reinstalados quando o certificado expira
- O app pode ser suspenso pelo iOS após período de inatividade em background

## 🔒 Segurança

- Os arquivos de áudio são salvos apenas localmente no dispositivo
- Não há transmissão de dados para servidores externos
- O app não aparece na busca do Spotlight (conforme configurado)

