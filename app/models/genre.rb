class Genre < ApplicationRecord

  belongs_to :shop

  enum name:{深煎り:1 ,浅煎り:2}

end
