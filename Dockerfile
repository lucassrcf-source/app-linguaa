FROM python:3.12-slim

WORKDIR /app

# yt-dlp se beneficia de certs atualizados
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

ENV PORT=8765
EXPOSE 8765

# Cache em /tmp na nuvem (efêmero, ok)
ENV HOME=/tmp

CMD ["python", "app.py"]
