class MechanicalProp < ApplicationRecord
  validates :carbon,
            :structure,
            presence: true

  validates :carbon,
            :structure,
            length: { in: 1..10 }

  validates :structure, numericality:
      { greater_than: 0,
        less_than_or_equal_to: 100 }

  validates :carbon, numericality:
      { greater_than: 0.0,
        less_than_or_equal_to: 0.4 }

  ##
  # Will update db based on calculation for all 3.
  # Provide current @mechanical_prop that the method would know
  # what record needs to be updated
  #
  def self.update_calculation(props, field, value)
    props.update_attribute(field, value)
  end
end
