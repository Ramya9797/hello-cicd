FROM python:3.11

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health')"

CMD ["uvicorn","app.main:app","--host","0.0.0.0","--port","8000"]