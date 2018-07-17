class User
  def self.current_id=(val)
    Thread.current[:user_id] = val
    Thread.current[:user] = nil
  end
  def self.current_id
    Thread.current[:user_id]
  end
  def self.current
    Thread.current[:user] ||= begin
      raise "No user set" unless current_id
      # TODO Implement persistent users in your database
      User.new
    end
  end

  def admin?
    # TODO your authorization framework should handle this role check
    true
  end
end
