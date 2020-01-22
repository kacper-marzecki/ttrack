export SECRET_KEY_BASE="$(mix phx.gen.secret)"
export DATABASE_URL="postgresql://postgres:postgres@localhost:5432/ttrack_dev"
MIX_ENV=prod mix release
MIX_ENV=prod APP_NAME=ttrack PORT=4000 _build/prod/rel/ttrack/bin/ttrack start
