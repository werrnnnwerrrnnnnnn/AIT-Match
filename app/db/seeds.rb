# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#------------------------------------------------------------------#
#1 Degree Seed
[
  { value: "master", label: "Master's Degree" },
  { value: "doctoral", label: "Doctoral Degree" }
].each do |degree|
  Degree.find_or_create_by!(value: degree[:value]) do |d|
    d.label = degree[:label]
  end
end

[
  { value: "master", label: "Master's Degree" },
  { value: "doctoral", label: "Doctoral Degree" },
  { value: "Open to all", label: "Open to all degrees" }
].each do |degree|
  PreferredDegree.find_or_create_by!(value: degree[:value]) do |d|
    d.label = degree[:label]
  end
end
#------------------------------------------------------------------#
#2 Gender Seed
[
  { value: "male", label: "Male" },
  { value: "female", label: "Female" },
  { value: "non-binary", label: "Non-binary" }
].each do |gender|
  Gender.find_or_create_by!(value: gender[:value]) do |g|
    g.label = gender[:label]
  end
end

[
  { value: "male", label: "Male" },
  { value: "female", label: "Female" },
  { value: "non-binary", label: "Non-binary" },
  { value: "open-to-all", label: "Open to all genders" }
].each do |preferred_gender|
  PreferredGender.find_or_create_by!(value: preferred_gender[:value]) do |pg|
    pg.label = preferred_gender[:label]
  end
end
#------------------------------------------------------------------#
#3 School Seed
[
  { name: "School of Engineering and Technology", abbreviation: "SET" },
  { name: "School of Environment, Resources and Development", abbreviation: "SERD" },
  { name: "School of Management", abbreviation: "SOM" }
].each do |school|
  School.find_or_create_by!(name: school[:name]) do |s|
    s.abbreviation = school[:abbreviation]
  end
end

[
  { name: "School of Engineering and Technology", abbreviation: "SET" },
  { name: "School of Environment, Resources and Development", abbreviation: "SERD" },
  { name: "School of Management", abbreviation: "SOM" },
  { name: "open-to-all", abbreviation: "Open to all schools" },
].each do |school|
  PreferredSchool.find_or_create_by!(name: school[:name]) do |s|
    s.abbreviation = school[:abbreviation]
  end
end
#------------------------------------------------------------------#
#4 Program Seed
[
  { name: "Agri-Business Management", abbreviation: "ABM" },
  { name: "Agricultural Systems and Engineering", abbreviation: "ASE" },
  { name: "Aquaculture and Aquatic Resources Management", abbreviation: "AARM" },
  { name: "Bio-Nano Materials Science and Engineering", abbreviation: "BNMSE" },
  { name: "Climate Change and Sustainable Development", abbreviation: "CCSD" },
  { name: "Computer Science", abbreviation: "CS" },
  { name: "Construction, Engineering and Infrastructure Management", abbreviation: "CEIM" },
  { name: "Data Science and AI", abbreviation: "DSAI" },
  { name: "Development and Sustainability", abbreviation: "DS" },
  { name: "Development Planning Management and Innovation", abbreviation: "DPMI" },
  { name: "Disaster Preparedness, Mitigation and Management", abbreviation: "DPMM" },
  { name: "Doctor of Philosophy in Management", abbreviation: "Ph.D." },
  { name: "Doctorate of Business Administration", abbreviation: "DBA" },
  { name: "Dual Degree Master's Program with Telecom Sud Paris", abbreviation: "France" },
  { name: "Dual Degree Master's Program in Data Science and AI with Brunel University London", abbreviation: "UK" },
  { name: "Dual Degree Master's Program in Geotechnical and Earth Resources Engineering with Colorado State University", abbreviation: "USA" },
  { name: "Dual Degree Master's Program in Water Engineering and Management with Colorado State University", abbreviation: "USA" },
  { name: "Dual Degree Master's Program in Water Engineering and Management with University of Iowa", abbreviation: "USA" },
  { name: "Dual Degree Program with University of Wollongong", abbreviation: "Australia" },
  { name: "Engineering Entrepreneurship", abbreviation: "" },
  { name: "Environmental Engineering and Management", abbreviation: "EEM" },
  { name: "Food Engineering and Bioprocess Technology", abbreviation: "FEBT" },
  { name: "Food Innovation, Nutrition and Health", abbreviation: "FINH" },
  { name: "Gender and Development Studies", abbreviation: "GDS" },
  { name: "Geotechnical and Earth Resources Engineering", abbreviation: "GTE" },
  { name: "Industrial and Manufacturing Engineering", abbreviation: "IME" },
  { name: "Information and Communication Technologies", abbreviation: "ICT" },
  { name: "Information Management", abbreviation: "IM" },
  { name: "Internet of Things Systems Engineering", abbreviation: "IoT" },
  { name: "Joint Degree Programme with University of Nice Sophia Antipolis", abbreviation: "France" },
  { name: "Master's in Digital Marketing", abbreviation: "" },
  { name: "Master's in Business Analytics and Digital Transformation", abbreviation: "M/MSc BADT" },
  { name: "Master's in International Finance", abbreviation: "M/MSc IF" },
  { name: "Masters of Business Administration", abbreviation: "MBA" },
  { name: "Mechatronics and Machine Intelligence", abbreviation: "MMI" },
  { name: "Medical Engineering", abbreviation: "MDE" },
  { name: "Microelectronics and Embedded Systems", abbreviation: "MES" },
  { name: "Natural Resources Management", abbreviation: "NRM" },
  { name: "Professional Master in Data Science", abbreviation: "PMDS" },
  { name: "Professional Master in Environment, Social and Governance", abbreviation: "ESG" },
  { name: "Professional Master in Geotechnical Engineering and Management", abbreviation: "PME-GEM" },
  { name: "Professional Master in Project Management", abbreviation: "MPM" },
  { name: "Professional Master in Structural Design of Tall Buildings", abbreviation: "PMTB" },
  { name: "Remote Sensing and Geographic Information Systems", abbreviation: "RS-GIS" },
  { name: "Structural Engineering", abbreviation: "STE" },
  { name: "Sustainable Energy Transition", abbreviation: "SE" },
  { name: "Telecommunications", abbreviation: "TC" },
  { name: "Transportation Engineering", abbreviation: "TRE" },
  { name: "Urban Innovation and Sustainability", abbreviation: "UIS" },
  { name: "Water Engineering and Management", abbreviation: "WEM" },
  { name: "Yunus Professional Master's in Social Business and Entrepreneurship", abbreviation: "YPM-SBE" }
].each do |program|
  Program.find_or_create_by!(name: program[:name]) do |p|
    p.abbreviation = program[:abbreviation]
  end
end

[
  { name: "Agri-Business Management", abbreviation: "ABM" },
  { name: "Agricultural Systems and Engineering", abbreviation: "ASE" },
  { name: "Aquaculture and Aquatic Resources Management", abbreviation: "AARM" },
  { name: "Bio-Nano Materials Science and Engineering", abbreviation: "BNMSE" },
  { name: "Climate Change and Sustainable Development", abbreviation: "CCSD" },
  { name: "Computer Science", abbreviation: "CS" },
  { name: "Construction, Engineering and Infrastructure Management", abbreviation: "CEIM" },
  { name: "Data Science and AI", abbreviation: "DSAI" },
  { name: "Development and Sustainability", abbreviation: "DS" },
  { name: "Development Planning Management and Innovation", abbreviation: "DPMI" },
  { name: "Disaster Preparedness, Mitigation and Management", abbreviation: "DPMM" },
  { name: "Doctor of Philosophy in Management", abbreviation: "Ph.D." },
  { name: "Doctorate of Business Administration", abbreviation: "DBA" },
  { name: "Dual Degree Master's Program with Telecom Sud Paris", abbreviation: "France" },
  { name: "Dual Degree Master's Program in Data Science and AI with Brunel University London", abbreviation: "UK" },
  { name: "Dual Degree Master's Program in Geotechnical and Earth Resources Engineering with Colorado State University", abbreviation: "USA" },
  { name: "Dual Degree Master's Program in Water Engineering and Management with Colorado State University", abbreviation: "USA" },
  { name: "Dual Degree Master's Program in Water Engineering and Management with University of Iowa", abbreviation: "USA" },
  { name: "Dual Degree Program with University of Wollongong", abbreviation: "Australia" },
  { name: "Engineering Entrepreneurship", abbreviation: "" },
  { name: "Environmental Engineering and Management", abbreviation: "EEM" },
  { name: "Food Engineering and Bioprocess Technology", abbreviation: "FEBT" },
  { name: "Food Innovation, Nutrition and Health", abbreviation: "FINH" },
  { name: "Gender and Development Studies", abbreviation: "GDS" },
  { name: "Geotechnical and Earth Resources Engineering", abbreviation: "GTE" },
  { name: "Industrial and Manufacturing Engineering", abbreviation: "IME" },
  { name: "Information and Communication Technologies", abbreviation: "ICT" },
  { name: "Information Management", abbreviation: "IM" },
  { name: "Internet of Things Systems Engineering", abbreviation: "IoT" },
  { name: "Joint Degree Programme with University of Nice Sophia Antipolis", abbreviation: "France" },
  { name: "Master's in Digital Marketing", abbreviation: "" },
  { name: "Master's in Business Analytics and Digital Transformation", abbreviation: "M/MSc BADT" },
  { name: "Master's in International Finance", abbreviation: "M/MSc IF" },
  { name: "Masters of Business Administration", abbreviation: "MBA" },
  { name: "Mechatronics and Machine Intelligence", abbreviation: "MMI" },
  { name: "Medical Engineering", abbreviation: "MDE" },
  { name: "Microelectronics and Embedded Systems", abbreviation: "MES" },
  { name: "Natural Resources Management", abbreviation: "NRM" },
  { name: "Professional Master in Data Science", abbreviation: "PMDS" },
  { name: "Professional Master in Environment, Social and Governance", abbreviation: "ESG" },
  { name: "Professional Master in Geotechnical Engineering and Management", abbreviation: "PME-GEM" },
  { name: "Professional Master in Project Management", abbreviation: "MPM" },
  { name: "Professional Master in Structural Design of Tall Buildings", abbreviation: "PMTB" },
  { name: "Remote Sensing and Geographic Information Systems", abbreviation: "RS-GIS" },
  { name: "Structural Engineering", abbreviation: "STE" },
  { name: "Sustainable Energy Transition", abbreviation: "SE" },
  { name: "Telecommunications", abbreviation: "TC" },
  { name: "Transportation Engineering", abbreviation: "TRE" },
  { name: "Urban Innovation and Sustainability", abbreviation: "UIS" },
  { name: "Water Engineering and Management", abbreviation: "WEM" },
  { name: "Yunus Professional Master's in Social Business and Entrepreneurship", abbreviation: "YPM-SBE" },
  { name: "open-to-all", abbreviation: "Open to all programs" }
].each do |program|
  PreferredProgram.find_or_create_by!(name: program[:name]) do |p|
    p.abbreviation = program[:abbreviation]
  end
end
#------------------------------------------------------------------#
#5 Relationship Seed
[
  { name: "Just Dating", description: "Casual Dating" },
  { name: "Serious Relationship", description: "Long-term Relationship" },
  { name: "Making Friends", description: "Friendship" },
  { name: "Study Buddy", description: "Study Partners" },
  { name: "Open to all", description: "Open to all types" }
].each do |relationship|
  Relationship.find_or_create_by!(name: relationship[:name]) do |r|
    r.description = relationship[:description]
  end
end

[
  { name: "Just Dating", description: "Casual Dating" },
  { name: "Serious Relationship", description: "Long-term Relationship" },
  { name: "Making Friends", description: "Friendship" },
  { name: "Study Buddy", description: "Study Partners" },
  { name: "Open to all", description: "Open to all relationships" }
].each do |relationship|
  PreferredRelationship.find_or_create_by!(name: relationship[:name]) do |r|
    r.description = relationship[:description]
  end
end
#------------------------------------------------------------------#
#6 Interest Seed
[
  { name: "Art" },
  { name: "Automobiles & Racing" },
  { name: "Blogging/Vlogging" },
  { name: "Board Games" },
  { name: "Coding" },
  { name: "Cooking" },
  { name: "Crafting" },
  { name: "Dancing" },
  { name: "Eating" },
  { name: "Engineering" },
  { name: "Fashion & Style" },
  { name: "Fitness" }, # from Music/Fitness
  { name: "Gaming/E-sports" },
  { name: "Gardening" },
  { name: "Graphic Design" },
  { name: "Investing & Finance" },
  { name: "Languages" },
  { name: "Meditation" },
  { name: "Movies & TV Shows" },
  { name: "Music" }, # from Music/Fitness
  { name: "Pets & Animal Care" },
  { name: "Photography" },
  { name: "Podcasting" },
  { name: "Public Speaking" },
  { name: "Reading" },
  { name: "Science & Technology" },
  { name: "Sleeping" },
  { name: "Sport" },
  { name: "Tattoo Art" },
  { name: "Traveling" },
  { name: "Writing" }
].each do |interest|
  Interest.find_or_create_by!(name: interest[:name])
end

[
  { name: "Art" },
  { name: "Automobiles & Racing" },
  { name: "Blogging/Vlogging" },
  { name: "Board Games" },
  { name: "Coding" },
  { name: "Cooking" },
  { name: "Crafting" },
  { name: "Dancing" },
  { name: "Eating" },
  { name: "Engineering" },
  { name: "Fashion & Style" },
  { name: "Fitness" }, # from Music/Fitness
  { name: "Gaming/E-sports" },
  { name: "Gardening" },
  { name: "Graphic Design" },
  { name: "Investing & Finance" },
  { name: "Languages" },
  { name: "Meditation" },
  { name: "Movies & TV Shows" },
  { name: "Music" }, # from Music/Fitness
  { name: "Pets & Animal Care" },
  { name: "Photography" },
  { name: "Podcasting" },
  { name: "Public Speaking" },
  { name: "Reading" },
  { name: "Science & Technology" },
  { name: "Sleeping" },
  { name: "Sport" },
  { name: "Tattoo Art" },
  { name: "Traveling" },
  { name: "Writing" },
  { name: "Open to all" }
].each do |interest|
  PreferredInterest.find_or_create_by!(name: interest[:name])
end
#------------------------------------------------------------------#
#7 Seeding MBTI Types (including "Not Sure" for users)
[
  { value: "INTJ", label: "Architect" },
  { value: "INTP", label: "Logician" },
  { value: "ENTJ", label: "Commander" },
  { value: "ENTP", label: "Debater" },
  { value: "INFJ", label: "Advocate" },
  { value: "INFP", label: "Mediator" },
  { value: "ENFJ", label: "Protagonist" },
  { value: "ENFP", label: "Campaigner" },
  { value: "ISTJ", label: "Logistician" },
  { value: "ISFJ", label: "Defender" },
  { value: "ESTJ", label: "Executive" },
  { value: "ESFJ", label: "Consul" },
  { value: "ISTP", label: "Virtuoso" },
  { value: "ISFP", label: "Adventurer" },
  { value: "ESTP", label: "Entrepreneur" },
  { value: "ESFP", label: "Entertainer" },
  { value: "not-sure", label: "Not Sure" }  # Extra option for users who are unsure of their type
].each do |mbti|
  Mbti.find_or_create_by!(value: mbti[:value]) do |m|
    m.label = mbti[:label]
  end
end

[
  { value: "INTJ", label: "Architect" },
  { value: "INTP", label: "Logician" },
  { value: "ENTJ", label: "Commander" },
  { value: "ENTP", label: "Debater" },
  { value: "INFJ", label: "Advocate" },
  { value: "INFP", label: "Mediator" },
  { value: "ENFJ", label: "Protagonist" },
  { value: "ENFP", label: "Campaigner" },
  { value: "ISTJ", label: "Logistician" },
  { value: "ISFJ", label: "Defender" },
  { value: "ESTJ", label: "Executive" },
  { value: "ESFJ", label: "Consul" },
  { value: "ISTP", label: "Virtuoso" },
  { value: "ISFP", label: "Adventurer" },
  { value: "ESTP", label: "Entrepreneur" },
  { value: "ESFP", label: "Entertainer" },
  { value: "open-to-all", label: "Open to All" }
].each do |preferred_mbti|
  PreferredMbti.find_or_create_by!(value: preferred_mbti[:value]) do |pm|
    pm.label = preferred_mbti[:label]
  end
end
#------------------------------------------------------------------#