# test_isbn_calculator.rb

require 'minitest/autorun'
require_relative 'isbn_calculator'

class TestIsbnCalculator < Minitest::Test
  def test_valid_isbn
    assert_equal 7, calculate_isbn13_check_digit("978030640615") # check with verified expected value
    assert_equal 2, calculate_isbn13_check_digit("978186197271") # another verified expected value
    assert_equal 0, calculate_isbn13_check_digit("978013149505") # verified expected value
  end

  def test_invalid_isbn_length
    assert_raises(ArgumentError) { calculate_isbn13_check_digit("12345678901") }  # 11 digits
    assert_raises(ArgumentError) { calculate_isbn13_check_digit("1234567890123") } # 13 digits
  end

  def test_invalid_isbn_non_numeric
    assert_raises(ArgumentError) { calculate_isbn13_check_digit("97803O640615") } # Contains 'O' instead of zero
    assert_raises(ArgumentError) { calculate_isbn13_check_digit("ABCDEFGHIJKL") }  # All letters
  end

  def test_edge_case_same_digits
    assert_equal 6, calculate_isbn13_check_digit("111111111111") # confirm expected check digit
    assert_equal 2, calculate_isbn13_check_digit("222222222222") # confirm expected check digit
  end
end
