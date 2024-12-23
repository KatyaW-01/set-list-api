class PizzaShop
  def make_me_a_pizza(type)
    puts "cooking up your #{type} pizza"
    sleep(3)
    puts "One tasty #{type} pizza"
  end
end

PizzaShop.new.make_me_a_pizza("anchovy")