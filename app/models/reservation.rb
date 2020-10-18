class Reservation < ApplicationRecord
  belongs_to :customer

  scope :search, -> (search_params) do
    return if search_params.blank?

    room_like(search_params[:room])
      .day_of_week_like(search_params[:day_of_week])
      .time_s_like(search_params[:time_s])
      .time_e_like(search_params[:time_e])
  end
  scope :room_like, -> (room) { where('room LIKE ?', "%#{room}%") if room.present? }
  scope :day_of_week_like, -> (day_of_week) { where('day_of_week LIKE ?', "%#{day_of_week}%") if day_of_week.present? }
  scope :time_s_like, -> (time_s) { where('time_s LIKE ?', "%#{time_s}%") if time_s.present? }
  scope :time_e_like, -> (time_e) { where('time_e LIKE ?', "%#{time_e}%") if time_e.present? }
end
