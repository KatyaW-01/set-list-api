puts "Start of file..."

begin
  puts "Before the error"
  name.upcase #put code in here that could potentially produce an error 
  #once it errors out, it doesnt continue with the rest of the code so "after the error won't be output"
  #stops running code in the begin block but doesnt crash the application, jumps to the rescue
  puts "After the error"

rescue NameError
  
puts "Oops you're using a method that doesn't exist "

rescue StandardError => error #doesnt need to be called error, can be called anything you want, placing the error in an object
  #Where we place any code that should run in the event of an error
  #puts error
  puts "#{error.class}: #{error.message}"
  #gives you the error output you would have gotten before but doesn't crash the application

end

puts "End of file..."