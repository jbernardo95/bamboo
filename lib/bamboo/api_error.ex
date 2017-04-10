defmodule Bamboo.ApiError do
  @moduledoc """
  Error used to represent a problem when sending emails through an external email service API.
  """

  defexception [:message]

  def raise_api_error(message), do: raise(__MODULE__, message: message)
  def raise_api_error(service_name, response, params, extra_message \\ "") do
    message = """
    There was a problem sending the email through the #{service_name} API.

    Here is the response:

    #{inspect response, limit: :infinity}

    Here are the params we sent:

    #{inspect params, limit: :infinity}
    
    #{extra_message}
    """

    raise(__MODULE__, message: message)
  end
end
