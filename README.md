# Favourite Programming Langauge Tool

This task was to build a simple web application to work out the favourite programming language of a given user on Github.

It is a simple rails app with a form that captures a GitHub username. It then queries the GitHub API (via the [Octokit](https://github.com/octokit/octokit.rb) library) for the user's repos. We then count how many repos there are for each programming language and show the results.

## Getting Started

1. Install the dependencies:
```sh
bundle install
```

2. Run the application locally:
```sh
bin/rails server
```

3. Navigate to the running application: http://localhost:3000/

The tests can also be run via:
```sh
bundle exec rspec spec
```

## TODO

There are a few things which could be improved if there was more time:

1. Caching. Currently we query the API each and everytime we make a request. It would be performant to cache the result of API queries. Then we can fetch the result from the cache, otherwise make a network request for the data.

2. Improve Tests. Currently there are only unit and controller tests. It would be ideal to also have integration tests setup. 
