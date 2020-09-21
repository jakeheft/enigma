require './test/test_helper'

handle = File.open(ARGV[0], "r")

message = (handle.read).downcase

enigma = Enigma.new(message, "29839", "091920")

enigma.encrypt(message, "29839", "091920")
handle.close

writer = File.open(ARGV[1], "w")

writer.write(enigma.encryption)
writer.close

puts "Created 'encrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
