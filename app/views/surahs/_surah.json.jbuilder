json.extract! surah, :id, :serial_number, :place_of_revealed, :verses, :recited, :due, :status, :full_recite_count, :starting_date, :completion_date, :created_at, :updated_at
json.url surah_url(surah, format: :json)
