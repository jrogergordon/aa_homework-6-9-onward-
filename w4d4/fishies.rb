require "byebug"
fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh'] #=> "fiiiissshhhhhh"

def sluggish_octopus(fish)
    big_fish = fish[0]
    fish.each_with_index do |ele, idx|
        count = 0
        fish.each_with_index do |ele_0, idx_0|
            if ele.length > ele_0.length
                count += 1
                big_fish = ele
            end
            if count == fish.length
                big_fish = ele
            end
        end
    end
    big_fish
end



class Array
    def merge_sort(&prc)
        return self if self.length <= 1

        middle = self.length / 2

        left = self[0...middle]
        right = self[middle..-1]

        sorted_left = left.merge_sort(&prc)
        sorted_right = right.merge_sort(&prc)
        Array.merge(sorted_left, sorted_right, &prc)
    end


    def self.merge(left, right, &prc)
        ret_arr = []
        while !left.empty? && !right.empty?
            x = prc.call(left.first, right.first)
            if x == -1 || x == 0
                ret_arr << left.shift
            else
                ret_arr << right.shift
            end
        end
        ret_arr.concat(left)
        ret_arr.concat(right)
        ret_arr
    end
end

def dominant_octopus(fishes)
    prc = Proc.new { |x, y| y.length <=> x.length }
    fishes.merge_sort(&prc)[0]
end


def clever_octopus(fishes)
    longest_fish = fishes[0]
    i = 1
    while i < fishes.length
        if longest_fish.length < fishes[i].length
            longest_fish = fishes[i]
        end
        i += 1
    end
    longest_fish
end
 
def slow_dance(target, array)
    array.each_with_index do |ele, idx|
        return idx if target == ele
    end
end



tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
