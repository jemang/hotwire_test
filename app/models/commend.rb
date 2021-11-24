class Commend < ApplicationRecord
  # has_rich_text :description

  belongs_to :item

  after_create_commit { broadcast_prepend_to 'commends' }
  after_update_commit { broadcast_replace_to 'commends' }
  after_destroy_commit { broadcast_remove_to 'commends' }

  validates :body, presence: true
end
