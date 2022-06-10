class Stack
    def initialize
      @arr = []
    end

    def get
      @arr
    end

    def push(el)
      @arr << el
    end

    def pop
      @arr = @arr[0..-2]
      @arr[-1]
    end

    def peek
      @arr[-1]
    end
end

class Queue

  def initialize
    @arr = []
  end

  def enqueue(el)
    @arr << el
  end

  def dequeue
    ele = @arr[0]
    @arr = @arr[1..-1]
    ele
  end

  def peek
    @arr[0]
  end
end

class Map
  def initialize
      @map = []
  end

  def set(key, value)
    is_key = false
      @map.each_with_index do |ele, idx|
          if ele[0] == key
              @map[idx] << value
              is_key = true
          end
      end
      if !is_key
          @map << [key, value]
      end
  end

  def get(key)
      @map.each_with_index do |ele, idx|
          if ele[0] == key
              return @map[idx]
          end
      end
  end

  def delete(key)
      @map.each_with_index do |ele, idx|
          if ele == key
              @map = @map[0...idx] + @map[idx+1..-1]
          end
      end
  end

  def show
      @map.each do |ele|
          p ele
      end
  end
end