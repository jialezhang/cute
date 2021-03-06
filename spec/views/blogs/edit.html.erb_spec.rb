require 'spec_helper'

describe "blogs/edit" do
  before(:each) do
    @blog = assign(:blog, stub_model(Blog,
      :name => "MyString",
      :content => "MyText",
      :tag => "MyString"
    ))
  end

  it "renders the edit blog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blogs_path(@blog), :method => "post" do
      assert_select "input#blog_name", :name => "blog[name]"
      assert_select "textarea#blog_content", :name => "blog[content]"
      assert_select "input#blog_tag", :name => "blog[tag]"
    end
  end
end
