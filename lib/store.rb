class Store < ActiveRecord::Base
  # you'll find that it has a store_id (integer) column. This is a column that identifies which store each employee belongs to. 
  # It points to the id (integer) column of their store.
  has_many :employees
  belongs_to :store

# Stores must always have a name that is a minimum of 3 characters
  validates :name, length: {minimum: 2}
  #Surrey = Store.create(name: "S", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
  # => this will not added to data
  
# Stores have an annual_revenue that is a number (integer) that must be 0 or more
  validates :annual_revenue, numericality: {only_integer: true, in: 0..}

# BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)
  # validates :store_should_be_women_or_men_apparel
  # def store_should_be_women_or_men_apparel
  #   unless womens_apparel|| mens_apparel
  #     errors.add(:womens_apparel, :mens_apparel, "at least one of the men's or women's apparel")
  #   end
  # end

end
