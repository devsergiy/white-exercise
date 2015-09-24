class GroupEvent < ActiveRecord::Base
  default_scope { where.not(removed: true) }

end
