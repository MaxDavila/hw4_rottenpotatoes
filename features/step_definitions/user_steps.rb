# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  #flunk "Unimplemented"
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  # debugger
  # 2.should == 2
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

# Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
#   #  ensure that that e1 occurs before e2.
#   #  page.body is the entire content of the page as a string.
#   regexp = /#{e1}.*#{e2}/m
#   page.body.should =~ regexp
# end

# # Make it easier to express checking or unchecking several boxes at once
# #  "When I uncheck the following ratings: PG, G, R"
# #  "When I check the following ratings: G"

# When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
#   # HINT: use String#split to split up the rating_list, then
#   #   iterate over the ratings and reuse the "When I check..." or
#   #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#   rating_list.split.each do |rating|
#     if uncheck.nil? 
#       steps %Q{
#         Given I am on the RottenPotatoes home page
#         When I check "ratings_#{rating}"
#       }
#     else
#       steps %Q{
#         When I uncheck "ratings_#{rating}"
#       }
#     end
#   end
# end

# Then /I should (not )?see movies rated: (.*)/ do |negation, rating_list|
#   # Ensure all the ratings are not present in the page if negation
#   # Else make sure that the number of rows in the page is equal to the DB qty
#   ratings = rating_list.split
#   if negation
#     count = []
#     ratings.each do |rating|
#       count << page.body.scan(/<td>#{rating}<\/td>/)
#     end
#     count = count.flatten.count
#     count.should == 0
#   else
#     rows_in_db = Movie.find_all_by_rating(rating_list.split).count
#     rows_in_page = page.body.scan(/<tr>/).count - 1
#     rows_in_page.should == rows_in_db
#   end
# end

# When /I check (none|all) the ratings/ do |check|
#   if check == "all"
#     Movie.all_ratings.each do |rating|
#       uncheck("ratings_#{rating}")
#     end
#   end
# end

# Then /I should see (all|none) of the movies/ do |display|
#   if display == "all"

#     Movie.all.count.should == page.body.scan(/<tr>/).count - 1
#   end
# end


