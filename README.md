# Modelos y Simulación

Materia de Posgrado en Sistemas de Control
Facultad de Ingeniería del Ejército

## Sitio web

Publicado con Quarto en GitHub Pages:
<https://gianfranco-s.github.io/modelado-y-simulacion/>

- [Listado consolidado de actividades](https://gianfranco-s.github.io/modelado-y-simulacion/actividades.html)

## Estructura

| Ruta              | Contenido                                                        |
|-------------------|-----------------------------------------------------------------|
| `index.qmd`       | Portada del sitio                                                |
| `actividades.qmd` | Todas las actividades en una sola página (enunciados + enlaces)  |
| `clase_NN/`       | Apunte de cada clase (`.qmd`), scripts `.m` y figuras            |
| `_actividades/`   | Enunciado de cada actividad, en un único archivo reutilizable    |
| `_includes/`      | Fragmentos compartidos (p. ej. listado de un script `.m`)        |
| `notas-de-clase/` | PDFs de notas de clase                                           |

Cada enunciado de actividad vive una sola vez en `_actividades/` y se incluye
tanto en la página de su clase como en `actividades.qmd` mediante
`{{< include >}}`.

## Desarrollo

Requiere [Quarto](https://quarto.org/docs/get-started/) y
[uv](https://docs.astral.sh/uv/).

```bash
uv sync                 # dependencias de Python (jupyter, numpy, matplotlib, scipy...)
uv run quarto preview   # vista previa con recarga automática
uv run quarto render    # genera el sitio completo en _site/
```

Para exportar a PDF hacen falta paquetes de LaTeX:

```bash
sudo apt install -y \
    texlive-xetex \
    texlive-latex-extra \
    texlive-fonts-recommended \
    librsvg2-bin
```

## Publicación

El workflow [`.github/workflows/publish.yml`](.github/workflows/publish.yml)
renderiza el sitio y lo despliega en GitHub Pages en cada push a `main`.
Requiere configurar una única vez, en **Settings → Pages**, la fuente
**GitHub Actions**.

## Documentación

- <https://quarto.org/docs/get-started/authoring/vscode.html>
- <https://quarto.org/docs/authoring/tables.html>

## Documentos de la cátedra

- [Cronograma 2025](https://docs.google.com/spreadsheets/d/1g1H_kBzkO-_x6UO8inxDsTYmaAV_soVcEZjy99uy45g/edit?pli=1&gid=0#gid=0)
