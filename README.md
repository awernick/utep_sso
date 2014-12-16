# UTEP SingleSignOn for Ruby

Authenticate users using UTEP's SingleSignOn

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'utep_sso'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install utep_sso

## Usage

```ruby
# Check if a user is signed in
UTEPSSO.authenticated?(cookies[:UTEP_SE], cookies[:UTEP_SA])

# Authenticate a user using UTEP cookies (will return nil values in the hash for invalid cookies)
UTEPSSO.authenticate(cookies[:UTEP_SE], cookies[:UTEP_SA])
# => {:user_name, :full_name, :email_address, :authenticated, :role_value, :external_user, :@xmlns}

# roles are returned as a binary
#  000010 = faculty
#  000100 = staff
#  010000 = student

# 010110 = user that is a student, faculty and staff 

# Deauthenticate a user
UTEPSSO.deauthenticate(cookies[:UTEP_SE], cookies[:UTEP_SA])

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/utep_sso/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
