# class that links nodes together
class LinkList
  attr_accessor :head


  def initialize
    @head = nil
  end

  def append_node(value)
    if @head.nil?
      @head = Node.new(value, nil)
    else
      last_node = @head
      last_node = last_node.next_node until last_node.next_node.nil?
      last_node.next_node = Node.new(value, nil)
    end
  end

  def prepend_node(value)
    tmp_node = @head
    @head = Node.new(value, tmp_node)
  end

  def length
    linked_list_length = 0
    last_node = @head
    until last_node.nil?
      linked_list_length += 1
      last_node = last_node.next_node
    end
    puts linked_list_length
  end

  def first
    @head
  end

  def tail
    tail = @head
    tail = tail.next_node until tail.next_node.nil?
    tail
  end

  def index_at(index)
    i = 0
    node = @head
    indexed_node = ''
    while i <= index
      indexed_node = node
      node = node.next_node
      i += 1
    end
    indexed_node
  end

  def pop
    node = @head
    second = nil
    until node.next_node.nil?
      second = node
      node = node.next_node
    end
    second.next_node = nil
  end

  def contains?(value)
    check = false
    node = @head
    until node.next_node.nil?
      check = node.value == value
      node = node.next_node
    end
    check
  end

  def find(value)
    index = 0
    node = @head
    until node.next_node.nil?
      break if node.value == value

      index += 1
      node = node.next_node
    end
    node.value != value ? nil : index
  end

  def to_s
    node = @head
    until node.next_node.nil?
      print "(#{node.value}) -> "
      node = node.next_node
    end
    print 'nil'
  end

  def insert_at(index, value)
    node = @head
    previous_node = nil
    i = 0
    while i < index
      previous_node = node
      node = node.next_node
      i += 1
    end
    previous_node.next_node = Node.new(value, node)
  end

  def remove_at(index)
    node = @head
    previous_node = nil
    i = 0
    while i <= index
      previous_node = node if i < index
      node = node.next_node
      i += 1
    end
    previous_node.next_node = node
  end
end

# class for creating node for linked list
class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
