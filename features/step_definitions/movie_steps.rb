# Add a declarative step here for populating the DB with movies.

Given(/the following movies exist/) do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

Then(/(.*) seed movies should exist/) do |n_seeds|
  expect(Movie.count).to eq n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then(/I should see "(.*)" before "(.*)"/) do |_e1, _e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  _page_body = page.body

  _match1 = Regexp.new(_e1)
  _match2 = Regexp.new(_e2)

  _index1 = _page_body.index(_match1)
  _index2 = _page_body.index(_match2)

  expect(_index1).not_to be_nil, "Expected to find '#{_e1}' in the page content"
  expect(_index2).not_to be_nil, "Expected to find '#{_e2}' in the page content"
  expect(_index1).to be < _index2, "Expected '#{_e1}' to appear before '#{_e2}', but it did not"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When(/I (un)?check the following ratings: (.*)/) do |_uncheck, _rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  _rating_list.split(',').map(&:strip).each do |rating|
    if _uncheck
      step %{I uncheck "#{rating}" checkbox}
    else
      step %{I check "#{rating}" checkbox}
    end
  end
end



# Part 2, Step 3
Then(/^I should (not )?see the following movies: (.*)$/) do |_no, _movie_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
  _movie_list.split(',').map(&:strip).each do |title|
    if _no
      step %{I should not see "#{title}"}
    else
      step %{I should see "#{title}"}
    end
  end
end

Then(/I should see all the movies/) do
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end


  

### Utility Steps Just for this assignment.

Then(/^debug$/) do
  # Use this to write "Then debug" in your scenario to open a console.
  require "byebug"
  byebug
  1 # intentionally force debugger context in this method
end

Then(/^debug javascript$/) do
  # Use this to write "Then debug" in your scenario to open a JS console
  page.driver.debugger
  1
end

Then(/complete the rest of of this scenario/) do
  # This shows you what a basic cucumber scenario looks like.
  # You should leave this block inside movie_steps, but replace
  # the line in your scenarios with the appropriate steps.
  raise "Remove this step from your .feature files"
end
