module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :room_id
  end

  def connect
    self.room_id = cookies['quiz_id']
  end

end
