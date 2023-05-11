defmodule Coinbase do
  @moduledoc """  
	A module that implements functions for performing simple  
	mathematic calculations  
	"""
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.coindesk.com"
  plug Tesla.Middleware.Headers, [{"Content-Type", "application/json"}]
  plug Tesla.Middleware.JSON

  def bpi_current_price do
    {:ok, response} = get("/v1/bpi/currentprice.json")
    response.body
  end
end