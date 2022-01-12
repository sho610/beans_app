class Genre < ApplicationRecord

  has_many :shops

  enum name:{深煎り:1 ,浅煎り:2}

end
