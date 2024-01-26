defmodule OapiTmdb.Operations do
  @moduledoc """
  Provides API endpoint related to operations
  """

  @doc """
  Details

  Query the top level details of a person.

  """
  @spec person_details(integer) :: map
  def person_details(person_id) do

    HTTPoison.get!("https://api.themoviedb.org/3/person/#{person_id}?api_key=#{Application.get_env(:oapi_tmdb, :api_key)}")
    |> handle_response()
  end

  def handle_response(%HTTPoison.Response{status_code: 200, body: body}) do
    Jason.decode!(body)
  end
end
