require ("pp")

def pet_shop_name(pet_shop)
  (pet_shop[:name])
end

def total_cash(pet_shop)
  (pet_shop[:admin][:total_cash])
end

def add_or_remove_cash(pet_shop, cash)
  (pet_shop[:admin][:total_cash] += cash)
end

def pets_sold(pet_shop)
  (pet_shop[:admin][:pets_sold])
end

def increase_pets_sold(pet_shop, pets_sold)
  (pet_shop[:admin][:pets_sold] += pets_sold)
end

def stock_count(pet_shop)
  (pet_shop[:pets].length)
end

def pets_by_breed(pet_shop, pet_breed)
  search = []
  for pet in pet_shop[:pets]
    # accessing the pets array in @pet_shop and calling the 6 hashes within that array with the index locator "pet". Accessing the items in the hashes is done by using pet and through the 6 iterations of the for loop it will apply the functions below to each hash.
    if pet[:breed] == pet_breed
      search.push(pet[:breed])
    end
  end
  return search
end

def find_pet_by_name(pet_shop, pet_name)
  search = Hash.new
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      search = (pet)
    end
  end
  if search.empty?
    search = nil
  end
  return search
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet.delete(:name)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

##############OPTIONAL###############

def customer_can_afford_pet(customer, pet)
  if customer[:cash] >= pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
    add_pet_to_customer(customer, pet[:name])
    remove_pet_by_name(pet_shop, pet[:name])
    increase_pets_sold(pet_shop, 1)
  end
end
