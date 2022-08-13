require "./board.rb"

describe Board do
  let(:board) { described_class.new }

  describe "#fill_cell" do
    it "fills cell correctly" do
      board.fill_cell(6, "O")
      expect(board.to_s).to eq("_ _ _ \n_ _ O \n_ _ _ \n\n")
    end
  end

  describe "#winning_cell?" do
    context "when only one move happened" do
      before do
        board.fill_cell(1, "X")
      end

      it "returns false" do
        expect(board.winning_cell?(1)).to eq(false)
      end
    end

    context "when one element in the row is different" do
      before do
        board.fill_cell(1, "X")
        board.fill_cell(2, "O")
        board.fill_cell(3, "X")
      end

      it "returns false" do
        expect(board.winning_cell?(3)).to eq(false)
      end
    end

    context "when three random moves happened" do
      before do
        board.fill_cell(1, "X")
        board.fill_cell(3, "O")
        board.fill_cell(7, "X")
      end

      it "returns false" do
        expect(board.winning_cell?(7)).to eq(false)
      end
    end

    context "when winning in the row" do
      before do
        board.fill_cell(4, "X")
        board.fill_cell(5, "X")
        board.fill_cell(6, "X")
      end

      it "returns true" do
        expect(board.winning_cell?(5)).to eq(true)
      end
    end

    context "when winning in the column" do
      before do
        board.fill_cell(1, "O")
        board.fill_cell(4, "O")
        board.fill_cell(7, "O")
      end

      it "returns true" do
        expect(board.winning_cell?(7)).to eq(true)
      end
    end

    context "when winning in diagonal 1" do
      before do
        board.fill_cell(7, "O")
        board.fill_cell(5, "O")
        board.fill_cell(3, "O")
      end

      it "returns true" do
        expect(board.winning_cell?(3)).to eq(true)
      end
    end

    context "when winning in diagonal 2" do
      before do
        board.fill_cell(1, "O")
        board.fill_cell(5, "O")
        board.fill_cell(9, "O")
      end

      it "returns true" do
        expect(board.winning_cell?(9)).to eq(true)
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
