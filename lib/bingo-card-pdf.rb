module BingoCardPDF
  def self.render(data, filename)
    require 'prawn'
    require 'prawn/table'
    Prawn::Document.generate(filename) do |pdf|
      pdf.table(data.to_a,
        :cell_style => {
          :height => pdf.bounds.top / 6 - 10,
          :width => pdf.bounds.right / 5
        }
      )
    end
  end
end
