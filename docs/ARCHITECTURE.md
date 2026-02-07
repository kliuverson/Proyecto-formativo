# Arquitectura propuesta — Ferremateriales

Estructura basada en "feature-first" + Capas (data/domain/presentation) y BLoC para gestión de estado.

- `lib/src/features/<feature>/data` — Data sources, modelos y repositorios implementados.
- `lib/src/features/<feature>/domain` — Entidades, contratos (repositorios), usecases.
- `lib/src/features/<feature>/presentation` — BLoCs, páginas, widgets específicos.
- `lib/src/core` — Errores, utilidades, constantes.
- `lib/src/injection_container.dart` — Registro de dependencias con GetIt.
- `lib/src/app.dart` — Inicialización de MaterialApp y rutas.

Buenas prácticas para evitar conflictos:
- Feature-first: cada desarrollador trabaja por feature para minimizar solapamientos.
- Nombres de archivos y clases consistentes: `product_bloc.dart`, `product_event.dart`, `product_state.dart`.
- Pull requests pequeños por feature o sub-tarea.
- Revisiones obligatorias antes de merge.
