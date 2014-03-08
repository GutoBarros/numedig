
cat /Users/sebastianbarfort/git/sausages/pandoc-templates/examples/article-markdown.tex | \
    sed '/\\def\\labelenumi{(\\arabic{enumi})}/d' | \
    sed '/\\itemsep1pt\\parskip0pt\\parsep0pt/d' | \
    sed '/\\item/d' | \
    sed '/\\setcounter{enumi}*/d' | \
    sed -e '/\\begin{enumerate}/,/\\end{enumerate}/{//d;s/[^$]*\$\([^$]*\).*/\1/;i\\\begin{equation}' -e 'a\\\end{equation}' -e '}' > /Users/sebastianbarfort/git/sausages/pandoc-templates/examples/article-markdown.tex

pdflatex /Users/sebastianbarfort/git/sausages/pandoc-templates/examples/article-markdown.tex
