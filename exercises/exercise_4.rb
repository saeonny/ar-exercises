require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
# Exercise 4: Loading a subset of stores
# Borrowing and modifying the code from Exercise one, create 3 more stores:
# Surrey (annual_revenue of 224000, carries women's apparel only)
# Whistler (annual_revenue of 1900000 carries men's apparel only)
# Yaletown (annual_revenue of 430000 carries men's and women's apparel)
# Using the where class method from Active Record, fetch (a collection of) only those stores that carry men's apparel. Assign the results to a variable @mens_stores.
# Loop through each of these stores and output their name and annual revenue on each line.
# Do another fetch but this time load stores that carry women's apparel and are generating less than $1M in annual revenue.
Surrey = Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
Whister = Store.create(name: "Whister", annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
Yaletown = Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

puts "in exercies: #{Store.count}"

@mens_stores = Store.where(mens_apparel: true)

@mens_stores.each {
  |store|
  puts "name: #{store.name}  revenue: #{store.annual_revenue}"
}

# @womens_stores = Store.where(["womens_apparel = true AND annual_revenue < 1000000"])
# @womens_stores = Store.where("womens_apparel = ? AND annual_revenue < ?" ,true, 1000000)
@womens_stores = Store.where(womens_apparel: true , annual_revenue: ..1000000)

# @womens_stores = Store.where(womens_apparel: true , annual_revenue: 3000...430000)
#a..b : between a and b (inclusive) x >= a AND x <= b
#a...b : between a and b exclusive (the max range) x>=a AND x < b

@womens_stores.each {
  |store|
  puts "name: #{store.name}  revenue: #{store.annual_revenue}"
}

