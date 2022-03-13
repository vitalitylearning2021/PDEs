# PDEs

## Equazione di Laplace: Iterazioni di Jacobi

Consideriamo l'equazione di Laplace

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=\nabla^2T(x,y)=0." id="laplaceEquation">       [1]
</p>

in cui l'incognita <img src="https://render.githubusercontent.com/render/math?math=T(x,y)"> è una funzione di due variabili spaziali <img src="https://render.githubusercontent.com/render/math?math=(x,y)">. Per una risoluzione univoca, abbiamo bisogno di condizioni al contorno. Ricordando di essere maggiormente interessati ad illustrare la tecnica programmativa di risoluzione di PDEs, non ci preoccuperemo di questo problema e fisseremo queste condizioni in seguito. L'equazione di Laplace [\[1\]](#laplaceEquation) modella lo steady state di una funzione, definita in uno dominio two-dimensional, che rappresenta una particolare grandezza fisica. In casi pratici, <img src="https://render.githubusercontent.com/render/math?math=T(x,y)"> può rappresentare il calore, e l'equazione [\[1\]](#laplaceEquation) può essere usata per studiare come il calore si distribuisce in un certo dominio, fissate che siano le condizioni al contorno

Se espandiamo l'operatore Laplaciano <img src="https://render.githubusercontent.com/render/math?math=\nabla^2">, otteniamo

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=\frac{\partial^2 T(x,y)}{\partial x^2} %2B \frac{\partial^2 T(x,y)}{\partial y^2}=0." id="laplaceEquationExpanded">       [2]
</p>

Introduciamo a questo punto un grigliato di calcolo di <img src="https://render.githubusercontent.com/render/math?math=M\times N"> punti <img src="https://render.githubusercontent.com/render/math?math=(x_m, y_n)">, con <img src="https://render.githubusercontent.com/render/math?math=x_m=m \Delta x"> ed <img src="https://render.githubusercontent.com/render/math?math=y_n=n \Delta y">, con <img src="https://render.githubusercontent.com/render/math?math=m=0,\ldots,M-1"> ed <img src="https://render.githubusercontent.com/render/math?math=n=0,\ldots,N-1">. Infine, indichiamo con <img src="https://render.githubusercontent.com/render/math?math=T_{mn}"> i valori dell'incognita nei punti del grigliato introdotto, ossia <img src="https://render.githubusercontent.com/render/math?math=T(x_m,y_n)=T_{m,n}">.

Approssimando le derivate contenute nella [\[2\]](#laplaceEquationExpanded) con differenze finite e assumendo <img src="https://render.githubusercontent.com/render/math?math=\Delta x=\Delta y = 1">, si ha il seguente sistema di equazioni lineari algebriche

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=T_{m %2B 1,n}^{k}-2T_{m,n}^{k} %2B T_{m-1,n}^{k} %2B T_{m,n %2B 1}^{k}-2T_{m,n}^{k} %2B T_{m,n-1}^{k}." id="laplaceEquationDiscretized">       [3]
</p>

Assumendo <img src="https://render.githubusercontent.com/render/math?math=\Delta t=1"> e <img src="https://render.githubusercontent.com/render/math?math=\Delta x=\Delta y=1">,  l'equazione [\[3\]](#heatEquationDiscretized) definisce la seguente formula di aggiornamento:

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=\frac{T_{m,n}^{k %2B 1}-T_{m,n}^{k}}{\Delta t}=\frac{T_{m %2B 1,n}^{k}-2T_{m,n}^{k} %2B T_{m-1,n}^{k}}{\Delta x^2} %2B \frac{T_{m,n %2B 1}^{k}-2T_{m,n}^{k} %2B T_{m,n-1}^{k}}{\Delta y^2}." id="heatEquationUpdate">       [4]
</p>

## Equazione del calore

Consideriamo l'equazione differenziale alle derivate parziali

<p align="center">
  <img src="https://render.githubusercontent.com/render/math?math=\frac{\partial T(x,y,t)}{\partial t}=\nabla^2T(x,y,t)." id="heatEquation">       [1]
</p>

in cui l'incognita <img src="https://render.githubusercontent.com/render/math?math=T(x,y,t)"> è una funzione di due variabili spaziali <img src="https://render.githubusercontent.com/render/math?math=(x,y)"> e di una variabile temporale <img src="https://render.githubusercontent.com/render/math?math=t">. Per una risoluzione univoca, abbiamo bisogno di una condizione iniziale e di condizioni al contorno. Ricordando di essere maggiormente interessati ad illustrare la tecnica programmativa di risoluzione di PDEs, non ci preoccuperemo di questo problema e fisseremo queste condizioni in seguito. Notiamo solo qui che, essendo capaci di risolvere l'equazione [\[1\]](#heatEquation), saremmo capaci di modellare la diffusione del calore in un determinato dominio bidimensionale.

https://www.dais.unive.it/~calpar/New_HPC_course/AA16-17/Project-Jacobi.pdf

https://skill-lync.com/student-projects/Steady-and-Transient-analysis-of-2D-heat-equation-with-implicit-and-explicit-methods-using-Jacobi-Gauss-Seidel-and-SOR-iterative-solvers-in-Matlab-15061

https://www.dsi.unive.it/~calpar/6_Progetto-02-03.pdf

