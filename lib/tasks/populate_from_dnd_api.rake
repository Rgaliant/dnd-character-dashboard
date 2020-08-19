namespace :populate_db do
    desc 'connection to dnd 5e api and populate data'
    base_url = "https://www.dnd5eapi.co"

    task ability_scores: :environment do

        puts 'populating ability scores'
        ability_scores = []
        cha = HTTParty.get("#{base_url}/api/ability-scores/cha") 
        con = HTTParty.get("#{base_url}/api/ability-scores/con") 
        dex = HTTParty.get("#{base_url}/api/ability-scores/dex") 
        int = HTTParty.get("#{base_url}/api/ability-scores/int") 
        str = HTTParty.get("#{base_url}/api/ability-scores/str") 
        wis = HTTParty.get("#{base_url}/api/ability-scores/wis") 
        ability_scores << [cha,con,dex,int,str,wis]

        ability_scores.flatten.each do |ab|
            ab = ab.with_indifferent_access
            AbilityScore.create(
                external_id: ab[:_id], 
                external_index: ab[:index], 
                name: ab[:name], 
                full_name: ab[:full_name], 
                desc: ab[:desc]
                )
        end
    end

    task skills: :environment  do
        puts 'populating skills'
        skills_index = HTTParty.get("#{base_url}/api/skills")
        skills_index.delete("count")
        skills_urls = skills_index["results"].map{ |skill| skill["url"]}

        skills_urls.each do |url|
            skill = HTTParty.get("#{base_url}#{url}").with_indifferent_access 

            Skill.create(
                external_id: skill[:_id],
                external_index: skill[:index],
                name: skill[:name],
                desc: skill[:desc],
                ability_score: skill[:ability_score].to_s,
                url: skill[:url]
            )
        end
    end
end