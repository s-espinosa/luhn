class Luhn
  def initialize(number)
    @number = number
    @valid  = nil
  end

  def valid?
    @valid ||= check
  end

  def check
    total = 0
    @number.digits.each_with_index do |digit, index|
      if index % 2 == 0
        total += digit
      else
        total += double_and_sum[digit]
      end
    end
    total % 10 == 0
  end

  def double_and_sum
    {
      0 => 0,
      1 => 2,
      2 => 4,
      3 => 6,
      4 => 8,
      5 => 1,
      6 => 3,
      7 => 5,
      8 => 7,
      9 => 9
    }
  end
end

