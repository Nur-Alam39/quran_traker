class Surah < ApplicationRecord
  # after_update :increment_full_recite

  def increment_full_recite
    if self.verses == self.recited
      self.update_attribute(:full_recite_count, self.full_recite_count + 1)
    end
  end
end
