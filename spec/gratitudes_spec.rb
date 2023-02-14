require "gratitudes"

describe Gratitudes do 
    it "prints what you are grateful for" do
        obj = Gratitudes.new
        result1 = obj.add("studying")
        result2 = obj.format
        expect(result1).to eq ["studying"]
        expect(result2).to eq "Be grateful for: studying"
    end
end
