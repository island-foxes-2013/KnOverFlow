feature "as a user I want to up vote a question " do

  scenario "I am able to vote on a question that I haven't voted on before" do
   it 'user clicks the up vote link' do
     pending
   end
   it 'hits the vote#create' do 
     pending
   end
   it 'creates and saves a vote object' do 
     pending
   end 
   
   it '#update_vote_count' do
    pending
   end 

   it 'the user vote is saved with the respective question' do 
    pending
   end
   
   it 'displays the incremented vote count to the user' do
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

