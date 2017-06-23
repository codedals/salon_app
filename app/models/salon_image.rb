class SalonImage < ApplicationRecord
  belongs_to :salon
  attr_accessor :image_file
  validates_presence_of :image_file

  PREVIEW_LIST_LIMIT = 6

  private 
  after_create :upload_image

  def upload_image
    image = StorageBucket.files.new(
      key: "salon_images/#{id}/#{image_file.original_filename}",
      body: image_file.read,
      public: true
    )

    image.save
    update_columns image_url: image.public_url
  end

  before_destroy :delete_image, if: :image_url

  def delete_image
    bucket_name = StorageBucket.key
    image_uri   = URI.parse image_url

    if image_uri.host == "#{bucket_name}.storage.googleapis.com"
      # Remove leading forward slash from image path
      # The result will be the image key, eg. "images/:id/:filename"
      image_key = image_uri.path.sub("/", "")
      image     = StorageBucket.files.new key: image_key

      image.destroy
    end
  end

  before_update :update_image, if: :image_file
  
  def update_image
    delete_image if image_url?
    upload_image
  end

end
