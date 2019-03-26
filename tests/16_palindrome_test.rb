require 'test/unit'
require_relative '../16_palindrome.rb'

class Palindrome < Test::Unit::TestCase
  def test_palindrome
    assert_equal(true, palindrome("racecar"))
    assert_equal(false, palindrome("hello"))
    assert_equal(true, palindrome(101))
    assert_equal(false, palindrome(110))
  end
end