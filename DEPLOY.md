# Servidor de legendas — celular / tablet

O app só precisa de uma URL HTTPS (ou HTTP na mesma Wi‑Fi).

---

## Opção 0 — Mais fácil (sem nuvem): PC + Wi‑Fi

Se o celular e o PC estão na **mesma Wi‑Fi**:

1. No PC: `caption-server\start.bat` (deixe aberto)
2. Descubra o IP do PC:
   ```bat
   ipconfig
   ```
   Ex.: `192.168.0.15`
3. No app → **Ajustes** → URL do servidor:
   ```
   http://192.168.0.15:8765
   ```
4. Firewall do Windows: permitir Python na rede privada (se pedir)
5. Teste no Chrome do celular: `http://192.168.0.15:8765/health`

**Limite:** só funciona em casa, com o PC ligado.

---

## Opção 1 — Nuvem simples: **Render** (recomendado)

1. Crie conta grátis: https://render.com (GitHub ou e-mail)
2. Suba a pasta `caption-server` para um repositório GitHub  
   (ou use “Deploy from Git” se já tiver o projeto no Git)
3. No Render:
   - **New** → **Web Service**
   - Runtime: **Python**
   - Build: `pip install -r requirements.txt`
   - Start: `python app.py`
   - Plano: **Free**
4. Depois do deploy, a URL fica tipo:
   ```
   https://linguaplay-captions-xxxx.onrender.com
   ```
5. Teste: `https://....onrender.com/health`
6. No app → Ajustes → cole essa URL (sem barra no final)

**Obs. no plano free:** o serviço “dorme” após ~15 min sem uso.  
O 1º request pode demorar 30–60 s; os próximos ficam rápidos.

---

## Opção 2 — **Railway**

1. https://railway.app → login
2. New Project → Deploy from GitHub (pasta caption-server)
3. Railway detecta Dockerfile ou Python
4. Gera URL pública → colar no app

---

## Opção 3 — **Fly.io** (Docker)

```bat
cd caption-server
fly launch
fly deploy
```

Precisa conta Fly + CLI instalada.

---

## O que eu (Grok) **não** consigo fazer sozinho

- Abrir conta no seu nome  
- Pagar / vincular cartão  
- Fazer login no Render/Railway por você  

**Consigo:** deixar o código pronto, Dockerfile, e te guiar passo a passo  
quando você tiver a conta + a URL.

---

## No app Flutter

**Ajustes → Servidor de legendas**

| Onde | URL exemplo |
|------|-------------|
| Emulador + PC | `http://127.0.0.1:8765` (+ `adb reverse`) |
| Celular mesma Wi‑Fi | `http://192.168.x.x:8765` |
| Nuvem | `https://seu-servico.onrender.com` |

Ligue **“Usar backend de legendas”**.

---

## Checklist celular

1. Servidor no ar (PC ou nuvem)  
2. `/health` abre no browser do celular  
3. URL certa em Ajustes  
4. APK instalado (`adb install` ou copiar o APK)
