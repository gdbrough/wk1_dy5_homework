def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,nbr_pets_sold)
  pet_shop[:admin][:pets_sold] += nbr_pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  breed_array = []
  for pets in pet_shop[:pets]
    if pets[:breed] == breed
      breed_array.push(pets[:breed])
    end
  end
  return breed_array
end

def find_pet_by_name(pet_shop, name)
  for pets in pet_shop[:pets]
    if pets[:name] == name
      return pets
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
    return 0 if customer[:pets].empty?
    return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

# Optional (honest)

#1
def customer_can_afford_pet(customer, new_pet)
  return true if customer[:cash] > new_pet[:price]
  return false
end
#2, #3 and #4
def sell_pet_to_customer(pet_shop, pet_to_be_sold, customer)
  if pet_to_be_sold != nil
    if customer_can_afford_pet(customer, pet_to_be_sold)
      add_pet_to_customer(customer, pet_to_be_sold)
      remove_pet_by_name(pet_shop, pet_to_be_sold)
      increase_pets_sold(pet_shop,1)
      add_or_remove_cash(pet_shop, pet_to_be_sold[:price])
    end
  end
end
