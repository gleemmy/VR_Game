#!/bin/bash
# Launcher for the VR project web server.
# Reads-only: serves the folder over http:// so the browser can load the
# .glb / .jpg / .mp3 assets. Does not modify anything inside VRproject.

cd "/Users/gulshanmirzazada/Documents/VRproject" || {
  echo "Could not find /Users/gulshanmirzazada/Documents/VRproject"
  echo "Press any key to close."
  read -n 1
  exit 1
}

PORT=8000
URL="http://localhost:$PORT/vggame.html"

echo "Serving VRproject at $URL"
echo "Opening in browser... (leave this window open while playing)"
echo "Press Ctrl+C to stop the server."

# Open the browser once the server has had a moment to start.
( sleep 1; open "$URL" ) &

python3 -m http.server "$PORT"
