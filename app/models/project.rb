class Project < ActiveRecord::Base


  validates :technologies_used, presence: { message: "Are you sure you didn't use any technologies?" }
  validates :name, length: { in: 3..255, message: "Come on, you can give your project a better name than that..." }

end
