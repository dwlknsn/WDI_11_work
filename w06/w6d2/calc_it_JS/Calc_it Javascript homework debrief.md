##	Calc_it Javascript homework debrief

* Hand out starter app
* open console `CMD + ALT + J` and demo that nothing happens when submit is clicked
* add `window.onload = function(){}` to main.js
* show id of submit button in basic calc form
	* use `document.getElementById("basic-calc")` in console to target the submit button.
	* copy this to our main.js file
* expand this to include a "click" event listener and use console.log to show that it's working:

```
window.onload = function(){
  document.getElementById("basic-calc").addEventListener("click", function(){
    console.log("clicked");
  });
}
```
*  we know that it's working from the console. Now, let's tidy it up a little, by splitting this out into it's own function:

```
function basicCalc(){
  console.log("clicked");
}

window.onload = function(){
  document.getElementById("basic-calc").addEventListener("click", basicCalc);
}
```
*  check it's still working in the console.
*  it's working, so now we use the console to get the values from the three input boxes in the basic calc form. We want to use `parseFloat` for the numbers. log these to console to ensure it's working

```
function basicCalc(){
  var num1 = parseFloat(document.getElementById("basic-num-1").value);
  var num2 = parseFloat(document.getElementById("basic-num-2").value);
  var op = document.getElementById("basic-operation").value;
  console.log(num1, num2, op)
}
```

*  starting to repeat ourselves so we can DRY this up by making a utility function `getValue()`. Note the use of `return` in the `getValue` function.	

```
function getValue(id){
  return document.getElementById(id).value;
}

function basicCalc(){
  var num1 = parseFloat(getValue("basic-num-1"));
  var num2 = parseFloat(getValue("basic-num-2"));
  var op = getValue("basic-operation");
  console.log(num1, num2, op)
}
```
* we can go one step further with `getFloat()`

```
function getFloat(id){
  return parseFloat(getValue(id));
}

function basicCalc(){
  var num1 = getFloat("basic-num-1");
  var num2 = getFloat("basic-num-2");
  var op = getValue("basic-operation");
  ...
 }
```


* start to add in the switch statement for the addition function, check it's working by printing out to the console:

```
  switch(op){
    case '+':
    var ans = num1 + num2;
    console.log(ans);
    break;
  }
```
* now we want to add this result to the DOM by inserting it into the HTML. Go to `index.html` and show the `basic-answer` div with `class='hide'`. delete this and refresh the page to show it on screen for a moment. This is where we'll insert the result.
* target this element from the console and set it = to `"hello"` to show it works:
```
document.getElementById("basic-answer-alert").innerHTML = 'hello'
```
* then copy into main.js and replace 'hello' with ans
* refresh the page and show that it works
* we can now add in the other cases in the switch statement. refresh the browser and check that these all work

```
  switch(op){
    case '+':
    var ans = num1 + num2;
    document.getElementById("basic-answer-alert").innerHTML = ans;
    break;
    case '-':
    var ans = num1 - num2;
    document.getElementById("basic-answer-alert").innerHTML = ans;
    break;
    case '*':
    var ans = num1 * num2;
    document.getElementById("basic-answer-alert").innerHTML = ans;
    break;
    case '/':
    var ans = num1 / num2;
    document.getElementById("basic-answer-alert").innerHTML = ans;
    break;
  }
```
* now refactor by creating another utility method to set the innerHTML property:

```
function setHTML(id, html){
  document.getElementById(id).innerHTML = html;
}
```
* and the switch statement:

```
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

```
* BASIC CALC DONE!
* target the trip calc submit button:

```
document.getElementById("trip-calc").addEventListener("click", tripCalc);
```
```
function tripCalc(){
  console.log("clicked");
}
```
* get your input values and log to the console to check working

```
function tripCalc(){
  var dist = getFloat("trip-distance");
  var mpg = getFloat("trip-mpg");
  var cost = getFloat("trip-cost");
  var speed = getFloat("trip-speed");
  console.log(dist, mpg, cost, speed);
}
```

* add in the rest of the calcs:

```
function tripCalc(){
  var dist = getFloat("trip-distance");
  var mpg = getFloat("trip-mpg");
  var cost = getFloat("trip-cost");
  var speed = getFloat("trip-speed");
  console.log(dist, mpg, cost, speed);

  var time = (dist / speed);

  if (mpg > 60) {
    var actualMPG = mpg - (speed - 60) * 2;
  } else{
    var actualMPG = mpg;
  };

  cost = (dist / actualMPG * cost);
  
```
* and output to the html (remember to remove the `hide` class from the html element)

```
  setHTML("trip-answer-alert", "Your trip will take " + time + " hours and cost $" + cost + "." );
}
```

* show result and the how we might round to 2dp:

```
function roundToTwoDP(value) {
  return Math.round(value * 100) / 100;
}
```
* and call this on the time and cost

```
time = roundToTwoDP(dist / speed);
```

* TRIP CALC DONE!
* skip the others and show how to toggle the hide class
* insert the THREE functions to hideall / hide one / unhide one:

```

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
```

then call them at the foot of each function when you put the results into the html

```

  setHTML("basic-answer-alert", (num1 + " " + op + " " + num2 + " = " + ans));
  hideAllAnswers();
  unhide("basic-answer");
  
```

done - Q&A