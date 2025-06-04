FROM python:3.11-slim

# Установить git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Клонировать проект
RUN git clone https://github.com/vsuh/tst-incl.py.git /app

WORKDIR /app

# Установить зависимости, если есть requirements.txt
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Запустить run.py
CMD ["python", "run.py"]