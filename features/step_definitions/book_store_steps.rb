Given(/^I have a bookstore of 50 books$/) do
  seed_books
end

Given(/^I visit the books home page$/) do
  visit books_path
end

Then(/^I should see a list of books in the book store$/) do
  expect(page).to have_xpath("//div[@class='grid-x grid-padding-x small-up-1 medium-up-2 large-up-4 books-data']")
end

Then(/^the number of books in the first page should be (.*?)$/) do |total_books|
  sleep 1
  page.all(:xpath, "//div[@class='grid-x grid-padding-x small-up-1 medium-up-2 large-up-4 books-data']/div").count.should eq(total_books.to_i)
end

And(/^I change the book per page to (.*?)$/) do |total_books|
  find('#books_per_page_select').select(total_books)
end

And(/^I change the category of the books to "([^"]*)"$/) do |category|
  find('#category_select').select(category)
end

Then(/^only the books of category "([^"]*)" should be displayed$/) do |category|
  sleep 1
  page.all(:xpath, "//div[@class='grid-x grid-padding-x small-up-1 medium-up-2 large-up-4 books-data']/div").count.should eq(Book.where(category: Category.find_by(name: category)).count)
end

And(/^I change the author of the books to "([^"]*)"$/) do |author|
  find('#author_select').select(author)
end

Then(/^only the books of author "([^"]*)" should be displayed$/) do |author|
  page.find(:xpath, "//div[@class='grid-x grid-padding-x small-up-1 medium-up-2 large-up-4 books-data']/div").should have_text("by #{author}")
end

And(/^I apply the search filter to be "([^"]*)"$/) do |search|
  fill_in "Search", with: search
  find(".search-books-button").click
end

Then(/^all the books matching the name pattern "([^"]*)" should be displayed$/) do |search|
  total_books = search_book(search).count
  step "the number of books in the first page should be #{total_books}"
end

And(/^I click on "([^"]*)" link on the first book$/) do |link|
  page.all(:xpath, "//div[@class='grid-x grid-padding-x small-up-1 medium-up-2 large-up-4 books-data']/div").first.find("a", text: link).click
end

Then(/^I should be directed to the Show page for the book$/) do
  expect(page).to have_current_path(book_path(1))
end