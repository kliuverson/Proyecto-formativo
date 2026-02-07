Guía rápida para colaborar

- Ramas:
  - `main` — rama protegida, siempre pasar CI.
  - `develop` — integración diaria.
  - `feature/<usuario>/<feature-name>` — ramas para features.

- Commits:
  - Mensajes claros: `feat(products): add product model`
  - Hacer PRs pequeños.

- Conflictos:
  - Rebase sobre `develop` antes de abrir PR.
  - Evitar tocar archivos globales (ej. `pubspec.yaml`) sin coordinación.

- Estilo:
  - Usar `dart format` antes de push.
  - Seguir convenciones de nombres: carpetas por feature y archivos en minúsculas con guiones bajos.

- Estado (BLoC):
  - Cada feature contiene su propio BLoC y tests.
  - Evitar BLoCs globales grandes; preferir BLoC por subfeature si es necesario.
