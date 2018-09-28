def get_first_name_of_season_winner(data, season)
  data[season].collect do |x|
      if x["status"] == "Winner"
      x["name"].split().first
    end
  end.first
end

def get_contestant_name(data, occupation)
  data.collect do |season, actresses|
    actresses.collect do |actress|
      if actress["occupation"] == occupation
        return actress["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  hometown_amount = 0
  data.collect do |season, actresses|
    actresses.collect do |actress|
      if actress["hometown"] == hometown
        hometown_amount += 1
      end
    end
  end
  hometown_amount
end

def get_occupation(data, hometown)
  data.collect do |season, actresses|
    actresses.collect do |actress|
      if actress["hometown"] == hometown 
        return actress["occupation"]
    #binding.pry
      end
    end
  end
end

# def get_average_age_for_season(data, season)
#   #ages = []
#   age = 0
#   num_of_con = 0
#   data[season].each do |actress|
#     age += (actress["age"]).to_i
#     num_of_con += 1
#     #ages << actress["age"].to_f.round
#     #binding.pry
#   end
#   #ages.each {|age| average_age += age}
#   #average_age / ages.length
#   #end.first
#   (age / num_of_con.to_f).round
# end

def get_average_age_for_season(data, season)
  ages = []
  average_age = 0
  data[season].collect do |actress|
    ages << actress["age"].to_i
  end
  ages.each {|age| average_age += age}
  (average_age / ages.length.to_f).round
end
