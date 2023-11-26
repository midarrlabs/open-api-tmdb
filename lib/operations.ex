defmodule OapiTmdb.Operations do
  @moduledoc """
  Provides API endpoint related to operations
  """

  @default_client OapiTmdb.Client

  @doc """
  Details

  Query the top level details of a person.

  ## Options

    * `append_to_response`: comma separated list of endpoints within this namespace, 20 items max
    * `language`

  """
  @spec person_details(integer, keyword) :: {:ok, map} | :error
  def person_details(person_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:append_to_response, :language])

    client.request(%{
      args: [person_id: person_id],
      call: {OapiTmdb.Operations, :person_details},
      url: "/3/person/#{person_id}",
      method: :get,
      query: query,
      response: [{200, :map}],
      opts: opts
    })
  end
end
