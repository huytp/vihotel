class Slogan < ActiveRecord::Base
  serialize :content, Hash
  def content_slogan
    self.content[I18n.locale]
  end
end
