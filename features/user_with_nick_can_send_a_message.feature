Feature: User with nick can send a message


  Background:
    Given the following ChatRooms exist
      | title        | host  |
      | General chat | Admin |

  Scenario:
    And a user visits the site
    And all session cookies are cleared
    And there is nick saved "Thomas"
    And the user is on the "General chat" page
    And she fills in "Thomas says:" with "Hello World"
    And she clicks on "Send"
    Then she should see "Thomas says: Hello World"
