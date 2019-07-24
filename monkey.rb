class Integer
  def split
    self.to_s.split("").map(&:to_i)
  end

  def remainder_of_0(divisor)
    self % divisor == 0
  end
end

class Array
  def double_evens
    self.map.with_index do |number, index|
      if index % 2 == 1
        number * 2
      else
        number
      end
    end
  end

  def sum_digits_over_ten
    self.map do |number|
      if number >= 10
        number - 9
      else
        number
      end
    end
  end
end

class Luhn
  def initialize(number)
    @number = number
    @valid  = nil
  end

  def valid?
    @valid ||= check
  end

  def check
    @valid = @number
               .split
               .reverse
               .double_evens
               .sum_digits_over_ten
               .sum
               .remainder_of_0(10)
  end
end

