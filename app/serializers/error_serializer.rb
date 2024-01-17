class ErrorSerializer
  attr_reader :error_message, :status

  def initialize(error_message)
    @error_message = error_message
  end

  def error_json(status)
    { error: { message: @error_message, status: @status } }
  end
end
