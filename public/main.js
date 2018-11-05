var canvas = document.getElementById('dotCanvas');
var context = canvas.getContext('2d');

var anchoTablero = 400;
var altoTablero = 400;

const colorsHash = {};

function dibujarRejilla(){

  var anchoCelda = anchoTablero/4;
  var altoCelda = altoTablero/4;

  for (var x = 5; x <= anchoTablero+5; x += anchoCelda) {
      context.moveTo(x, 0); // x, y
      context.lineTo(x, altoTablero);
  }
  
  for (var y = 5; y <= altoTablero+5; y += altoCelda) {
      context.moveTo(0, y); // x, y
      context.lineTo(anchoTablero, y);
  }

  context.strokeStyle = "#FF0000";
  context.stroke();
}

function dibujarPuntos() {
  var r = 10,
      anchoPuntos = anchoTablero/4,
      altoPuntos = altoTablero/4;
  
  for (var x = 0; x <= anchoTablero; x+=anchoPuntos) {
    for (var y = 0; y <= altoTablero; y+=altoPuntos) {
        context.fillStyle = '#000000';   
        context.fillRect(x,y,r,r);
      }
  }
}

function calcularCoordenadas(posX, posY,posX2, posY2){    
      const coordX=5+(100*(posX-1));
      const coordX2=5+(100*(posX2-1));        
      const coordY=5+(100*(posY-1));
      const coordY2=5+(100*(posY2-1));
      dibujarLinea(coordX,coordY,coordX2,coordY2);
}


function dibujarLinea(posX, posY, posX2, posY2) {

  context.beginPath();
  context.moveTo(posX, posY);
  context.lineTo(posX2, posY2);    
  context.strokeStyle = "#A51E00";
  context.stroke();

}
function comprobarSiNoHayNulos(posX,posY,posX2,posY2){
  let noHayNulos=false;
  if(posX !== null && posX !== '') {
      if(posY !== null && posY !== ''){
          if(posX2 !== null && posX2 !== ''){
              if(posY2 !== null && posY2 !== ''){
                  noHayNulos=true;
              }
          }
      }
  }
  return noHayNulos;
}
function comprobarQueLosPuntosSeanAdyacentes(distanciaX,distanciaY){
  let sonAdyacentes=false;
  if(distanciaX!=distanciaY){
      if((distanciaX<=1)&&(distanciaY<=1))
      {
          sonAdyacentes=true;
      }
  }
  return sonAdyacentes
}

function leerCoordenadas(){
  const posX = document.querySelector('#posX').value;
  const posY = document.querySelector('#posY').value;
  const posX2 = document.querySelector('#posX2').value;
  const posY2 = document.querySelector('#posY2').value;
      if(comprobarSiNoHayNulos(posX,posY,posX2,posY2)){
          const distanciaX=Math.abs(posX-posX2);
          const distanciaY=Math.abs(posY-posY2);
          if(comprobarQueLosPuntosSeanAdyacentes(distanciaX,distanciaY))
          {
              calcularCoordenadas(posX,posY,posX2,posY2);
          }
      }
}

function manejadorDeEventos() {
  const buttn =document.querySelector("#dibujar");
  buttn.addEventListener("click",leerCoordenadas);
}
dibujarPuntos();
manejadorDeEventos();