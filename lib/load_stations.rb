# require 'CSV'
require_relative 'station'

  def load_stations
    filename = 'lib/all_stations.csv'
    file = File.open(filename, 'r')
    file.readlines.each do |l|
      arr = l.chomp.split(',')
    #   p Station.new(arr[3].tr('\"\\\"','').to_sym,arr[5])
      p Station.new(arr[3].tr(' ','_').gsub!(/[^0-9A-Za-z_]/, '').to_sym,arr[5].to_i)
    end
    file.close
  end

  load_stations