# Output: buckets = {
#       1 => [[1, "1"], [1, "2"], [1, "3"]],
#       2 => [[2, "1"], [2, "2"]],
#       3 => [[3, "3"]]
# }

input = [
  [1, "1"], [1, "2"], [1, "3"], [2, "1"], [2, "2"], [3, "3"],
]

def convert_buckets(input)
  buckets = {}
  input.each { |value| buckets[value[0]] ? buckets[value[0]] << value : buckets[value[0]] = [value] }
  return buckets
end

p convert_buckets(input)

# Output: batch_buckets_size_max = {
#       1 => [[[1, "1"], [1, "2"]], [[1, "3"]]],
#       2 => [[[2, "1"], [2, "2"]]],
#       3 => [[[3, "3"]]]
# }

def convert_batch_buckets(input, size)
  batchs = {}
  input.each { |key, value| batchs[key] = input[key].each_slice(size).to_a }
  return batchs
end

p convert_batch_buckets(convert_buckets(input), 2)
