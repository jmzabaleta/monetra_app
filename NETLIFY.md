# Deploy en Netlify

Este repo queda listo para desplegar Flutter Web en Netlify.

## Configuracion

Netlify toma la configuracion desde `netlify.toml`:

- Build command: `bash scripts/netlify_build.sh`
- Publish directory: `build/web`
- Redirect SPA: `/*` -> `/index.html`

El script instala Flutter `stable` si Netlify no lo tiene disponible, ejecuta `flutter pub get`, regenera codigo con `build_runner` y compila web en release.

## Pasos

1. Sube este repo a GitHub, GitLab o Bitbucket.
2. En Netlify, crea un sitio nuevo con **Add new site > Import an existing project**.
3. Selecciona el repo.
4. Deja que Netlify detecte `netlify.toml`.
5. Publica el deploy.

Si necesitas publicar la app bajo una subruta, cambia `FLUTTER_BASE_HREF` en `netlify.toml` por esa ruta, por ejemplo `/monetra/`.
