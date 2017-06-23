class Salon < ApplicationRecord
  has_many :products 
  has_many :salon_images

  validates_presence_of :name, :categories, :payment_options, :specialities

  CATEGORIES = %w(hair nails brow)
  AMENITIES = %w(wifi complimentary\ drinks parking food\ menu\ available drink\ menu\ available)
  KEY_PRODUCTS = %w(l'oreal\ professional kerastase makarizo shiseido)
  AMBIENCE = %w(welcoming cozy modern clean friendly personal)
  SPECIALITIES = %w(highlights japanese\ straightening haircut color hair\ treatment blowouts)
  PAYMENT_OPTIONS = %w(cash\ only credit\ card debit\ card)
  PLACEHOLDER_IMAGE = "placeholder.png"

  attr_accessor :main_image

  def display_image
    main_image_url.nil? ? PLACEHOLDER_IMAGE : main_image_url
  end

  private 
  after_create :upload_image, if: :main_image

  def upload_image
    image = StorageBucket.files.new(
      key: "salon_main_images/#{id}/#{main_image.original_filename}",
      body: main_image.read,
      public: true
    )

    image.save
    update_columns main_image_url: image.public_url
  end

  before_destroy :delete_image, if: :main_image_url

  def delete_image
    bucket_name = StorageBucket.key
    image_uri   = URI.parse main_image_url

    if image_uri.host == "#{bucket_name}.storage.googleapis.com"
      # Remove leading forward slash from image path
      # The result will be the image key, eg. "main_images/:id/:filename"
      image_key = image_uri.path.sub("/", "")
      image     = StorageBucket.files.new key: image_key

      image.destroy
    end
  end

  before_update :update_image, if: :main_image
  
  def update_image
    delete_image if main_image_url?
    upload_image
  end

end
