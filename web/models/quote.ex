defmodule Splurty.Quote do
  use Ecto.Model

  schema "quotes" do
    field :saying, :string
    field :author, :string
  end

  defmodule Queries do
    def random do
      query = Ecto.Adapters.Postgres.query(
        Repo,
        "SELECT * FROM quotes ORDER BY RANDOM() LIMIT 1",
        []
      )

      %Postgrex.Result{ rows: [row] } = query
      {id, saying, author} = row
      
      %Splurty.Quote{id: id, saying: saying, author: author}
    end
    
  end
end