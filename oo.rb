class Luhn
  def initialize(number)
    @number = number
    @valid  = nil
  end

  def valid?
    @valid ||= check
  end

  def check
    digits   = split(@number)
    reversed = reverse(digits)
    doubled  = double_evens(reversed)
    summed   = sum_digits_over_ten(doubled)
    total    = sum_all_digits(summed)
    @valid   = check_remainder(total)
  end

  def split(number)
    @number.to_s.split('').map(&:to_i)
  end

  def reverse(digits)
    digits.reverse
  end

  def double_evens(reversed)
    reversed.map.with_index do |number, index|
      if index % 2 == 1
        number * 2
      else
        number
      end
    end
  end

  def sum_digits_over_ten(doubled)
    doubled.map do |number|
      if number >= 10
        number - 9
      else
        number
      end
    end
  end

  def sum_all_digits(summed)
    summed.sum
  end

  def check_remainder(total)
    total % 10 == 0
  end
end
