import numpy as np
import matplotlib.pyplot as plt
from scipy import interpolate

# define x e y como exemplo de valores.
x = np.arange(0, 2*np.pi+np.pi/4, 2*np.pi/8)
y = np.sin(x)

# splrep encontra a representacao spline de uma curva em um plano bidimensional sendo x e y os componentes da curva.
# essa funcao retorna uma tupla (t,c,k), sendo "t" os pontos de controle, "c" os coeficientes e "k" a ordem da spline.
tck = interpolate.splrep(x, y, s=0)

# cria um arranjo contendo uma sequencia de valores de 0 ate 2pi espacados de pi/50
xnew = np.arange(0, 2*np.pi, np.pi/50)

# dado o array de pontos, avalia o valor da suavidade polinomial. Retorna para ynew um array de valores representando a funcao de spline avaliada nos pontos de xnew.
ynew = interpolate.splev(xnew, tck, der=0)

# plota o grafico da spline cubica.
plt.figure()
plt.plot(x, y, 'x', xnew, ynew, xnew, np.sin(xnew), x, y, 'b')
plt.legend(['Linear', 'Cubic Spline', 'True'])
plt.axis([-0.05, 6.33, -1.05, 1.05])
plt.title('Cubic-spline interpolation')
plt.show()

# igual ao ynew, mas dessa vez eh a derivada da spline.
yder = interpolate.splev(xnew, tck, der=1)

# plota o grafico da derivada da spline.
plt.figure()
plt.plot(xnew, yder, xnew, np.cos(xnew),'--')
plt.legend(['Cubic Spline', 'True'])
plt.axis([-0.05, 6.33, -1.05, 1.05])
plt.title('Derivative estimation from spline')
plt.show()