cars = {"key" => "value"}


puts "What is the make of the car?"
key = gets.chomp

puts "what is the model of the car?"
value = gets.chomp

cars[key.to_sym] = value

cars.each do |key, value|
    puts "The #{value} is a #{key} model."
end