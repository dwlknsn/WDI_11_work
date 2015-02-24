Debugging Rails 
=======
[i]: c. 45mins
[i]: Give out starter code

When coding our terminal and Sinatra apps, we've been doing a lot of EDD (**Error Driven Development**). So far we have used the `gem pry` or `gem pry-byebug` for breakpoint debugging and they've been very helpful! We need to know how to do this in Rails too; how to display and solve our errors as we develop.

The good news is that there's other things built into Rails, and extra gems we can add for an even easier time!

## Manual debugging

While you're running a Rails server, it spews lots of output to the console window. 

- *The amount of detail depends on the environment you're running under; in development, there's a lot more info than production.* 

Any `puts` commands you call in your code output to this console along with all the Rails default output, and in the background.

In the home action add:

```
def home
puts "BIG FAT ERROR"
end
```
And reload the page and look at the terminal output.

###Log File

Rails is also logging this information to a file - because the console messages disappear after a time, or sometimes (in production) are not very accessible at all.

When you start a Rails server, it creates a log file for the environment it's running under

- Check the "Rails.root/log" folder

```
cat log/development.log
tail log/development.log
```
- `cat` shows the contents of a file. 
- `tail` shows the last 10 lines by default. 

You can clear the contents of the log file and Rails will continue to write to it, but if you delete it, you need to restart the Rails server for a new file to be created and logged to.

`puts` does not get logged into the development.log file. If you want to have a record of this, you can use: 

```
logger.debug "FATTER ERROR"
```

## Better debugging

We've had very good results using pry in the command line apps, and even with Sinatra, and we've added it to Rails too and use it in exactly the same way. Or we can make it better!

Add this to your Gemfile:

```
group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'binding_of_caller'
  gem 'better_errors'
end
```

And in the terminal:

```
bundle
```

Now we need to break the app... In the `home` action, add:

```
def home
  x = 10
  y = 100
  1/0
end
```

This gives us much "better errors", and we also get an 'immediates' window in our browser :-)

At the flashing prompt, we can interrogate our app, just like we were at a Pry breakpoint; and we get this functionality now *whenever* we get an exception, so we can debug the issue.

But beware!! DO NOT LEAVE IN PRODUCTION. This is very much "development only" functionality - always make sure the gems are wrapped in a "group" that excludes them from production... or else...

```
  `pwd`
  `ls > /home/michael/hax0rz.txt`
```

## Rails panel

This is a Chrome extension that puts the Rails log file in our browser dev tools.
 
[https://github.com/dejan/rails_panel]()

```
  # Gemfile
  group :development do
    gem 'meta_request'
  end
```

[https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg](install the plugin)
