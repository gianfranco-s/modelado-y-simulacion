
Installation
sudo apt install texlive-xetex texlive-latex-extra texlive-fonts-recommended  # Minimal PED for rendering
sudo apt-get update && sudo apt-get install -y librsvg2-bin  # to convert svg files

quarto render clase_01/clase_01.qmd --to html --output-dir ../html/
quarto render clase_01/clase_01.qmd --to pdf --output-dir ../pdf/
https://quarto.org/docs/get-started/authoring/vscode.html
https://quarto.org/docs/authoring/tables.html