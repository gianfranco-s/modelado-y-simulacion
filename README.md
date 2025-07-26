
Installation
https://quarto.org/docs/get-started/
sudo apt install -y texlive-xetex texlive-latex-extra texlive-fonts-recommended librsvg2-bin  # Minimal PED for rendering

quarto render clase_01/clase_01.qmd --to html --output-dir ../html/
quarto render clase_01/clase_01.qmd --to pdf --output-dir ../pdf/
https://quarto.org/docs/get-started/authoring/vscode.html
https://quarto.org/docs/authoring/tables.html