module Slugifiable

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.each do |obj|
      if obj.slug == slug
        return obj
      end
    end
  end

end


# https://www.codewithjason.com/put-rails-modules/
