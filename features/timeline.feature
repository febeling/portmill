Feature: timeline
  In order to view latest build results
  As a macports user
  I want to see a a list of the latest build results
  
  Scenario: list successful builds
    Given a successful build of package "couchdb"
    When I go to the start page
    Then I should see "couchdb"
    And I should see "success"