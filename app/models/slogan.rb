class Slogan < ActiveRecord::Base
  def content_slogan
    eval(self.content)[I18n.locale] 
  end
end
