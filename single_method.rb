class Luhn
  def initialize(number)
    @number = number
    @valid  = nil
  end

  def valid?
    @valid ||= check
  end

  def check
    @number
      .to_s
      .split("")
      .map(&:to_i)
      .reverse
      .map.with_index do |number, index|
        if index % 2 == 1
          number * 2
        else
          number
        end
      end
      .map do |number|
        if number >= 10
          number - 9
        else
          number
        end
      end
      .sum % 10 == 0
  end
end

