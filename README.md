# chess
Chess board game written in Ruby and tested with RSpec.

## Overview
This is a command line interface for a chess board game. The game can be either played Human vs Human, or Human vs Computer.

In order to run this project, be sure to have Ruby installed on your local machine. If you don't have it already, go through
[this guide](https://www.ruby-lang.org/en/documentation/installation/) to set it up.

The project uses the Rspec framework for testing. If you are not familiar with this testing framework and want to know more, take a look at the [Rspec documentation](https://rspec.info/).

## Usage
To play the game, first [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)
this repository on your local machine.

Move to the project directory

```
$ cd chess/
```

Install the gem dependencies listed in Gemfile
```
$ bundle install
```

Launch the application
```
$ bin/chess
```

Follow the instruction in the terminal to setup the environment.

## Tests
The [spec/](https://github.com/Uaitt/chess/tree/main/spec) folder contains ~1000 tests that provide support for the application.

It's recommended to run the tests at the root of the project directory, in order to get a more expressive output thanks to
the `.rspec` file. You can still, if you want, move into the `spec/` folder and launch the specs from one of its nested directories.

Assuming that you are at the root of the project directory, you can launch the whole test suite
```
$ rspec
```

Or launch the tests only for one class
```
$ rspec spec/path/class_spec.rb
```

## Dependencies
1. Ruby 3.1.2
2. Rspec 3.11
   * rspec-core 3.11.0
   * rspec-expectations 3.11.1
   * rspec-mocks 3.11.1
   * rspec-support 3.11.1
