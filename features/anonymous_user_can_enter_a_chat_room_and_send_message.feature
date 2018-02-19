Feature: Anonymous user can enter a chat room and send message
  As an anonymous user
  In order to be able to participate in chats
  I would like to be able to enter a room, set up an nick and chat away...


  Scenario: User assigns a nick before entering a room
    Given a user visits the site
    And she fills in "Nickname" with "Nick"
    Then she should see "Choose a chat room"
    And she selects "General chat" from "Available rooms"
    Then she should see a chat window
    And she should see "Nick"
    And she should see a message input field
    And she should see a "Send" button


  Scenario: User fails to assign nick and is prevented from entering a room