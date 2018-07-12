module Slugifiable

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|name| name.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      self.username.downcase.gsub(' ', '-')
    end
  end

end
