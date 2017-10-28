class Connect < ApplicationRecord
  belongs_to :connector, foreign_key: 'connector_id', class_name: 'User'
  belongs_to :connecting, foreign_key: 'connecting_id', class_name: 'User'

end
