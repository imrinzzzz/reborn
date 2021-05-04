# Reborn

A simple Phoenix web application displaying Phoenix Live Dashboard.

## How to run the application

### Without Docker
To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### With Docker
You can also run using docker:

- First, build docker-compose file with `docker-compose build`
- Then run docker-compose file with `docker-compose up`
- Finally run `docker-compose exec web mix ecto.setup` for first time use

Now you can visit [`localhost:4000`](http://locahost:4000) from your browser.

---

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

## Special Thanks

This project mainly follows guidelines from [Phoenix documentations](https://hexdocs.pm/phoenix/Phoenix.html) and [Phoenix Live Dashboard documentations](https://hexdocs.pm/phoenix_live_dashboard/Phoenix.LiveDashboard.html#content) on [hexdocs](https://hexdocs.pm). The guides are really clear and helpful, so be sure to check it out!

Another guide I used is from this [dev.to post](https://dev.to/noelworden/elixir-phoenix-project-dockerizing-10p7) on how to create a dockerfile and docker-compose file. As a beginner, this is really useful!
