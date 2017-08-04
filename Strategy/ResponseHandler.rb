class ResponseHandler
  def self.handle(response, strategies)
    strategies[response[:status].to_sym].call
  end
end

class Response
  def show(response)
    # response = external_service.get(params[:id])

    on_success = -> { "Successful response: #{response[:data]}" }
    on_error = -> { "Error: #{response[:error_message]}" }
    on_fail = -> { "Request Failed!" }

    puts ResponseHandler.handle(response, success: on_success, error: on_error, fail: on_fail)
  end
end

Response.new.show({ status: 'success', data: 'sucesso!' })
Response.new.show({ status: 'error', error_message: 'erro!' })
Response.new.show({ status: 'fail' })
