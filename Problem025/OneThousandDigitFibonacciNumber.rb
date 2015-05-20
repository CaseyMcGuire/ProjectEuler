storage = []
storage[0] = 1
storage[1] = 1

temp = 0
while temp.to_s.length < 1000
  temp = storage[-1] + storage[-2]
  storage << temp
end

puts storage.length
