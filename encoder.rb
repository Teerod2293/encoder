if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require "digest"

puts "Введите фразу или слово для шифрования:"
words = STDIN.gets.chomp

puts "Каким способом шифровать:"
puts "1. MD5 \n2. SHA1"
choice = STDIN.gets.chomp

puts "Вот что получилось: "
if choice == 1
  puts Digest::MD5.hexdigest(words)
else
  puts  Digest::SHA1.hexdigest(words)
end