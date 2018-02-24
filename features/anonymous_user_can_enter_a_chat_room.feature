Feature: Anonymous user can enter a chat room
  As an anonymous user
  In order to be able to participate in chats
  I would like to be able to enter a room, set up an nick and chat away...

  Background:
    Given the following ChatRooms exist
      | title        | host  |
      | General chat | Admin |

    And a user visits the site
    And all session cookies are cleared

  Scenario: User assigns a nick before entering a room
    Given she fills in "Nickname" with "Nick"
    And she clicks on "Set Nickname"
    Then she should see "Welcome Nick"
    And there should be a session cookie set to "Nick"
    Then she should see "Choose a chat room"
    And she selects "General chat" from "Available Rooms"
    Then she should see a chat window
    And she should see "Nick"
    And she should see a message input field
    And she should see a "Send" button


Scenario: User creates a new chat room
  Given she fills in "Nickname" with "Nick"
  And she clicks on "Set Nickname"
  Then she should see "Welcome Nick"
  And there should be a session cookie set to "Nick"
  And she fills in "Title" with "New Chat Room"
  And she clicks on "Create Chat room"
  Then she should be on the "New Chat Room" page
