default['demo-webapp']['git_repo'] = 'https://github.com/StackStorm/demo-webapp'
# default['demo-webapp']['git_rev']  = 
default['demo-webapp']['user'] = 'demo'

default['demo-webapp']['config'] = {
  app_name: "StackStorm Demo App",
  logging:  "trace",
  listen:   "0.0.0.0",
  port:     8080
  # license_key: 'somekey'
}
