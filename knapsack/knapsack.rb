def knapsack(w, w_arr, v_arr, n)
  return 0 if (w == 0 || n == 0)

  if (w_arr[n - 1] > w)
    knapsack(w, w_arr, v_arr, n - 1)
  else
    [v_arr[n - 1] + knapsack(w - w_arr[n - 1], w_arr, v_arr, n - 1), knapsack(w, w_arr, v_arr, n - 1)].max
  end
end
