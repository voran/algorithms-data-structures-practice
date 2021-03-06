=begin
knapsack - naive implementation
time complexity: O(nlogn) worst O(nlogn)
space complexity: O(n)

=end
def knapsack(w, w_arr, v_arr, n)
  return 0 if (w == 0 || n == 0)

  if (w_arr[n - 1] > w)
    knapsack(w, w_arr, v_arr, n - 1)
  else
    [v_arr[n - 1] + knapsack(w - w_arr[n - 1], w_arr, v_arr, n - 1), knapsack(w, w_arr, v_arr, n - 1)].max
  end
end


=begin
dynamic programming solution - tabulation (bottom up)
time complexity: O(nW)
=end
def knapsack_dp(w, w_arr, v_arr, n)
  return 0 if w == 0 || n == 0
  cache = {}

  (0..n).each do |nn|
    cache[nn] = {}
    (0..w).each do |ww|
      cache[nn][ww] = if ww == 0 || nn == 0
        0
      elsif w_arr[nn - 1] > ww
        cache[nn - 1][ww]
      else
        [v_arr[nn - 1] + cache[nn - 1][ww - w_arr[nn - 1]], cache[nn - 1][ww]].max
      end
    end
  end
  cache[n][w]
end

def knapsack_memo(w, w_arr, v_arr, n, memo = {})
  return 0 if (w == 0 || n == 0)

  memo[n] ||= {}
  if memo[n][w].nil?
    memo[n][w] = if (w_arr[n - 1] > w)
      knapsack_memo(w, w_arr, v_arr, n - 1, memo)
    else
      [v_arr[n - 1] + knapsack_memo(w - w_arr[n - 1], w_arr, v_arr, n - 1, memo), knapsack_memo(w, w_arr, v_arr, n - 1, memo)].max
    end
  end
  memo[n][w]
end
