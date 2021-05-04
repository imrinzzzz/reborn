# Set up Elixir, Phoenix, Erlang, and Nodejs for the project
FROM bitwalker/alpine-elixir-phoenix:1.10.3

# create and set a new directory as the working directory
RUN mkdir /app
WORKDIR /app

# copy mix.exs and mix.lock from the local project
# gets all out of date dependencies
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# copy package.json and package-lock.json from asset
# install node dependencies
COPY assets/package.json assets/package-lock.json ./assets/
RUN npm install --prefix ./assets

# copy the rest from the local project
COPY . .

# run mix phx.server
CMD ["mix", "phx.server"]
