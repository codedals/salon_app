class Appointment
  attr_accessor :salon_id, :user_id, :accepted, :product_ids, :start_time, :end_time

  @@firebase ||= Firebase::Client.new(Rails.application.secrets.firebase["base_uri"],Rails.application.secrets.firebase["db_key"])

  TABLE_NAME = "appointments"

  class << self

    def create(params={})
      user_id = params[:user_id]
      salon_id = params[:salon_id]
      start_time = params[:start_time]
      end_time = params[:end_time]
      product_ids = params[:product_ids]
      device_id = params[:device_id]

      response = @@firebase.push(TABLE_NAME, {:user_id => user_id, :salon_id => salon_id, :start_time => start_time, :end_time => end_time, :product_ids => product_ids})

      if response.try(:success?)
        appointment_id = response.body["name"]

        #TODO: send SMS to salon
        #TODO: update user and salon tables
        return appointment_id
      end
    
  end

end
