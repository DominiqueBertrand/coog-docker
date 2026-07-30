# 1) Chemins
SRC=/coopengo/GITHUB/coog/modules/coog_core/api.py
DEST=/workspace/coog/modules/coog_core/api.py

# 2) S'assurer que le dossier existe dans le conteneur
docker exec coog-coog-1 mkdir -p /workspace/coog/modules/coog_core/

# 3) Copier le fichier
docker cp "$SRC" coog-coog-1:"$DEST"

# 4) Vérifier côté conteneur
docker exec coog-coog-1 head -n 20 "$DEST"

# 5) (souvent nécessaire) redémarrer le service pour recharger le .py
docker compose restart coog
