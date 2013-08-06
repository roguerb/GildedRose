Feature: Update Items
  The Gilded Rose needs to update it's items once a day

  All items have a sell in value which denotes the number of days we have
  to sell the item. They also have a Quality value which denotes how
  valuable the item is.

  At the end of each day the system should lower both values for every
  item. If the sell by date has passed, Quality degrades twice as fast.
  The Quality of an item should never be negative, or more than 50.

  Some products have special settings that override the default rules:

  * Aged Brie actually increases in Quality the older it gets.

  * Backstage Passes increase in Quality as their SellIn value approaches.
    Quality increases by 2 when there are 10 days or less and by 3 when
    there are 5 days or less, but Quality drops to 0 after the concert.

  * Conjured items degrade in Quality twice as fast as normal items.

  * Sulfuras, being a legendary item, never has to be sold and always has
    a quality of 80.

  Scenario Outline: Updating Items
    Given the item is <item_name>
    And it's quality is <start_q>
    And it's sell_in is <start_s>
    When it is updated <num> times
    Then the quality should be <end_q>
    And the sell in should be <end_s>

    Scenarios: Standard Items
      | item_name | start_q | start_s | num | end_q | end_s |
      | elixir    | 5       | 10      | 15  | 0     | -5    |
      | vest      | 20      | 8       | 10  | 8     | -2    |

    Scenarios: Legendary Items
      | item_name | start_q | start_s | num | end_q | end_s |
      | sulfuras  | 80      | 0       | 1   | 80    | 0     |
      | sulfuras  | 20      | 20      | 1   | 20    | 20    |

    Scenarios: Conjured Items
      | item_name | start_q | start_s | num | end_q | end_s |
    # | conjured  | 20      | 5       | 3   | 14    | 2     | (unimplemented)
    # | conjured  | 20      | 2       | 3   | 12    | -1    | (unimplemented)

    Scenarios: Aged Brie
      | item_name | start_q | start_s | num | end_q | end_s |
      | brie      | 45      | 10      | 20  | 50    | -10   |
      | brie      | 20      | 4       | 4   | 24    | 0     |
      | brie      | 20      | 2       | 4   | 26    | -2    |

    Scenarios: Backstage Passes
      | item_name | start_q | start_s | num | end_q | end_s |
      | concert   | 20      | 11      | 1   | 21    | 10    |
      | concert   | 20      | 8       | 1   | 22    | 7     |
      | concert   | 20      | 4       | 1   | 23    | 3     |
      | concert   | 20      | 0       | 1   | 0     | -1    |
