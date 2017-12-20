@javascript
Feature: Book store

  So that a visitor can visit the books store and apply different filters to view books based on different categories, authors, etc.

  Background:
    Given I have a bookstore of 50 books

  Scenario: A visitor sees a list of books on visiting the home page

    Given I visit the books home page
    Then I should see a list of books in the book store
    Then the number of books in the first page should be 10

  Scenario: A visitor changes the number of books per page

    Given I visit the books home page
    And I change the book per page to 20
    Then the number of books in the first page should be 20

  Scenario: A visitor applies the category filter to the books

    Given I visit the books home page
    And I change the category of the books to "Thriller"
    Then only the books of category "Thriller" should be displayed

  Scenario: A visitor applies the author filter to the books

    Given I visit the books home page
    And I change the author of the books to "Marlon James"
    Then only the books of author "Marlon James" should be displayed


  Scenario: A visitor applies the search filter to search for books

    Given I visit the books home page
    And I change the book per page to 50
    And I apply the search filter to be "The"
    Then all the books matching the name pattern "The" should be displayed


  Scenario: A visitor clicks on more details in one of the books

    Given I visit the books home page
    And I click on "more details" link on the first book
    Then I should be directed to the Show page for the book
