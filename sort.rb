def insertion_sort(array)
  right_index = 0
  (array.length - 1).times do |index|
    insert(array, right_index, array[index + 1])
    right_index += 1
  end
  array
end

def insert(array, right_index, value)
  # value is the value of array[right_index + 1]
  # right_index is the furthest right sorted element

  # Step through sorted elements right to left.
  # As long as your value is less than the element
  # at array[i] and you still have elements
  i = right_index
  while(i >= 0 && array[i] > value)
  # copy the element
  array[i+1] = array[i]
  i -= 1
  end

  # insert the actual element
  array[i+1] = value;
end

def bubble_sort(array)
  continue = true
  while continue
    continue = false
    (array.length - 1).times do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        continue = true
      end
    end
  end
  array
end

def merge_sort(array)
    # if the array is one element long, just return it
    return array if array.length <= 1

    midpoint_index = array.length / 2
    # mergeSort() the left half of the array
    left_half = merge_sort( array[0...midpoint_index] )

    # mergeSort() the right half of the array
    right_half = merge_sort( array[midpoint_index..-1] )

    # merge() the two halves
    merged = merge(left_half, right_half)

    # return the merged array
    return merged
end

def merge(left_half, right_half)
  merged = []
  while (left_half.any? && right_half.any?)
    merged << (left_half.first < right_half.first ? 
               left_half.shift : right_half.shift)
  end
  merged = merged + right_half + left_half
end