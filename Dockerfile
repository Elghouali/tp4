# Utilisation d'une image de base Nginx légère (Alpine Linux)
FROM nginx:alpine

# Copie de notre fichier index.html local vers le répertoire par défaut de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Exposition du port 80 (le port par défaut du serveur web Nginx)
EXPOSE 80