require "./cell.rb"

describe Cell do
  let(:instance) { described_class.new(x, y, value) }
  let(:x) { 0 }
  let(:y) { 0 }
  let(:value) { Cell.empty_value }

  it "does not raise error when setting a value in an empty cell" do
    expect { instance.value = "X" }.not_to raise_error
  end

  context "when cell is already filled" do
    before do
      instance.value = "X"
    end

    it "raises error when setting a new value" do
      expect { instance.value = "O" }.to raise_error(ArgumentError, "Cannot set the value of an already filled cell.")
    end
  end

  describe "#initialize" do
    context "when x coordinate is invalid" do
      let(:x) { -1 }

      it "raises exception" do
        expect { instance }.to raise_error(ArgumentError, "Invalid x: \"-1\". Must be between 0 and 2.")
      end
    end

    context "when y coordinate is invalid" do
      let(:y) { 3 }

      it "raises exception" do
        expect { instance }.to raise_error(ArgumentError, "Invalid y: \"3\". Must be between 0 and 2.")
      end
    end

    context "when value is invalid" do
      let(:value) { "A" }

      it "raises exception" do
        expect { instance }.to raise_error(ArgumentError, "Invalid value: \"A\". Must be one of: \"X\", \"O\", nil")
      end
    end
  end
end
