class FakeRecord

  def initialize args = {}
    args.each { |key, value| send "#{key}=", value }
  end

end