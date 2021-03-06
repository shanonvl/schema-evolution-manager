load File.join(File.dirname(__FILE__), '../../init.rb')

describe "Add" do

  it "can add a file" do
    path = File.join(Library.base_dir, "bin/sem-add")
    TestUtils.in_test_repo do
      File.open("new.sql", "w") { |out| out << "select 1" }
      Scripts.all("scripts").size.should == 0
      Library.system_or_error("#{path} ./new.sql")
      Scripts.all("scripts").size.should == 1
    end
  end

end
