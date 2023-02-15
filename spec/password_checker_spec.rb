require "password_checker"

RSpec.describe PasswordChecker do
    it "returns true if password.length >= 8" do
        object = PasswordChecker.new
        result = object.check("password")
        expect(result).to eq true
    end
    it "fails" do
        object = PasswordChecker.new
        expect { object.check("shorter") }.to raise_error "Invalid password, must be 8+ characters."
    end
end