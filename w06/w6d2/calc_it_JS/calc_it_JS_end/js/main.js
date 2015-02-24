function getValue(id){
  return document.getElementById(id).value;
}

function getFloat(id){
  return parseFloat(getValue(id));
}

function setText(id, text){
  document.getElementById(id).innerText = text;
}

function roundToTwoDP(value){
  return Math.round(value * 100) / 100;
}

function unhide(id){
  document.getElementById(id).className = "";
}

function hide(id){
  document.getElementById(id).className = "hide";
}

function hideAllAnswers () {
  hide("basic-answer");
  hide("trip-answer");
  hide("bmi-answer");
  hide("mortgage-answer");
}

function basicCalc(){
  var num1 = getFloat("basic-num-1");
  var num2 = getFloat("basic-num-2");
  var op = getValue("basic-operation");

  switch(op){
    case "+":
    var ans = num1 + num2;
    break;
    case "-":
    var ans = num1 - num2;
    break;
    case "*":
    var ans = num1 * num2;
    break;
    case "/":
    var ans = num1 / num2;
    break;
  }
  setText("basic-answer-alert", ans);
  hideAllAnswers();
  unhide("basic-answer");
}

function tripCalc(){
  var dist = getFloat("trip-distance");
  var mpg = getFloat("trip-mpg");
  var cost = getFloat("trip-cost");
  var speed  = getFloat("trip-speed");

  var time = roundToTwoDP(dist / speed);

  if (mpg > 60) {
    var actualMPG = mpg - (speed - 60) * 2;
  } else {
    var actualMPG = mpg;
  }

  var cost = roundToTwoDP(dist / actualMPG * cost);
  setText("trip-answer-alert", "Your trip will take " + time + " hours and cost $" + cost + ".")
  hideAllAnswers();
  unhide("trip-answer");
}

function changeBmiUnits(){
  var units = getValue("bmi-units");
  switch(units){
    case 'metric':
    setText("bmi-mass-unit", "kg");
    setText("bmi-height-unit", "m");
    break;
    case 'imperial':
    setText("bmi-mass-unit", "lb");
    setText("bmi-height-unit", "inches");
    break;
  }
  hide("bmi-answer");
}

function bmiCalc() {
  var units = getValue("bmi-units");
  var mass = getFloat("bmi-mass");
  var height = getFloat("bmi-height");

  switch(units){
    case 'metric':
    var bmi = roundToTwoDP(mass / Math.pow(height, 2));
    break;
    case 'imperial':
    var bmi = roundToTwoDP(mass / Math.pow(height, 2) * 703);
    break;
  }
  setText("bmi-answer-alert", "Your BMI is " + bmi);
  hideAllAnswers();
  unhide("bmi-answer");
}

function mortgageCalc(){
  var loan = getFloat("mortgage-loan");
  var apr = getFloat("mortgage-apr") / 100 / 12;
  var term = getFloat("mortgage-term");

  var temp = Math.pow((1 + apr), term);
  var payment = roundToTwoDP(loan * apr * temp / (temp - 1));

  setText("mortgage-answer-alert", "Your monthly payment will be $" + payment);
  hideAllAnswers();
  unhide("mortgage-answer");
}

window.onload = function(){
  var basic = document.getElementById("basic-calc");
  var trip = document.getElementById("trip-calc");
  var unitSelect = document.getElementById("bmi-units");
  var bmi = document.getElementById("bmi-calc");
  var mortgage = document.getElementById("mortgage-calc");

  basic.addEventListener("click", basicCalc);
  trip.addEventListener("click", tripCalc);
  unitSelect.addEventListener("change", changeBmiUnits);
  bmi.addEventListener("click", bmiCalc);
  mortgage.addEventListener("click", mortgageCalc);
}













