class LRUCache
    def initialize(n = 1)
        @lru = []
        @max_size = n
    end

    def count
        max_size
      # returns number of elements currently in cache
    end

    def add(el)
        if !@lru.include?(el)
            if @lru.count == max_size
                @lru.shift
                @lru << el
            else
                @lru.unshift(el)
            end
        else
            @lru.delete(el)
            @lru << el
        end
        el
      # adds element to cache according to LRU principle
    end

    def show
        p @lru
      # shows the items in the cache, with the LRU item first
    end

    private
    attr_reader :max_size
    # helper methods go here!

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]