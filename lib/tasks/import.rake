require 'csv'

desc "Import vocab from csv file"
task :import => [:environment] do
  csv_text = File.read('db/gumdo_vocab.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    row = row.to_hash.with_indifferent_access
    VocabTerm.create!(row.to_hash.symbolize_keys)
  end
end