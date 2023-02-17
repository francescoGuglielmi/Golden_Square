require "grammar_stats"

describe GrammarStats do
  context "check method" do
    it "fails if text is not a string" do
      class_instance = GrammarStats.new
      expect{class_instance.check(9)}.to raise_error "Text must be a string!"
    end
    
    it "returns true if text begins with a capital letter, false if not" do
      class_instance = GrammarStats.new
      expect(class_instance.check("Hello!")).to eq true
      expect(class_instance.check("hello!")).to eq false
    end

    it "returns true if it ends with the correct puctuation, false if not" do
      class_instance = GrammarStats.new
      expect(class_instance.check("Hey.")).to eq true
      expect(class_instance.check("Hey!")).to eq true
      expect(class_instance.check("Hey?")).to eq true
      expect(class_instance.check("Hey,")).to eq false
      expect(class_instance.check("Hey:")).to eq false
      expect(class_instance.check("Hey;")).to eq false
      expect(class_instance.check("Hey'")).to eq false
      expect(class_instance.check("Hey-")).to eq false
      expect(class_instance.check("Hey/")).to eq false
      expect(class_instance.check("Hey_")).to eq false
      expect(class_instance.check("Hey=")).to eq false
    end
  end

  context "percentage_good" do
    it "returns the percentage (integer) of good text submissions to the method check" do
      class_instance = GrammarStats.new
      class_instance.check("Hello!")
      class_instance.check("Hey.")
      class_instance.check("Hey!")
      class_instance.check("Hey?")
      class_instance.check("Hey,")
      class_instance.check("Hey:")
      class_instance.check("Hey;")
      class_instance.check("Hey'")
      class_instance.check("Hey-")
      class_instance.check("Hey/")
      class_instance.check("Hey_")
      class_instance.check("Hey=")
      expect(class_instance.percentage_good).to eq 33
    end
  end
end