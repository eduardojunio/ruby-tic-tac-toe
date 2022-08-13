require "./board.rb"

describe Board do
  let(:board) { described_class.new }

  describe "#winning_cell?" do
    context "when only one move happened" do
      before do
        board.fill_cell(1, "X")
      end

      it "returns false" do
        expect(board.winning_cell?(1)).to eq(false)
      end
    end
  end

  describe "#to_s" do
    context "when board is empty" do
      it "returns the correct string" do
        expect(board.to_s).to eq("_ _ _ \n_ _ _ \n_ _ _ \n\n")
      end

      it "implicitly calls to_s" do
        expect("#{board}").to eq("_ _ _ \n_ _ _ \n_ _ _ \n\n")
      end
    end

    context "when board is filled" do
      before do
        board.fill_cell(1, "X")
        board.fill_cell(2, "O")
        board.fill_cell(3, "X")
        board.fill_cell(4, "X")
        board.fill_cell(5, "O")
        board.fill_cell(6, "O")
        board.fill_cell(7, "O")
        board.fill_cell(8, "X")
        board.fill_cell(9, "X")
      end

      it "returns the correct string" do
        expect(board.to_s).to eq("X O X \nX O O \nO X X \n\n")
      end
    end
  end
end
