function getValue(id){
  return document.getElementById(id).value;
}

function getFloat(id){
  return parseFloat(getValue(id));
}

function setHTML(id, html){
  document.getElementById(id).innerHTML = html;
}

function roundToTwoDP(value) {
  return Math.round(value * 100) / 100;
}

function hideAllAnswers(){
  hide("basic-answer");
  hide("trip-answer");
  hide("bmi-answer");
  hide("mortgage-answer");
}

function hide(id){
  document.getElementById(id).className = "hide";
}

function unhide(id){
  document.getElementById(id).className = "";
}

function basicCalc(){
  var num1 = getFloat("basic-num-1");
  var num2 = getFloat("basic-num-2");
  var op = getValue("basic-operation");

  switch(op){
    case '+':
    var ans = num1 + num2;
    break;
    case '-':
    var ans = num1 - num2;
    break;
    case '*':
    var ans = num1 * num2;
    break;
    case '/':
    var ans = num1 / num2;
    break;
  }
  setHTML("basic-answer-alert", (num1 + " " + op + " " + num2 + " = " + ans));
  hideAllAnswers();
  unhide("basic-answer");
}

function tripCalc(){
  var dist = getFloat("trip-distance");
  var mpg = getFloat("trip-mpg");
  var cost = getFloat("trip-cost");
  var speed = getFloat("trip-speed");

  var time = roundToTwoDP(dist / speed);

  if (mpg > 60) {
    var actualMPG = mpg - (speed - 60) * 2;
  } else{
    var actualMPG = mpg;
  };

  cost = roundToTwoDP(dist / actualMPG * cost);
  setHTML("trip-answer-alert", "Your trip will take " + time + " hours and cost $" + cost + "." );
  hideAllAnswers();
  unhide("trip-answer");
}


window.onload = function(){
  document.getElementById("basic-calc").addEventListener("click", basicCalc);

  document.getElementById("trip-calc").addEventListener("click", tripCalc);
}