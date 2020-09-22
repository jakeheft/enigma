require './test/test_helper'

handle = File.open(ARGV[0], "r")

message = (handle.read).downcase

enigma = Enigma.new

enigma.encrypt(message)
handle.close

writer = File.open(ARGV[1], "w")

writer.write(enigma.encryption)
writer.close

puts "Created 'encrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
