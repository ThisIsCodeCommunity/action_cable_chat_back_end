Feature: User can acceess two chat rooms


  Background:
    Given the following ChatRooms exist
      | title              | host  |
      | General chat       | Admin |
      | Ruby on Rails talk | Admin |

    And a user visits the site
    And all session cookies are cleared
    And there is nick saved "Thomas"

    Scenario: User can switch between two chat rooms open in separate tabs
      And the user is on the "General chat" page
      And she fills in "Thomas says:" with "Hello World"
      And she clicks on "Send"
      Then she should see "Thomas says: Hello World"
      And she switch to a new window
      And the user is on the "Ruby on Rails talk" page
      And she fills in "Thomas says:" with "RoR is awesome!"
      And she clicks on "Send"
      Then she should see "Thomas says: RoR is awesome!"
      But she should not see "Thomas says: Hello World"

