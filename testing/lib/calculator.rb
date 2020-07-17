class Calculator
  def add(*args)
    args.inject(0){|sum, n| sum + n}
  end

  def multiply(*args)
    args.inject{|product, n| product * n}
  end
end
