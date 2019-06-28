# Image starten (ohne dynamische Ports und mit)
docker run -d -p 1521:1521 -p 81:81 --name=h21 h2
docker run -d -P --name=h2 h2

# Laufenden Container betreten
winpty docker exec -it a6f ash

# Image bauen
docker build --force-rm=true --no-cache=true -t=h2 .

# Image starten und bestehenden Entrypoint ueberschreiben
winpty docker run -it --entrypoint sh h2

# Container Port ausfindig machen
docker port h2 22

# Datei in den laufenden Container kopieren
scp -P 32773 befehle.txt root@localhost:/opt/h2-data

# Via ssh mit dem Container verbinden
ssh root@localhost -p 32773