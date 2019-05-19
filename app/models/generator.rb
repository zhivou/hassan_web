class Generator < ApplicationRecord

  validates :a_vol,
            :b_vol,
            :c_vol,
            :d_vol,
            :email,
            :first_name,
            :last_name,
            presence: true

  validates_length_of :note, :maximum => 250
end
