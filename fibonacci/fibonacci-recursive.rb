=begin
recursive solution
regursion tree
                     fib(5)
         fib(4)              fib(3)
    fib(3)   fib(2)       fib(2)   fib(1)
fib(2) fib(1)

time complexity: exponential T(n) = T(n-1) + T(n - 2)
space complexity O(n) if we consider stack, otherwise O(1)

=end
def fib_recursive(n)
  case n
  when 0, 1
    n
  else
    fib(n - 1) + fib(n - 2)
  end
end



=begin
DP solution tabulation solution (bottom up)
time complexity: O(n)
space complexity O(n)
space can be optimized to O(1) if only the previos two solutions are kept

=end
def fib_tabulation(n)
  solutions = {0 => 0, 1 => 1}
  (2..n).each do |number|
    solutions[number] = solutions[number - 1] + solutions[number - 2]
  end
  solutions[n]
end

=begin
DP solution memoization solution (top down)
time complexity: O(n)
space complexity O(n)
space can be optimized to O(1) if only the previos two solutions are kept
=end
def fib_memoization(n, solutions = {0 => 0, 1 => 1})
  if solutions[n].nil?
    solutions[n] = fib_tabulation(n - 1, solutions) + fib_tabulation(n - 2, solutions)
  end
  solutions[n]
end
