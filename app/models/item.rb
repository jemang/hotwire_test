class Item < ApplicationRecord
  enum status: [:enable, :disable]

  # broadcasts_to -> (i) { :items }
  after_create_commit { broadcast_prepend_to 'items' }
  after_update_commit { broadcast_replace_to 'items' }
  after_destroy_commit { broadcast_remove_to 'items' }

  validates :name, presence: true, uniqueness: true
end
