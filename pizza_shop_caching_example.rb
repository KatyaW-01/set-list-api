class PizzaShop

  def pizza_cache
    @pizza_cache ||= {}
  end

  def make_me_a_pizza(type)
    puts "cooking up your #{type} pizza"
    #first, check if this type of za is in the cache:
    if pizza_cache[type]
      pizza_cache[type]
    else
      sleep(3)
      cooked_pizza = "One tasty #{type} pizza"
      pizza_cache[type] = cooked_pizza
      cooked_pizza
    end
  end
end

shop = PizzaShop.new
shop.make_me_a_pizza("anchovy")

puts "Let's try that again.. but faster!"

shop.make_me_a_pizza("anchovy")

puts "what about a different topping?"

shop.make_me_a_pizza("pepperoni")