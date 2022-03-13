# PDEs

## Equazione del calore

Consideriamo l'equazione differenziale alle derivate parziali

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=\frac{\partial T(x,y,t)}{\partial t}=\nabla^2T(x,y,t)." id="heatEquation">       [1]
</p>

in cui l'incognita <img src="https://render.githubusercontent.com/render/math?math=T(x,y,t)"> è una funzione di due variabili spaziali <img src="https://render.githubusercontent.com/render/math?math=(x,y)"> e di una variabile temporale <img src="https://render.githubusercontent.com/render/math?math=t">. Per una risoluzione univoca, abbiamo bisogno di una condizione iniziale e di condizioni al contorno. Ricordando di essere maggiormente interessati ad illustrare la tecnica programmativa di risoluzione di PDEs, non ci preoccuperemo di questo problema e fisseremo queste condizioni in seguito. Notiamo solo qui che, essendo capaci di risolvere l'equazione [\[1\]](#heatEquation), saremmo capaci di modellare la diffusione del calore in un determinato dominio bidimensionale.

Se espandiamo l'operatore Laplaciano <img src="https://render.githubusercontent.com/render/math?math=\nabla^2">, otteniamo

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=\frac{\partial T(x,y)}{\partial t}=\frac{\partial^2 T(x,y)}{\partial x^2} %2B \frac{\partial^2 T(x,y)}{\partial y^2}." id="heatEquationExpanded">       [2]
</p>

Introduciamo a questo punto un grigliato di calcolo di <img src="https://render.githubusercontent.com/render/math?math=M\times N"> punti <img src="https://render.githubusercontent.com/render/math?math=(x_m, y_n)">, con <img src="https://render.githubusercontent.com/render/math?math=x_m=m \Delta x"> ed <img src="https://render.githubusercontent.com/render/math?math=y_n=n \Delta y">, con <img src="https://render.githubusercontent.com/render/math?math=m=0,\ldots,M-1"> ed <img src="https://render.githubusercontent.com/render/math?math=n=0,\ldots,N-1">. Introduciamo infine un grigliato temporale di <img src="https://render.githubusercontent.com/render/math?math=K"> punti <img src="https://render.githubusercontent.com/render/math?math=t_k">, <img src="https://render.githubusercontent.com/render/math?math=k=0,\ldots,K-1">. Infine, indichiamo con <img src="https://render.githubusercontent.com/render/math?math=T_{mn}^k"> i valori dell'incognita nei punti del grigliato introdotto, ossia <img src="https://render.githubusercontent.com/render/math?math=T(x_m,y_n,t_k)=T_{m,n}^k">.

Approssimando le derivate contenute nella [\[2\]](#heatEquationExpanded) con differenze finite, si ha

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=\frac{T_{m,n}^k}{\Delta t}." id="heatEquationDiscretized">       [3]
</p>


https://www.dais.unive.it/~calpar/New_HPC_course/AA16-17/Project-Jacobi.pdf

https://skill-lync.com/student-projects/Steady-and-Transient-analysis-of-2D-heat-equation-with-implicit-and-explicit-methods-using-Jacobi-Gauss-Seidel-and-SOR-iterative-solvers-in-Matlab-15061

https://www.dsi.unive.it/~calpar/6_Progetto-02-03.pdf

