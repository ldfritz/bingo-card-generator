class BingoCard
  def initialize
    @card = BingoCard.generate
  end

  def to_csv
    @card.reduce("") do |result, row|
      result << row.join(",") << "\n"
    end
  end

  def self.generate
    %w[B I N G O].each_with_index.reduce([]) do |result, (letter, indx)|
      row = [letter] + (((indx * 15) + 1)..((indx + 1) * 15)).to_a.shuffle[0,5]
      row[3] = "FREE" if letter == "N"
      result << row
    end.transpose
  end
end
