require "make_time"

RSpec.describe "make_time" do
  it "returns the amount of second to read a text" do
    string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nec varius ante. Curabitur ullamcorper urna vitae neque vulputate pulvinar. Nulla cursus augue augue, ut eleifend tellus ullamcorper in. Cras malesuada dui ut aliquam interdum. Praesent fringilla sapien purus, a pretium nisi malesuada eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed quis efficitur odio, vel facilisis arcu. Proin eget bibendum urna. In hac habitasse platea dictumst. Vestibulum nunc sem, interdum dignissim ullamcorper eu, tincidunt nec arcu. Curabitur dignissim a tortor et sollicitudin. Curabitur accumsan nulla malesuada, pretium dui sed, auctor leo. Maecenas congue dictum purus, at ultricies mauris consequat ut. Aenean laoreet elit ipsum, vitae varius ante eleifend sed. Praesent a erat cursus, bibendum nisi in, sollicitudin orci.

    Nulla facilisi. Fusce est urna, condimentum sit amet leo accumsan, blandit hendrerit nisi. Integer nibh risus, sollicitudin at nulla non, malesuada molestie dui. Vivamus nunc mauris, volutpat et orci nec, feugiat tincidunt eros. Suspendisse potenti. Pellentesque auctor nec ligula at venenatis. Nam imperdiet quis velit in commodo. Nulla non gravida quam. Ut tempor aliquet mi faucibus dictum. Mauris luctus ultricies justo, eget ullamcorper mauris pellentesque ac. Suspendisse convallis arcu enim, et congue purus gravida quis. Cras."
    result = make_time(string)
    expect(result).to eq 60.0
  end
end