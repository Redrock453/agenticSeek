#!/bin/bash
# Скрипт быстрого запуска agenticSeek

echo "🚀 Запуск agenticSeek..."

# Остановка старых процессов
pkill -f "python.*api.py" 2>/dev/null
pkill -f "npm.*start" 2>/dev/null
sleep 2

# Запуск backend
cd /workspaces/agenticSeek
.venv/bin/python api.py > backend.log 2>&1 &
BACKEND_PID=$!
echo "✅ Backend запущен (PID: $BACKEND_PID)"

# Запуск frontend
cd /workspaces/agenticSeek/frontend/agentic-seek-front
npm start > frontend.log 2>&1 &
FRONTEND_PID=$!
echo "✅ Frontend запущен (PID: $FRONTEND_PID)"

echo ""
echo "📡 Backend: http://localhost:7777"
echo "🌐 Frontend: http://localhost:3000"
echo ""
echo "Для остановки: pkill -f 'api.py|npm start'"
