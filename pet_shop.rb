

def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, value)
  return shop[:admin][:total_cash] += value
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, value)
  return shop[:admin][:pets_sold] += value
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
  count = []
  for pet in shop[:pets]
    if pet[:breed] == breed
        count << breed
    end
  end
  return count
end

def find_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

#OPTIONAL SECTION

def customer_can_afford_pet(customer, pet)
  return true if customer[:cash] >= pet[:price]
  return false
end

def sell_pet_to_customer(shop, pet, customer)
  return "not found" if !shop[:pets].include? pet
  if customer_can_afford_pet(customer, pet)
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(shop, pet[:name])
    shop[:admin][:pets_sold] += 1
    shop[:admin][:total_cash] += pet[:price]
    customer[:cash] -= pet[:price]
  end
end
