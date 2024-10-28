# ISBN-13 Check Digit Calculator

# Constants
PROMPT_MESSAGE = "Enter the first 12 digits of an ISBN-13 code: "
ERROR_MESSAGE = "Error: ISBN must be a 12-digit numeric string. Please try again."

# Calculates the check digit for a 12-digit ISBN-13 code
def calculate_isbn13_check_digit(isbn)
  unless isbn.is_a?(String) && isbn.match?(/^\d{12}$/)
    raise ArgumentError, ERROR_MESSAGE
  end

  sum = isbn.chars.each_with_index.sum { |digit, index| digit.to_i * (index.even? ? 1 : 3) }
  if((10 - (sum % 10)) == 10)
        0
  else
    (10 - (sum % 10))
  end
end

# Prompts user for a 12-digit ISBN code and returns the valid input
def prompt_isbn_input
  loop do
    print PROMPT_MESSAGE
    isbn = gets.chomp
    return isbn if isbn.match?(/^\d{12}$/)

    puts ERROR_MESSAGE
  end
end

# Main program logic
def main
  isbn = prompt_isbn_input
  check_digit = calculate_isbn13_check_digit(isbn)
  full_isbn = isbn + check_digit.to_s
  puts "The full ISBN-13 is: #{full_isbn}"
end

# Only run `main` if the file is executed directly
main if __FILE__ == $0
