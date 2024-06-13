class SurahsController < ApplicationController
  before_action :set_surah, only: %i[ show edit update destroy ]

  # GET /surahs or /surahs.json
  def index
    @surahs = Surah.order(serial_number: :asc)
  end

  # GET /surahs/1 or /surahs/1.json
  def show
    require "uri"
    require "net/http"

    url = URI("https://api.quran.com/api/v4/verses/by_chapter/#{@surah.serial_number}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/json"

    response = https.request(request)
    puts response.read_body
    @surah_info = response.read_body
  end

  # GET /surahs/new
  def new
    @surah = Surah.new
  end

  # GET /surahs/1/edit
  def edit
  end

  # POST /surahs or /surahs.json
  def create
    @surah = Surah.new(surah_params)

    respond_to do |format|
      if @surah.save
        format.html { redirect_to surah_url(@surah), notice: "Surah was successfully created." }
        format.json { render :show, status: :created, location: @surah }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @surah.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surahs/1 or /surahs/1.json
  def update
    respond_to do |format|
      if @surah.update(surah_params)
        format.html { redirect_to surah_url(@surah), notice: "Surah was successfully updated." }
        format.json { render :show, status: :ok, location: @surah }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @surah.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surahs/1 or /surahs/1.json
  def destroy
    @surah.destroy!

    respond_to do |format|
      format.html { redirect_to surahs_url, notice: "Surah was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import_surahs
    if Surah.count == 0
      surahs = [
        {
          "serial_number": 114,
          "name": "Al-Naas",
          "place_of_revealed": "Makkah",
          "verses": 6,
          "recited": 0,
          "due": 6,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 113,
          "name": "Al-Falaq",
          "place_of_revealed": "Makkah",
          "verses": 5,
          "recited": 0,
          "due": 5,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 112,
          "name": "Al-Ikhlaas",
          "place_of_revealed": "Makkah",
          "verses": 4,
          "recited": 0,
          "due": 4,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 111,
          "name": "Al-Masad",
          "place_of_revealed": "Makkah",
          "verses": 5,
          "recited": 0,
          "due": 5,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 110,
          "name": "An-Nasr",
          "place_of_revealed": "Madinah",
          "verses": 3,
          "recited": 0,
          "due": 3,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 109,
          "name": "Al-Kaafiroon",
          "place_of_revealed": "Makkah",
          "verses": 6,
          "recited": 0,
          "due": 6,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 108,
          "name": "Al-Kawthar",
          "place_of_revealed": "Makkah",
          "verses": 3,
          "recited": 0,
          "due": 3,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 107,
          "name": "Al-Maa'oon",
          "place_of_revealed": "Makkah",
          "verses": 7,
          "recited": 0,
          "due": 7,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 106,
          "name": "Quraysh",
          "place_of_revealed": "Makkah",
          "verses": 4,
          "recited": 0,
          "due": 4,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 105,
          "name": "Al-Feel",
          "place_of_revealed": "Makkah",
          "verses": 5,
          "recited": 0,
          "due": 5,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 104,
          "name": "Al-Humazah",
          "place_of_revealed": "Makkah",
          "verses": 9,
          "recited": 0,
          "due": 9,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 103,
          "name": "Al-'Asr",
          "place_of_revealed": "Makkah",
          "verses": 3,
          "recited": 0,
          "due": 3,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 102,
          "name": "At-Takaathur",
          "place_of_revealed": "Makkah",
          "verses": 8,
          "recited": 0,
          "due": 8,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 101,
          "name": "Al-Qaari'ah",
          "place_of_revealed": "Makkah",
          "verses": 11,
          "recited": 0,
          "due": 11,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 100,
          "name": "Al-'Aadiyaat",
          "place_of_revealed": "Makkah",
          "verses": 11,
          "recited": 0,
          "due": 11,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 99,
          "name": "Az-Zalzalah",
          "place_of_revealed": "Madinah",
          "verses": 8,
          "recited": 0,
          "due": 8,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 98,
          "name": "Al-Bayyinahh",
          "place_of_revealed": "Madinah",
          "verses": 8,
          "recited": 0,
          "due": 8,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 97,
          "name": "Al-Qadr",
          "place_of_revealed": "Makkah",
          "verses": 5,
          "recited": 0,
          "due": 5,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 96,
          "name": "Al-Alaq",
          "place_of_revealed": "Makkah",
          "verses": 19,
          "recited": 0,
          "due": 19,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 95,
          "name": "At-Teen",
          "place_of_revealed": "Makkah",
          "verses": 8,
          "recited": 0,
          "due": 8,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 94,
          "name": "(Al-Inshirah)",
          "place_of_revealed": "Makkah",
          "verses": 8,
          "recited": 0,
          "due": 8,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 93,
          "name": "Ad-Dhuha",
          "place_of_revealed": "Makkah",
          "verses": 11,
          "recited": 0,
          "due": 11,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 92,
          "name": "Al-Layl",
          "place_of_revealed": "Makkah",
          "verses": 21,
          "recited": 0,
          "due": 21,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 91,
          "name": "Ash-Shams",
          "place_of_revealed": "Makkah",
          "verses": 15,
          "recited": 0,
          "due": 15,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 90,
          "name": "Al-Balad",
          "place_of_revealed": "Makkah",
          "verses": 20,
          "recited": 0,
          "due": 20,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 89,
          "name": "Al-Fajr",
          "place_of_revealed": "Makkah",
          "verses": 30,
          "recited": 0,
          "due": 30,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 88,
          "name": "Al-Ghaashiyah",
          "place_of_revealed": "Makkah",
          "verses": 26,
          "recited": 0,
          "due": 26,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 87,
          "name": "Al-A'laa",
          "place_of_revealed": "Makkah",
          "verses": 19,
          "recited": 0,
          "due": 19,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 86,
          "name": "At-Taariq",
          "place_of_revealed": "Makkah",
          "verses": 17,
          "recited": 0,
          "due": 17,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 85,
          "name": "Al-Burooj",
          "place_of_revealed": "Makkah",
          "verses": 22,
          "recited": 0,
          "due": 22,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 84,
          "name": "Al-Inshiqaaq",
          "place_of_revealed": "Makkah",
          "verses": 25,
          "recited": 0,
          "due": 25,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 83,
          "name": "Al-Mutaffifeen",
          "place_of_revealed": "Makkah",
          "verses": 36,
          "recited": 0,
          "due": 36,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 82,
          "name": "Al-Infitar",
          "place_of_revealed": "Makkah",
          "verses": 19,
          "recited": 0,
          "due": 19,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 81,
          "name": "At-Takweer",
          "place_of_revealed": "Makkah",
          "verses": 29,
          "recited": 0,
          "due": 29,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 80,
          "name": "Abasa",
          "place_of_revealed": "Makkah",
          "verses": 42,
          "recited": 0,
          "due": 42,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 79,
          "name": "An-Naazi'aat",
          "place_of_revealed": "Makkah",
          "verses": 46,
          "recited": 0,
          "due": 46,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 78,
          "name": "An-Naba'",
          "place_of_revealed": "Makkah",
          "verses": 40,
          "recited": 0,
          "due": 40,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 77,
          "name": "Al-Mursalaat",
          "place_of_revealed": "Makkah",
          "verses": 50,
          "recited": 0,
          "due": 50,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 76,
          "name": "Al-Insaan",
          "place_of_revealed": "Madinah",
          "verses": 31,
          "recited": 0,
          "due": 31,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 75,
          "name": "Al-Qiyamah",
          "place_of_revealed": "Makkah",
          "verses": 40,
          "recited": 0,
          "due": 40,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 74,
          "name": "Al-Muddaththir",
          "place_of_revealed": "Makkah",
          "verses": 56,
          "recited": 0,
          "due": 56,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 73,
          "name": "Al-Muzzammil",
          "place_of_revealed": "Makkah",
          "verses": 20,
          "recited": 0,
          "due": 20,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 72,
          "name": "Al-Jinn",
          "place_of_revealed": "Makkah",
          "verses": 28,
          "recited": 0,
          "due": 28,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 71,
          "name": "Nooh",
          "place_of_revealed": "Makkah",
          "verses": 28,
          "recited": 0,
          "due": 28,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 70,
          "name": "Al-Ma'aarij",
          "place_of_revealed": "Makkah",
          "verses": 44,
          "recited": 0,
          "due": 44,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 69,
          "name": "Al-Haaqqa",
          "place_of_revealed": "Makkah",
          "verses": 52,
          "recited": 0,
          "due": 52,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 68,
          "name": "Al-Qalam",
          "place_of_revealed": "Makkah",
          "verses": 52,
          "recited": 0,
          "due": 52,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 67,
          "name": "Al-Mulk",
          "place_of_revealed": "Makkah",
          "verses": 30,
          "recited": 0,
          "due": 30,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 66,
          "name": "At-Tahreem",
          "place_of_revealed": "Madinah",
          "verses": 12,
          "recited": 0,
          "due": 12,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 65,
          "name": "At-Talaq",
          "place_of_revealed": "Madinah",
          "verses": 12,
          "recited": 0,
          "due": 12,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 64,
          "name": "At-Taghabun",
          "place_of_revealed": "Madinah",
          "verses": 18,
          "recited": 0,
          "due": 18,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 63,
          "name": "Al-Munafiqoon",
          "place_of_revealed": "Madinah",
          "verses": 11,
          "recited": 0,
          "due": 11,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 62,
          "name": "Al-Jumu'ah",
          "place_of_revealed": "Madinah",
          "verses": 11,
          "recited": 0,
          "due": 11,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 61,
          "name": "As-Saff",
          "place_of_revealed": "Madinah",
          "verses": 14,
          "recited": 0,
          "due": 14,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 60,
          "name": "Al-Mumtahanah",
          "place_of_revealed": "Madinah",
          "verses": 13,
          "recited": 0,
          "due": 13,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 59,
          "name": "Al-Hashr",
          "place_of_revealed": "Madinah",
          "verses": 24,
          "recited": 0,
          "due": 24,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 58,
          "name": "Al-Mujadila",
          "place_of_revealed": "Madinah",
          "verses": 22,
          "recited": 0,
          "due": 22,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 57,
          "name": "Al-Hadeed",
          "place_of_revealed": "Madinah",
          "verses": 29,
          "recited": 0,
          "due": 29,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 56,
          "name": "Al-Waqi'a",
          "place_of_revealed": "Makkah",
          "verses": 96,
          "recited": 0,
          "due": 96,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 55,
          "name": "Ar-Rahman",
          "place_of_revealed": "Madinah",
          "verses": 78,
          "recited": 0,
          "due": 78,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 54,
          "name": "Al-Qamar",
          "place_of_revealed": "Makkah",
          "verses": 55,
          "recited": 0,
          "due": 55,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 53,
          "name": "An-Najm",
          "place_of_revealed": "Makkah",
          "verses": 62,
          "recited": 0,
          "due": 62,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 52,
          "name": "At-Toor",
          "place_of_revealed": "Makkah",
          "verses": 49,
          "recited": 0,
          "due": 49,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 51,
          "name": "Adh-Dhaariyaat",
          "place_of_revealed": "Makkah",
          "verses": 60,
          "recited": 0,
          "due": 60,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 50,
          "name": "Qaaf",
          "place_of_revealed": "Makkah",
          "verses": 45,
          "recited": 0,
          "due": 45,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 49,
          "name": "Al-Hujuraat",
          "place_of_revealed": "Madinah",
          "verses": 18,
          "recited": 0,
          "due": 18,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 48,
          "name": "Al-Fath",
          "place_of_revealed": "Madinah",
          "verses": 29,
          "recited": 0,
          "due": 29,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 47,
          "name": "Muhammad",
          "place_of_revealed": "Madinah",
          "verses": 38,
          "recited": 0,
          "due": 38,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 46,
          "name": "Al-Ahqaaf",
          "place_of_revealed": "Makkah",
          "verses": 35,
          "recited": 0,
          "due": 35,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 45,
          "name": "Al-Jaathiyah",
          "place_of_revealed": "Makkah",
          "verses": 37,
          "recited": 0,
          "due": 37,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 44,
          "name": "Ad-Dukhaan",
          "place_of_revealed": "Makkah",
          "verses": 59,
          "recited": 0,
          "due": 59,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 43,
          "name": "Az-Zukhruf",
          "place_of_revealed": "Makkah",
          "verses": 89,
          "recited": 0,
          "due": 89,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 42,
          "name": "Ash_Shooraa",
          "place_of_revealed": "Makkah",
          "verses": 53,
          "recited": 0,
          "due": 53,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 41,
          "name": "Fussilat",
          "place_of_revealed": "Makkah",
          "verses": 54,
          "recited": 0,
          "due": 54,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 40,
          "name": "Ghafir",
          "place_of_revealed": "Makkah",
          "verses": 85,
          "recited": 0,
          "due": 85,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 39,
          "name": "Az-Zumar",
          "place_of_revealed": "Makkah",
          "verses": 75,
          "recited": 0,
          "due": 75,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 38,
          "name": "Saad",
          "place_of_revealed": "Makkah",
          "verses": 88,
          "recited": 0,
          "due": 88,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 37,
          "name": "As-Saaffaat",
          "place_of_revealed": "Makkah",
          "verses": 182,
          "recited": 0,
          "due": 182,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 36,
          "name": "Ya-Sin",
          "place_of_revealed": "Makkah",
          "verses": 83,
          "recited": 0,
          "due": 83,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 35,
          "name": "Faatir",
          "place_of_revealed": "Makkah",
          "verses": 45,
          "recited": 0,
          "due": 45,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 34,
          "name": "Saba (surah)",
          "place_of_revealed": "Makkah",
          "verses": 54,
          "recited": 0,
          "due": 54,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 33,
          "name": "Al-Ahzaab",
          "place_of_revealed": "Madinah",
          "verses": 73,
          "recited": 0,
          "due": 73,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 32,
          "name": "As-Sajda",
          "place_of_revealed": "Makkah",
          "verses": 30,
          "recited": 0,
          "due": 30,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 31,
          "name": "Luqmaan",
          "place_of_revealed": "Makkah",
          "verses": 34,
          "recited": 0,
          "due": 34,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 30,
          "name": "Ar-Rum",
          "place_of_revealed": "Makkah",
          "verses": 60,
          "recited": 0,
          "due": 60,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 29,
          "name": "Al-Ankabut",
          "place_of_revealed": "Makkah",
          "verses": 69,
          "recited": 0,
          "due": 69,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 28,
          "name": "Al-Qasas",
          "place_of_revealed": "Makkah",
          "verses": 88,
          "recited": 0,
          "due": 88,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 27,
          "name": "An-Naml",
          "place_of_revealed": "Makkah",
          "verses": 93,
          "recited": 0,
          "due": 93,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 26,
          "name": "Ash-Shu'ara",
          "place_of_revealed": "Makkah",
          "verses": 227,
          "recited": 0,
          "due": 227,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 25,
          "name": "Al-Furqan",
          "place_of_revealed": "Makkah",
          "verses": 77,
          "recited": 0,
          "due": 77,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 24,
          "name": "An-Nur",
          "place_of_revealed": "Madinah",
          "verses": 64,
          "recited": 0,
          "due": 64,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 23,
          "name": "Al-Mu'minun",
          "place_of_revealed": "Makkah",
          "verses": 118,
          "recited": 0,
          "due": 118,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 22,
          "name": "Al-Hajj",
          "place_of_revealed": "Madinah",
          "verses": 78,
          "recited": 0,
          "due": 78,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 21,
          "name": "Al-Anbiya",
          "place_of_revealed": "Makkah",
          "verses": 112,
          "recited": 0,
          "due": 112,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 20,
          "name": "Ta-Ha",
          "place_of_revealed": "Makkah",
          "verses": 135,
          "recited": 0,
          "due": 135,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 19,
          "name": "Maryam",
          "place_of_revealed": "Makkah",
          "verses": 98,
          "recited": 0,
          "due": 98,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 18,
          "name": "Al-Kahf",
          "place_of_revealed": "Makkah",
          "verses": 110,
          "recited": 0,
          "due": 110,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 17,
          "name": "Al-Isra",
          "place_of_revealed": "Makkah",
          "verses": 111,
          "recited": 0,
          "due": 111,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 16,
          "name": "An-Nahl",
          "place_of_revealed": "Makkah",
          "verses": 128,
          "recited": 0,
          "due": 128,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 15,
          "name": "Al-Hijr",
          "place_of_revealed": "Makkah",
          "verses": 99,
          "recited": 0,
          "due": 99,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 14,
          "name": "Ibrahim",
          "place_of_revealed": "Makkah",
          "verses": 52,
          "recited": 0,
          "due": 52,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 13,
          "name": "Ar-Ra'd",
          "place_of_revealed": "Madinah",
          "verses": 43,
          "recited": 0,
          "due": 43,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 12,
          "name": "Yusuf",
          "place_of_revealed": "Makkah",
          "verses": 111,
          "recited": 0,
          "due": 111,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 11,
          "name": "Hud",
          "place_of_revealed": "Makkah",
          "verses": 123,
          "recited": 0,
          "due": 123,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 10,
          "name": "Yunus",
          "place_of_revealed": "Makkah",
          "verses": 109,
          "recited": 0,
          "due": 109,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 9,
          "name": "At-Tawbah",
          "place_of_revealed": "Madinah",
          "verses": 129,
          "recited": 0,
          "due": 129,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 8,
          "name": "Al-Anfal",
          "place_of_revealed": "Madinah",
          "verses": 75,
          "recited": 0,
          "due": 75,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 7,
          "name": "Al-A'raf",
          "place_of_revealed": "Makkah",
          "verses": 206,
          "recited": 0,
          "due": 206,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 6,
          "name": "Al-An'am",
          "place_of_revealed": "Makkah",
          "verses": 165,
          "recited": 0,
          "due": 165,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 5,
          "name": "Al-Ma'idah",
          "place_of_revealed": "Madinah",
          "verses": 120,
          "recited": 0,
          "due": 120,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 4,
          "name": "An-Nisa",
          "place_of_revealed": "Madinah",
          "verses": 176,
          "recited": 0,
          "due": 176,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 3,
          "name": "Al Imran",
          "place_of_revealed": "Madinah",
          "verses": 200,
          "recited": 0,
          "due": 200,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 2,
          "name": "Al-Baqarah",
          "place_of_revealed": "Madinah",
          "verses": 286,
          "recited": 0,
          "due": 286,
          "status": "Not Started",
          "full_recite_count": 0
        },
        {
          "serial_number": 1,
          "name": "Al-Fatiha",
          "place_of_revealed": "Makkah",
          "verses": 7,
          "recited": 0,
          "due": 7,
          "status": "Not Started",
          "full_recite_count": 0
        }
      ]

      surahs.each do |surah|
        Surah.create(surah)
      end
    else
      p "All surah are imported"
    end


    render :nothing => true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surah
      @surah = Surah.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def surah_params
      params.require(:surah).permit(:serial_number, :place_of_revealed, :verses, :recited, :due, :status, :full_recite_count, :starting_date, :completion_date)
    end
end
