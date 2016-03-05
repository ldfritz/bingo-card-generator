class BingoCard
  COLUMNS = %w[B I N G O]

  def initialize
    @card = generate_card
  end

  def to_a
    COLUMNS.reduce([]) do |result, letter|
      result << [letter] + @card[letter]
    end.transpose
  end

  def to_csv
    self.to_a.map {|i| i.join(",") }.join("\n")
  end

  def to_pdf(filename)
    require_relative "bingo-card-pdf"
    BingoCardPDF.render(self, filename)
  end

  private
    def generate_card
      BingoCard::COLUMNS.each_with_index.reduce({}) do |result, (letter, indx)|
        result[letter] = (((indx * 15) + 1)..((indx + 1) * 15)).to_a.shuffle[0,5]
        result[letter][2] = "FREE" if letter == "N"
        result
      end
    end
end
