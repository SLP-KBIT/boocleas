class Biblio < ActiveRecord::Base
  belongs_to :book
  belongs_to :shelf
end
