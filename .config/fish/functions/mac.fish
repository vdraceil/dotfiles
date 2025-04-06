# brew
fish_add_path -gP '/opt/homebrew/bin' '/opt/homebrew/sbin'

# openssl
set -gx LDFLAGS '-L/opt/homebrew/opt/openssl/lib'
set -gx CPPFLAGS '-I/opt/homebrew/opt/openssl/include'

# postgres
fish_add_path -gP '/Applications/Postgres.app/Contents/Versions/latest/bin'
