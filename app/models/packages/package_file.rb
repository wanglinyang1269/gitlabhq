class Packages::PackageFile < ActiveRecord::Base
  belongs_to :package

  validates :package, presence: true

  mount_uploader :file, PackageFileUploader

  scope :recent, -> { reorder(id: :desc) }
end
