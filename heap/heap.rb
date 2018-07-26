class MaxHeap
  def initialize(values = [])
    @heap = []
    values.each do |v|
      self.push(v)
    end
  end

  def push(value)
    i = 1
    while true
      if (@heap[i].nil?)
        @heap[i] = value
        break
      end
      i += 1
    end
    heapify_up(i)
  end

  def peek
    @heap[1]
  end

  def pop
    first = @heap[1]
    @heap[1] = @heap.delete_at(-1)
    heapify_down(1)
    return first
  end

  private
  def heapify_down(index)
    left_index = index * 2
    right_index = index * 2 + 1
    if ((left_index <= @heap.length && @heap[index] < @heap[left_index]) || (right_index <= @heap.length && @heap[index] < @heap[right_index]))
      to_swap_value = [@heap[left_index], @heap[right_index]].compact.max
      to_swap_index = [left_index, right_index].find {|i| @heap[i] == to_swap_value}
      tmp = @heap[index]
      @heap[index] = @heap[to_swap_index]
      @heap[to_swap_index] = tmp
      heapify_up(to_swap_index)
    end
  end

  def heapify_up(index)
    return if index == 1
    if (@heap[index / 2] < @heap[index])
      tmp = @heap[index]
      @heap[index] = @heap[index / 2]
      @heap[index / 2] = tmp
      heapify_up(index / 2)
    end
  end
end
