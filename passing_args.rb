class Luhn
  def initialize(number)
    @number = number
    @valid  = nil
  end

  def valid?
    @valid ||= check
  end

  private
  def check
    @valid = remainder_of_0(
      sum_digits_over_ten(
        double_evens(
          split(@number).reverse
        )
      ).sum, 10
    )
  end

  def split(integer)
    integer.to_s.split("").map(&:to_i)
  end

  def remainder_of_0(number, divisor)
    number % divisor == 0
  end

  def double_evens(array)
    array.map.with_index do |number, index|
      if index % 2 == 1
        number * 2
      else
        number
      end
    end
  end

  def sum_digits_over_ten(array)
    array.map do |number|
      if number >= 10
        number - 9
      else
        number
      end
    end
  end
end

