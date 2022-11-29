# chess
Chess board game written in Ruby and tested with RSpec.

## Overview
[Chess](https://en.wikipedia.org/wiki/Chess) is a board game played by two players. The game is played in an 8x8
[chessboard](https://en.wikipedia.org/wiki/Chessboard). At the start, each player controls 16 pieces: one [king](https://en.wikipedia.org/wiki/King_(chess)), one [queen](https://en.wikipedia.org/wiki/Queen_(chess)), two [rooks](https://en.wikipedia.org/wiki/Rook_(chess)), two [bishops](https://en.wikipedia.org/wiki/Bishop_(chess)), two [knights](https://en.wikipedia.org/wiki/Knight_(chess)), and eight [pawns](https://en.wikipedia.org/wiki/Pawn_(chess)). The player who moves first is assigned the color white.

The goal of the game is to [checkmate](https://en.wikipedia.org/wiki/Checkmate) the opponent king's,  a situation that
occurs when the king is under immediate attack (in [check](https://en.wikipedia.org/wiki/Check_(chess))) and there is
no way for it to escape.

This game can be either played Human vs Human, or Human vs AI Computer.

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

Move to the executable directory

```
cd bin/
```

Launch the application
```
$ ./chess
```

Follow the instruction in the terminal to setup the environment.

## Tests
The [spec](https://github.com/Uaitt/chess/tree/main/spec) folder contains ~1000 tests that provide support for the application.

Before running the tests, please be sure to be at the root of the project directory.

You can launch the whole test suite
```
$ rspec
```

Or launch the tests only for one class
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
