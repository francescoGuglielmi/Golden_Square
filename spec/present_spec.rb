require "present"

RSpec.describe Present do 
    context "checks if there is a task or not" do
        it "wraps and unwrap a value" do
            present = Present.new
            present.wrap("a string")
            result1 = present.unwrap
            expect(result1).to eq "a string"
        end
        it "fails if we unwrap with no contents present" do
            present = Present.new
            expect { present.unwrap }.to raise_error "No contents have been wrapped."
        end
        it "fails if we wrap a content while another content exists" do
            present = Present.new
            present.wrap("something")
            expect { present.wrap("something else") }.to raise_error "A content has already been wrapped."
        end
    end
end

