require "./cell.rb"

describe Cell do
  describe "#x" do
    it "gets set correctly" do
      expect(Cell.new(1, 2, Cell.empty_value).x).to eq(1)
    end
  end
end
