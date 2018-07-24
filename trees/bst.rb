=begin
BST
insert O(logn)
find O(logn)
delete O(logn)
=end

class Node
  attr_accessor :key, :left, :right

  def initialize(key, left, right)
    @key = key
    @left = left
    @right = right
  end
end


class Tree
  attr_accessor :root

  def insert!(element)
    @root = do_insert(@root, element)
  end

  def initialize(array)
    array.each do |element|
      insert!(element)
    end
  end

  def search(key)
    do_search(@root, key)
  end

  def in_order
    array = []
    traverse_in_order(@root, array)
    array
  end

  def nth_largest(n)
    @visited_count = 0
    get_nth_largest(@root, n)
  end

  private
  def do_insert(node, element)
    if !node
      return Node.new(element, nil, nil)
    end

    if element > node.key
      node.right = do_insert(node.right, element)
    elsif element < node.key
      node.left = do_insert(node.left, element)
    end
    node
  end

  def do_search(node, element)
    return if !node

    if element == node.key
      node
    elsif element < node.key
      do_search(node.left, element)
    elsif element > node.key
      do_search(node.right, element)
    end
  end

  def traverse_in_order(node, array)
    return if !node
    traverse_in_order(node.left, array)
    array.push node.key
    traverse_in_order(node.right, array)
  end

  def get_nth_largest(node, n)
    if node.right && value = get_nth_largest(node.right, n)
      return value
    end

    @visited_count += 1
    return node.key if @visited_count == n

    if node.left && value = get_nth_largest(node.left, n)
      return value
    end
  end
end
