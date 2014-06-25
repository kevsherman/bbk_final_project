describe "GET #index" do
  it "populates an array of guests" do 
    guest = Factory(:guest) 
    get :index assigns(:guest).should eq([guest]) 
  end 

  it "renders the :index view" do 
    get :index response.should render_template :index 
  end 
end 

describe "GET #show" do  
  it "assigns the requested guest to @guest" do 
  guest = Factory(:guest) 
  get :show, id: guest assigns(:guest).should eq(guest) 
end 

  it "renders the #show view" do 
    get :show, id: Factory(:guest) response.should render_template :show 
  end 
end 

