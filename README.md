# PDEs

## Equazione del calore

Consideriamo l'equazione differenziale alle derivate parziali

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=\frac{\partial T(x,y)}{\partial t}=\nabla^2T(x,y)." id="heatEquation">       [1]
</p>

in cui l'incognita <img src="https://render.githubusercontent.com/render/math?math=T(x,y)"> è una funzione di due variabili reali. Per una risoluzione univoca, abbiamo bisogno di una condizione iniziale e di condizioni al contorno. Ricordando di essere maggiormente interessati ad illustrare la tecnica programmativa di risoluzione di PDEs, non ci preoccuperemo di questo problema e fisseremo queste condizioni in seguito. Notiamo solo qui che, essendo capaci di risolvere l'equazione [\[1\]](#nearestNeighborInterpolatingFunction), saremmo capaci di modellare la diffusione del calore in un determinato dominio bidimensionale.

Se espandiamo l'operatore Laplaciano <img src="https://render.githubusercontent.com/render/math?math=\nabla^2">, otteniamo

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=\frac{\partial T(x,y)}{\partial t}=\frac{\partial^2 T(x,y)}{\partial x^2}+\frac{\partial^2 T(x,y)}{\partial y^2}." id="heatEquation">       [1]
</p>


https://www.dais.unive.it/~calpar/New_HPC_course/AA16-17/Project-Jacobi.pdf

https://skill-lync.com/student-projects/Steady-and-Transient-analysis-of-2D-heat-equation-with-implicit-and-explicit-methods-using-Jacobi-Gauss-Seidel-and-SOR-iterative-solvers-in-Matlab-15061

https://www.dsi.unive.it/~calpar/6_Progetto-02-03.pdf

