# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  TAB = "\t"
  NEWLINE = "\n"

  def take_tsv(tsv)
    lines = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    key = lines.first
    values = lines[1..]
    @data = values.map { |value| key.zip(value).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header = @data.first.keys.join(TAB)
    content = @data.map { |line| NEWLINE + line.values.join(TAB) }
    [header, content, NEWLINE].join
  end
end
