# chess
Ruby implementation of a chess board game.

## Overview
[Chess](https://en.wikipedia.org/wiki/Chess) is a board game played by two players. The game is played in an 8x8
[chessboard](https://en.wikipedia.org/wiki/Chessboard). Each player controls, at the start, 16 pieces: one king, one
queen, two rooks, two bishops, two knights, and eight pawns. Player who moves first is assigned the color white.

The goal of the game is to [checkmate](https://en.wikipedia.org/wiki/Checkmate) the opponent king's,  a situation that
occurs when the king is under immediate attack (in [check](https://en.wikipedia.org/wiki/Check_(chess))) and there is
no way for it to escape.

This game can be either played Human vs Human, or Human vs AI Computer.

## Usage
To play the game, first [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)
this repository on your local machine.

Move to the project directory

```
$ cd chess
```

Install the gem dependencies listed in Gemfile
```
$ bundle install
```

Launch the application
```
$ ruby main.rb
```

Follow the instruction in the terminal to setup the environment

## Tests
The Spec folder contains ~1000 tests that provide support for the application.

To launch the whole test suite, execute
```
$ rspec
```

Or if you want to launch the tests for just one class, run
```
$ rspec spec/path/class_spec.rb
```

## Built with
1. Ruby 3.1.2
2. Rspec 3.11
   * rspec-core 3.11.0
   * rspec-expectations 3.11.1
   * rspec-mocks 3.11.1
   * rspec-support 3.11.1