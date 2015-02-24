<h1>Adding the mortgage calc</h1>

1) add mortgage link to nav in layout.erb

    <li><a href="/mortgage">MORTGAGE</a></li>

2) click link and get error

3) add get '/mortgage' method to main.rb

```
get '/mortgage' do
 'mortgage calculator'
end
```

4) refresh chrome and get result

5) replace with erb :mortgage

```
get '/mortgage' do
  erb :mortgage  ##this line
end
```

6) refresh page, get error, review terminal log to find 'No such file or directory'

7) add new file mortgage.erb to views folder with 

```
<h2>Mortgage calc</h2>
```
 refresh and make sure link is working.

8) add form to mortgage.erb

```
  <form action="/mortgage" method="get">
    <!-- principal -->
    <label for="principal">£ Principal</label>
    <input type="text" name="principal">
    
    <!-- yearly interest rate -->
    <label for="interest">% yearly interest</label>
    <input type="text" name="interest">
    
    <!-- months remaining -->
    <label for="months">months remaining</label>
    <input type="text" name="months">

    <input type="submit">
  </form>
```

9) add binding.pry to main.rb in /mortgage block

```
  get '/mortgage' do
    binding.pry
    puts "debugging"
    erb :mortgage
  end
```

10) enter values into form and submit - you are now in pry

11) review params variable and access key/values in pry

```
  params
  => {"principal"=>"100000", "interest"=>"5", "months"=>"300"}
  params['principal']
  => "100000"
  etc
```

12) add in calculation

```
  principal = params['principal'].to_f
  interest = params['interest'].to_f
  interest /= 100
  interest /= 12
  months = params['months'].to_i
  constant = (1 + interest) ** months

  numerator = principal * interest * constant
  denominator = constant - 1

  @result = (numerator / denominator).round(2)
```

11) rerun calc and go into pry to check result

  when p = £100000, i = 6%, n = 360
  
  result = £599.55

12) how to get it into view: add erb tags to mortgage.erb

```
  <% if @result %>
    <h1>Your monthly payment is £<%= @result %></h1>
  <% end %>
```

<h1> adding the BMI calc</h1>

1) add the link to the nav in layout.erb

```
	<li><a href="/bmi">BMI</a></li>
```
2) add the method to main.rb

```
get '/bmi' do
  erb :bmi
end
```

3) add the form to bmi.erb

```
<form action="/bmi" method="get">  
  Imperial (lbs / in): <input type="radio" name="operator" value="imperial">
  Metric (kg / m): <input type="radio" name="operator" value="metric">
  
  <label for="mass">Mass</label>
  <input type="text" name="mass">
  <label for="height">Height</label>
  <input type="text" name="height">


  <input type="submit">
</form>
```

4) update the get method

```
get '/bmi' do
  mass = params['mass'].to_f
  height = params['height'].to_f
  operator = params['operator']

  @result = mass / height ** 2

  if operator == "imperial"
    @result *= 703
  end

  @result = @result.round(2)

  binding.pry
  puts "debugging"
  
  erb :bmi
end
```

5) update the view to include the result

```
<% if @result %>
  <h2>Your BMI is <%= @result %></h2>
<% end %>
```