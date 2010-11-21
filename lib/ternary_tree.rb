class TernaryTree

  class Node
    attr_reader :value, :left, :right, :middle

    def initialize(value)
      @value = value
    end

    def insert(new_val)
      where = where_to_insert(new_val)

      if node = send(where)
        node.insert(new_val)
      else
        instance_variable_set(:"@#{where}", Node.new(new_val))
      end
    end

    private

      def where_to_insert(new_val)
        if new_val < value
          :left
        elsif new_val == value
          :middle
        elsif new_val > value
          :right
        end
      end
  end

  attr_reader :root

  # delegate these to the root...
  [:left, :right, :middle].each do |attr|
    define_method attr do
      root.send(attr) if root
    end
  end

  def insert(value)
    return root.insert(value) if root
    @root = Node.new(value)
  end
end
