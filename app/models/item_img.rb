class ItemImg < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :img, ImageUploader
end
