# ruby on rails task_list

This is a simple Ruby app using the [Rails](http://rubyonrails.org) framework and sqlite as a database.
You can...
- Create a new task
- Update/Edit an existng task
- Delete an existing task
- Mark a task as complete
- Arrange the tasks within the list of tasks

## Running Locally

Make sure you have [Ruby]and [Rails](https://www.ruby-lang.org) as well as [Bundler](http://bundler.io)

This app uses Rails 5.2.0, ruby 2.5.1 and uses Puma 3.11 as the app server.
```sh
git clone https://github.com/angelikayoder/task_list.git # or download the file
gem install bundler
bundle install
rails s
```

Your app should now be running in your browser on [localhost:3000](http://localhost:3000/).

### Updates
As of 10:55am on Monday 7/23/2018
- Added tests to controller which cover non scaffolded methods.

As of 12:29am on Thursday 7/12/2018
- App's functionality is complete.
- Styling is badly needed to pretty-up the app, additional styling will be added as time allows.
