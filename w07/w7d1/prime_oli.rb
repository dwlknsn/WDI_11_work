require 'pry-byebug'

def prime_sieve(n)
  arr = (3..n).to_a
  store = [2]
  arr.delete_if{|num| num % 2 == 0}
  limit = n**0.5
  # binding.pry
  until store.last >= limit
    prime = arr.shift
    arr.delete_if{|num| num % prime == 0}
    store << prime
  end
  store +=  arr
end
puts prime_sieve(20)