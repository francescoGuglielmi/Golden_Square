require "string_builder"

describe StringBuilder do
    it "returns either string length or string" do
        string = StringBuilder.new
        string.add("hello")
        result1 = string.size
        result2 = string.output
        expect(result1).to eq 5
        expect(result2).to eq "hello"
    end
end