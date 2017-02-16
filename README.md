# README

*Adbum* is a minimalistic API to retrieve images on demand. This product is inspired by the need of getting images based
on keywords for advertisement campaigns. The reference describes how to install and run locally the application. Good luck!

## System Dependencies

### Ruby
*Adbum* is a Ruby on Rails application, so you need to have ruby installed. Check if you already have Ruby 
installed. Open the command line and type: 

```ruby -v ``` 

If Ruby responds, and if it shows a version number, then type in the command line: 

```gem --version``` 

If you don't get an error, skip Install Ruby step.

#### Install Ruby

We recommend you to use RVM (Ruby Version Manager). To install it please type in the command line:

```gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3```

```\curl -sSL https://get.rvm.io | bash -s stable --ruby```

If you have Windows or find any problem, please read the RVM install guide for more details: <https://rvm.io/rvm/install> 

### Image Magick

ImageMagick must be installed in order to make [Paperclip](https://github.com/thoughtbot/paperclip) (The image processor 
gem) to work. To ensure that it does, on your command line, run: 

```which convert```  

This will give you the path where that utility is installed. For example, it might return ```/usr/local/bin/convert```.

If you're on Mac OS X, you'll want to run the following with Homebrew:

```brew install imagemagick```

If you are on Ubuntu (or any Debian base Linux distribution), you'll want to run the following with apt-get:

```sudo apt-get install imagemagick -y```

More details can be found at <https://github.com/thoughtbot/paperclip#image-processor>

### SQLite
*Adbum* uses SQLite to persist and query images. To check if you have SQLite installed, please type in the
command line:

```sqlite3```

This will give SQLite version. For example, it might return ```SQLite version 3.7.15.2 2013-01-09 11:53:05```. Otherwise,
 please go to <https://www.tutorialspoint.com/sqlite/sqlite_installation.htm> to continue with its installation.

If you're on Mac OS X, you'll want to run the following with Homebrew:

```brew install sqlite```

## Running the Application

Unpack the provided *adbum.zip* into an accessible folder and go there on your command line

 ```cd path/to/adbum```

Install [bundler](https://bundler.io/)(Ruby Gem Manager)

```gem install bundler```

Run Bundler to download and install needed gems:

```bundle```

Run migrations to initialize the DB:

```rake db:migrate```

We are almost done, now it is time to run the App! You just need to run the rails server:

```rails s```

More info at <http://guides.rubyonrails.org/command_line.html#rails-server>

## Running Tests
*Adbum* uses RSpec to automate tests. To run available tests, type in the command line:

```rspec```

## Deployment

Deployment is not part of this exercise, but if you want to deploy *Adbum*, you can use the [Heroku guide](https://devcenter.heroku.com/articles/getting-started-with-ruby#introduction).

## Author

Copyright (c) 2017 [Mario Enrique Sanchez](https://www.linkedin.com/in/mario-enrique-s%C3%A1nchez-749a1a89/)

*Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation 
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, 
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom 
the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission 
notice shall be included in all copies or substantial portions of the Software.*

