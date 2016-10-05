class RoomFeature < ActiveRecord::Base
  def name_with_initial
    "#{eval(name)[I18n.locale]}"
  end
end
