require 'spec_helper'

describe "blogs/index" do
  before(:each) do
    assign(:blogs, [
      stub_model(Blog,
        :name => "Name",
        :content => "MyText",
        :tag => "Tag"
      ),
      stub_model(Blog,
        :name => "Name",
        :content => "MyText",
        :tag => "Tag"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
  end
end
