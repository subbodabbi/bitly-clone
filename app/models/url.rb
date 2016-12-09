class Url < ActiveRecord::Base

after_initialize :set_click_count
before_validation :shorten
validates :long_url, :short_url, presence: true
validates :short_url, uniqueness: true
validates :long_url, format: { with: /\A(?:(ftp|http|https):\/\/)?(?:[\w-]+\.)+[a-z]{3,6}\z/}

  def set_click_count
    self.click_count ||= 0
  end

   def shorten
     self.short_url = SecureRandom.hex(4) 
   end

  def increment_count
    self.click_count +=1
  end

end
