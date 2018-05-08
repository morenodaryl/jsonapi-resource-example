# JSONAPI::Resource example  

A tiny example of a REST API following the specification for building APIs in JSON according to the website [http://jsonapi.org](http://jsonapi.org) specifically implemented with the gem [jsonapi-resources](https://github.com/cerebris/jsonapi-resources).

This examples takes an url of any page and grabs its content with h1, h2, h3 and links and store them in order to show the content through the REST API.

### PROJECT SPECIFICATION
```ruby 
    Ruby: 2.4.1
    RAILS: 5.1.6
```

### RUN THE PROJECT 
```ruby
bundle install 
rails db:create db:migrate
rails s 
```

### URL PATHS
| HTTP VERB | PATH |
|-----------|------|
| GET, POST | /api/v1/websites |
| GET, PUT, DELETE | /api/v1/websites/:id |
| GET       | /api/v1/websites/:id/contents |

### RUN TESTS

```ruby
    # just run the following in the terminal
    rspec
```