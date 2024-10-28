# Define a method to calculate the ISBN-13 check digit
# @param isbn [String] A 12-digit ISBN-13 code as a string
# @return [Integer] The check digit (0–9) for the full 13-digit ISBN-13
# @raise [ArgumentError] If the input is not a 12-digit string
def calculate_isbn13_check_digit(isbn)
    # Ensure the input is a 12-digit string
    unless isbn.is_a?(String) && isbn.match?(/^\d{12}$/)
      raise ArgumentError, "ISBN must be a 12-digit numeric string"
    end
  
    # Calculate the weighted sum of the first 12 digits
    sum = isbn.chars.each_with_index.sum do |digit, index|
      digit.to_i * (index.even? ? 1 : 3)
    end
  
    # Calculate check digit as the remainder needed to make the sum a multiple of 10
    (10 - (sum % 10)) % 10
  end
  
  # Main program that prompts user input
  begin
    # Prompt the user to enter the first 12 digits of an ISBN-13
    print "Enter the first 12 digits of an ISBN-13 code: "
    isbn = gets.chomp
  
    # Calculate and display the full ISBN-13 with the check digit
    check_digit = calculate_isbn13_check_digit(isbn)
    full_isbn = isbn + check_digit.to_s
    puts "The full ISBN-13 is: #{full_isbn}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
  