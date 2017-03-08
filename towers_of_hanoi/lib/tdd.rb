

def my_uniq(arr)
  raise TypeError unless arr.is_a? Array
  uniq_arr = []
  arr.each do |el|
    uniq_arr << el unless uniq_arr.include? el
  end
  uniq_arr
end

class Array

  def two_sum
    two_sums = []
    self.length.times do |i|
      (i...self.length).each do |j|
        if self[i] + self[j] == 0 && i != j
          two_sums << [i, j]
        end
      end
    end

    two_sums
  end

end

def my_transpose(arr)
  raise TypeError unless arr.is_a?(Array)

  arr[0].zip(*arr[1..-1])
end


def stock_picker(days)
  max_gain = [0,1]
  days.each_index do |i|
    ((i+1)...days.length).each do |j|
      if days[j] - days[i] > days[max_gain[1]]-days[max_gain[0]]
        max_gain = [i, j]
      end
    end
  end
  max_gain
end
