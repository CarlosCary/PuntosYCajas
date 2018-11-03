  var canvas = document.getElementById('dotCanvas');
  var context = canvas.getContext('2d');
  
  let primerPunto = 0;
  var vw = 400;
  let dotPostionX;
  let dotPostionY;
  let dotPostionX2;
  let dotPostionY2;
  var vh = 400;

  const colorsHash = {};

  // grid
  function dibujarRejilla(){

    var anchoCelda = vw/4;
    var altoCelda = vh/4;

    // vertical lines
    for (var x = 5; x <= vw+5; x += anchoCelda) {
        context.moveTo(x, 0); // x, y
        context.lineTo(x, vh);
    }
    
    // horizontal lines
    for (var y = 5; y <= vh+5; y += altoCelda) {
        context.moveTo(0, y); // x, y
        context.lineTo(vw, y);
    }
  
    context.strokeStyle = "#FF0000";
    context.stroke();
  }
  // drawGrid();
  
  // dots
  function drawDots() {
    var r = 10,
        cw = vw/4,
        ch = vh/4;
    
    for (var x = 0; x <= vw; x+=cw) {
      for (var y = 0; y <= vh; y+=ch) {
          context.fillStyle = '#000000';   
          context.fillRect(x,y,r,r);
        }
    }
  }
  function prueba() {
      canvas.addEventListener("click",
      function(event) {
        calcularCoordernadaPuntoMasCercano(event.offsetX, event.offsetY);
      }
      );
  }
  function calcularCoordernadaPuntoMasCercano(posX, posY){
    let x = 5;
    let y = 5;

    if(!primerPunto) {
        for(let i = 100; i <= vw + 100; i += vw/4) {  

            if(posX < i) {
                dotPostionX = x;
                break;
            }
            x+= 100;
        }
        for(let i = 100; i <= vw + 100; i += vw/4) {
            if(posY < i) {
            dotPostionY = y;
            break;
            }
            y+= 100;
        }
        primerPunto = 1;
    }
    else {
        x = 105;
        y = 105;
        for(let i = 50; i <= vw + 100; i += vw/4) {  
            if(posX > i) {
                dotPostionX2 = x;
                break;
            }
            x+= 100;
        }
        for(let i = 50; i <= vw + 100; i += vw/4) {
            if(posY > i) {
            dotPostionY2 = y;
            break;
            }
            y+= 100;
        }
        primerPunto = 0;
        dibujarLinea(dotPostionX, dotPostionY, dotPostionX2, dotPostionY2);
    }
    
  console.log(dotPostionX);
  console.log(dotPostionY);
}
  function dibujarLinea(posX, posY, posX2, posY2) {

    context.beginPath();
    context.moveTo(posX, posY);
    context.lineTo(posX2, posY2);    
    context.strokeStyle = "#010102";
    context.stroke();

  }
  prueba();
  drawDots();
  dibujarRejilla();