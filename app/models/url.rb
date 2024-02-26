class Url < ApplicationRecord
    UNIQUE_ID_LENGTH = 6
    validates :original_url, presence: true. on: :create
    validates_format_of :original_url,
        with: /\A(http|https):\/\/[\w\-]+(\.[\w\-]+)*\.[a-z]{2,5}(\/\S*)?\z/i

    before_create :generate_short_url
    before_create :sanitize

    def generate_short_url
        url = ([*('a'..'z'), *('0'..'9')]).sample(UNIQUE_ID_LENGTH).join
        old_url = Url.where(short_url: url).last
        if old_url.present?
            self.generate_short_url
        else
            self.short_url = url
        end
    end
end
