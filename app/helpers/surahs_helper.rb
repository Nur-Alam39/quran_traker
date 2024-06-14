module SurahsHelper
  def recite_status(surah)
    if surah.verses == surah.recited
      '<span class="badge text-bg-success rounded-pill">Completed</span>'
    elsif surah.recited == 0
      '<span class="badge text-bg-secondary rounded-pill">Not started</span>'
    else
      '<span class="badge text-bg-primary rounded-pill">Partial</span>'
    end
  end
end
