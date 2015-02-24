require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do 
  erb :home
end

get '/basic_calc' do 
  first = params["first"].to_f
  second = params["second"].to_f
  operator = params["operator"]

  @result = case operator
  when '+' then first + second
  when '-' then first - second
  when '*' then first * second
  when '/' then first / second
  end
  # binding.pry
  erb :basic_calc
end


get '/mortgage' do
  # unless params['principal'].zero?
  binding.pry
    principal = params['principal'].to_f
    interest = params['interest'].to_f
    interest /= 100
    interest /= 12
    months = params['months'].to_i

    constant = (1 + interest) ** months
    numerator = principal * interest * constant
    denominator = constant - 1


    @result = (numerator / denominator).round(2)
  # end
  # binding.pry


  erb :mortgage
end




















