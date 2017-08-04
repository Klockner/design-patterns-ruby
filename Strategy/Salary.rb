class Salary
  attr_reader :amount

  def initialize(amount)
    @amount = amount

    @strategies = {}
    @strategies['Brazil'] = -> { (amount * 0.5) + 330 }
    @strategies['Canada'] = -> { (amount * 0.2) + 100 }
    @strategies['Poland'] = -> { amount * 0.3 }
  end

  def net_salary(country)
    strategy = @strategies[country]
    strategy ? amount - strategy.call : amount
  end
end

puts Salary.new(1000).net_salary('Brazil')
puts Salary.new(1000).net_salary('Canada')
