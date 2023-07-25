class Excavator < ApplicationRecord
  belongs_to :ticket
  has_one :company
end
