# Servidor de legendas (Python) — modo sério local

O app Flutter pede legendas **aqui**. O servidor baixa do YouTube **uma vez** e guarda em `cache/`.

## Rodar (Windows)

```bat
cd C:\Users\Lucas\Documents\estudo-app\caption-server
pip install -r requirements.txt
python app.py
```

Deixe a janela aberta. Teste no browser:

- http://127.0.0.1:8765/health  
- http://127.0.0.1:8765/captions?videoId=tqJQkr-RNEk&lang=en  
- http://127.0.0.1:8765/captions/list?videoId=tqJQkr-RNEk  

## App no emulador Android

O app usa: `http://10.0.2.2:8765`  
(`10.0.2.2` = o “localhost” do seu PC visto de dentro do emulador)

## Celular físico na mesma Wi‑Fi

No app (Ajustes) ou no código, troque para o IP do PC, ex.:  
`http://192.168.0.10:8765`
