require './test/test_helper'

handle = File.open(ARGV[0], "r")

message = handle.read

enigma = Enigma.new(message, "12345", "091920")
enigma.encrypt(message, "12345", "091920")
handle.close
### trying to figure out why encrypted file is blank (wasn't running enigma.encrypt) and now having argument issues

writer = File.open(ARGV[1], "w")
# require "pry"; binding.pry
writer.write(enigma.encryption)
writer.close
puts "Created 'encrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
