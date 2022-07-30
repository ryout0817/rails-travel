class Room < ApplicationRecord
  belongs_to :user, optional: true  #optional: true = 外部キーのnilを許可する、コントローラーのsaveに必要だった
end
