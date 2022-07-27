class Store < ActiveRecord::Base
  has_many :employees
  belongs_to :store

end
