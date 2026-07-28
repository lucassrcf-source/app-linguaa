@echo off
cd /d "%~dp0"
echo Instalando dependencias (se precisar)...
python -m pip install -r requirements.txt -q
echo.
echo Subindo servidor em http://127.0.0.1:8765
echo Deixe esta janela ABERTA.
echo.
python app.py
pause
