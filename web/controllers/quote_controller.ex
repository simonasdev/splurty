defmodule Splurty.QuoteController do
  use Phoenix.Controller

  alias Splurty.Router
  import Splurty.Router.Helpers

  plug :action

  def homepage(conn, _params) do
    conn
    |> assign(:quote, Splurty.Quote.Queries.random)
    |> render "show.html"
  end

  def index(conn, _params) do
    conn
    |> assign(:quotes, Repo.all(Splurty.Quote))
    |> render("index.html")
  end
  
  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{ "quote" => %{ "saying" => saying, "author" => author } }) do
    Repo.insert %Splurty.Quote{ saying: saying, author: author }

    redirect conn, to: quote_path(conn, :index)
  end

  def show(conn, %{ "id" => id }) do
    conn
    |> assign(:quote, Repo.get(Splurty.Quote, elem(Integer.parse(id), 0)))
    |> render("show.html")
  end

  def edit(conn, %{ "id" => id }) do
    conn
    |> assign(:quote, Repo.get(Splurty.Quote, elem(Integer.parse(id), 0)))
    |> render("edit.html")
  end

  def update(conn, %{ "id" => id, "quote" => %{ "saying" => saying, "author" => author } }) do
    _quote = Repo.get(Splurty.Quote, elem(Integer.parse(id), 0))
    Repo.update %{ _quote | saying: saying, author: author }

    redirect conn, to: quote_path(conn, :show, _quote.id)
  end
  
  
  def destroy(conn, %{ "id" => id }) do
    Repo.delete(Repo.get(Splurty.Quote, elem(Integer.parse(id), 0)))

    redirect conn, to: quote_path(conn, :index)
  end
  
end
