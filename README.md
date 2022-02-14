<p align="center">
<img src="https://github.com/ciscoLegrand/clTemplate/blob/main/app/assets/images/ciscolegrandlogo.svg" width="100" height="100" border="10"/>
</p>

# RoR 7 base Template

### Environment

> ruby -v 3.0.3
> 
> 
> **rails -v 7.0.1**
> 

### Crate app

```ruby
rails new clTemplate -d postgresql --css tailwind
```

### Development gems

- [gem 'letter_opener'](https://github.com/ryanb/letter_opener)
- [gem 'bullet'](https://github.com/flyerhzm/bullet)
- [gem "rspec-rails"](https://github.com/rspec/rspec-rails)
- [gem "factory_bot_rails"](https://github.com/thoughtbot/factory_bot_rails)
- [gem "faker"](https://github.com/faker-ruby/faker)

### Poduction gems

- [gem 'pg_search'](https://github.com/Casecommons/pg_search)
- [gem 'view_components'](https://github.com/github/view_component)
- [gem 'breadcrumbs_on_rails'](https://github.com/weppos/breadcrumbs_on_rails)
- [gem 'inline_svg'](https://github.com/jamesmartin/inline_svg)
- [gem 'pagy'](https://github.com/ddnexus/pagy)
- [gem 'friendly_id'](https://github.com/norman/friendly_id)

### Instructions

Before start, create your credentials.yml

```bash
# choose your preferred editor eg,
EDITOR="vim" rails credentials:edit
EDITOR="code --wait" rails credentials:edit 

```

Into open file set credentials for the database

```yml
database:
  db_host: <value for connect from wsl to windows postgresql server>
  db_user: <database_username>
  db_pass: <database_password>
  db_name: <database_name>
```

### How to use it

run those commands:

```ruby
# install all gems
bundle install
# create db and run migrations
rails db:create db:migrate
# precompile assets
rake assets:precompile
# start server
rails server
```

with every style or js change or tailwind class addition you need to precompile the assets to see the changes.


