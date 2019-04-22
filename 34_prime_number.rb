# Prime numbers

# A prime number is only divisible by itself and 1.
# 1 is not a prime number. The first prime number is 2.
# The first 50 prime numbers are:
# 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 
# 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 
# 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 
# 173, 179, 181, 191, 193, 197, 199, 211, 223, 227

# The Sieve of Eratosthenes can be used to identify the prime numbers
# in a range from 2 - n. It works by eliminating all of the composite (non-prime) numbers.
# By starting with the first prime number (2), the steps are:
# 1. Eliminate all multiples of the prime number up to n
# 2. Go to the next prime number

# What's left is the prime numbers. This is demonstrated in a short
# video here: https://www.youtube.com/watch?v=FBbHzy7v2Kg

# Your code should return the largest prime number that is less
# than or equal to the number given as an argument.
# For example: prime_number(45) => 43

# Assume only positive whole numbers >=2 are given as argument.

def prime_number(number)
    # Your code goes here
    # If number is equal to 2, return itself
    if number == 2
        return number
    # Factors of a number will always be less than the floor of its square root.
    # Forcing a loop while number is greater than 2, to enable us to check every number under itself.
    elsif number > 2
        while number > 2
        # Finding the numbers square root
        num_sqrt = Math.sqrt(number)
        # Within a range of 2 to the number's square root minus 1 (the next closest number underneath the square root)
        # check to see if any integer is a factor of the number. We can do this by checking to see if any number less
        # than the square root returns a modulus of zero. If it does, it must be divisble by that number, making it
        # a composite number.
            if (2..num_sqrt - 1).detect{|x| number % x == 0}
                # If number is composite, lower number's value by 1 and begin the process again.
                number -= 1
            else
                # If number has no divisors under it's floored square root, then it must be prime and we return that number.
                return number
            end
        end
    end
end

# def prime_number(number)
#     if number == 2
#         return number
#     elsif number > 2
#         while number > 2
#         num_sqrt = Math.sqrt(number)
#             if (2..num_sqrt - 1).detect{|x| number % x == 0}
#                 number -= 1
#             else
#                 return number
#             end
#         end
#     end
# end