# Exam: Shut the Box, Legacy Code Edition

This is a learning situation, to demonstrate your capabilities regarding testing.

## Setup

Fork and clone the repository. `cd` into the project directory and execute
`rspec`. If you do not have `rspec` already, there is a _Gemfile_, so
install `rspec` with `bundle install`. The only dependency is rspec.

## Scenario

You have just taken over a legacy implementation of the game
[Shut the Box](https://www.youtube.com/watch?v=u54wjDFjweU&ab_channel=Cogan).
There is an example program that "drives" the simulation. Run it:

```
ruby lib/driver.rb
```

You should see the output of the game, which shows the tiles that are still
face up in the box, and the results of the first dice roll. The program expects
the player to enter the numbers of the tiles that they wish to flip down, or a
special character to indicate they give up.

The numbers a player enters must:

- sum together to an amount equal to the sum of the dice roll. For example, if the dice roll is 3 and 2, a player can enter '2 3', '1 4', or '5', which all sum to 5, the total of the dice roll 3 and 2.
- correspond to the numbers on the tiles that are still up. For example, if the only tiles remaining are 1, 2 and 3, the player can only enter '1', '2', '3', '1 2', '1 3', '2 3' and '1 2 3'.

After specifying the tiles to flip down, a new roll of the dice occurs, and the
player can specify a new set of numbers. Play continues until all the tiles are
flipped down or when the player gives up.

The score of the game is the sum of the remaining tiles that are up.
The goal is to get the lowest possible score.

## What To Do

Run the test suite.

```
rspec
```

You should see a single failing test and a handful of skipped tests. Read the
output of the failing test, and start there.

### Step 1

Read the tests in _spec/tile_set_spec.rb_.

Take a look at which test is failing. Read the entire test suite, starting with the
first line of code. Replace the intentionally failing `raise` with a valid test,
covering the legacy code. See _lib/tile_set_spec.rb_ to get a sense of how and what to
test.

Once passing the first test, commit.

### Step 2

Focus on the remaining tests in _spec/tile_set_spec.rb_. Remove each `skip` and write
valid tests. Commit after each test passes.

Ideally, be sure that all of your TileSet tests are passing before you continue
to **Step 3**.

### Step 3

Now, your goal is to examine this legacy codebase and get as much of it under
test as possible. There are many paths you may take, techniques you may use, and
there is probably more code to test than what you have time for. Make your decisions
and be methodical. One suggested order to pursue is:

- Die
- Tile
- Box
- Command
- Game

Do not try to be too clever with your tests. Be methodical, straightforward, and
explicit.

Commit after each passing test.

### Step 4

When time is up, be sure to `git status` and commit any lingering uncommited changes.

Then, push.

Then, create a pull request.

---

&copy; 2022 Yong Bakos. All rights reserved.
