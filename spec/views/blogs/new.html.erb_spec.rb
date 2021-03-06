require 'spec_helper'

describe "blogs/new" do
  before(:each) do
    assign(:blog, stub_model(Blog,
      :name => "MyString",
      :content => "MyText",
      :tag => "MyString"
    ).as_new_record)
  end

  it "renders new blog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blogs_path, :method => "post" do
      assert_select "input#blog_name", :name => "blog[name]"
      assert_select "textarea#blog_content", :name => "blog[content]"
      assert_select "input#blog_tag", :name => "blog[tag]"
    end
  end
end
