## TernaryTree

This is a simple implementation of a TernaryTree.

### Running the specs

    gem install rspec -v=2.1.0
    rspec spec/ternary_tree_spec.rb --format documentation

    TernaryTree
      is initially empty
      makes the first item the root
      builds a complex tree properly
      with a root of 7
        inserts a 5 to the left
        inserts a 7 in the middle
        inserts a 9 to the right
        and a left of 5
          inserts a 3 to the left of the 5
          inserts a 6 to the right of the 5
          inserts a 5 as the middle child of 5

    Finished in 0.00714 seconds
    9 examples, 0 failures

