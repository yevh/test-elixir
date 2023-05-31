defmodule SimpleAppRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/bpi" do
    send_resp(conn, 200, Coinbase.bpi_current_price)
  end

  match _ do
    send_resp(conn, 404, "Wrong place mate")
  end
end