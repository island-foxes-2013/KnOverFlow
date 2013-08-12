feature "as a user I want to up vote a question " do

  context "I am able to vote on a question that I haven't voted on before" do
   scenario 'user clicks the up vote link' do
     pending
   end
   scenario 'hits the vote#create' do 
     pending
   end
   scenario 'creates and saves a vote object' do 
     pending
   end 
   
   scenario '#update_vote_count' do
    pending
   end 

   scenario 'the user vote is saved with the respective question' do 
    pending
   end
   
   scenario 'displays the incremented vote count to the user' do
     pending
   end
  end

  scenario "I am unable to vote on a question that I have created" do
  pending
  end

  scenario "I am unable to vote on a question that I have voted on before" do
  pending
  end
end

feature "as a user I want to down vote a question " do

  scenario "that I haven't voted on" do
  pending
  end

  scenario "that I have created" do
  pending
  end

  scenario "that I have voted on before" do
  pending
  end

end

feature "as a user I want to up vote an answer" do

  scenario "that I haven't voted on" do
  pending
  end

  scenario "that I have created" do
  pending
  end

  scenario "that I have voted on before" do
  pending
  end

end

feature "as a user I want to down vote an answer" do

  scenario "that I haven't voted on" do
  pending
  end

  scenario "that I have created" do
  pending
  end

  scenario "that I have voted on before" do
  pending
  end

end

