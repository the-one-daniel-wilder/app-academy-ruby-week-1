Ruby recursive functions by Daniel Wilder and Michael Cittar

def range(start, endpoint)
  return [] if endpoint < start
  return [start] if start == endpoint
  range(start, endpoint - 1) << endpoint
end


class Array
  def iterative_sum
    self.inject(:+)
  end


  def recursive_sum
    return self[0] if self.length == 1
    self[-1] + self[0..-2].recursive_sum
  end
end


def recursive_one(base, power)
  return 1 if power == 0
  smaller_exponent = power-1
  base_to_smaller_exponent = recursive_one(base, smaller_exponent)
  base * base_to_smaller_exponent
end


def recursive_two(base, power)
  return 1 if power == 0
  return base if power == 1
  if power.even?
    recursive_one(recursive_two(base, power / 2), 2)
  else
    base * recursive_one(recursive_two(base, (power - 1)/2), 2)
  end
end


def deep_dup(array)
  duped = array.map do |el|
    if el.is_a?(Array)
      deep_dup(el)
    else
      el
    end
  end
  Array.new(duped)
end


def fibonacci(n)
  return [1, 1] if n == 1
  prev_array = fibonacci(n - 1)
  prev_array << (prev_array[-1] + prev_array[-2])
end


def subsets(input)
  return [[]] if input.empty?
  set = subsets(input.drop(1))

  set += set.map do |el|
    input.take(1) + el
  end
end


def permutations(array)
  return [array] if array.size == 1
  answers = []

  array.map.with_index do |el, index|
    not_el= []
    array.each_with_index { |element, idx| not_el << element unless idx == index}

    permutations(not_el).map { |element| answers << [el] + element}
  end
  answers
end

def binary_search(list, target)
  if list.length == 1
    if list.first == target
      return 1
    else
      return nil
    end
  end

  middle = list.length / 2
  return middle if target == list[middle]

  if target > list[middle]
    middle += binary_search(list[middle+1..-1], target)
  else
    middle -= binary_search(list[0...middle], target)
  end
end
