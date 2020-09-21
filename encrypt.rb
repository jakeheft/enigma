require './test/test_helper'

handle = File.open(ARGV[0], "r")

message = handle.read

enigma = Enigma.new(message)
require "pry"; binding.pry
handle.close

writer = File.open(ARGV[1], "w")

writer.write("PUT CIPHERTEXT HERE")
writer.close
puts "Created 'encrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
