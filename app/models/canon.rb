class Canon < ActiveRecord::Base
  attr_accessible :body, :category_id

  belongs_to :category
end
