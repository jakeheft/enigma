require './test/test_helper'

handle = File.open(ARGV[0], "r")
message = (handle.read).downcase

handle.close

key = ARGV[2]
date = ARGV[3]
enigma = Enigma.new

enigma.decrypt(message, key, date)

writer = File.open(ARGV[1], "w")

writer.write(enigma.encryption)
writer.close

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
