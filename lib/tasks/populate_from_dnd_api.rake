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

    task proficiencies: :environment do
        puts 'populating proficiencies'
        proficiencies_index = HTTParty.get("#{base_url}/api/proficiencies")
        proficiencies_index.delete("count")
        proficiencies_urls = proficiencies_index["results"].map{ |proficiency| proficiency["url"]}

        proficiencies_urls.each do |url|
            proficiency = HTTParty.get("#{base_url}#{url}").with_indifferent_access 

            Proficiency.create(
                external_id: proficiency[:_id],
                external_index: proficiency[:index],
                name: proficiency[:name],
                prof_type: proficiency[:type],
                classes: proficiency[:classes].to_s,
                races: proficiency[:races].to_s,
                url: proficiency[:url]
            )
        end
    end
    task languages: :environment do
        puts 'populating languages'
        languages_index = HTTParty.get("#{base_url}/api/languages")
        languages_index.delete("count")
        languages_urls = languages_index["results"].map{ |language| language["url"]}

        languages_urls.each do |url|
            language = HTTParty.get("#{base_url}#{url}").with_indifferent_access 

            Language.create(
                external_id: language[:_id],
                external_index: language[:index],
                name: language[:name],
                lang_type: language[:type],
                typical_speakers: language[:typical_speakers].to_s,
                script: language[:script].to_s,
                url: language[:url]
            )
        end
    end
    task char_classes: :environment do
        puts 'populating classes'
        char_classes_index = HTTParty.get("#{base_url}/api/classes")
        char_classes_index.delete("count")
        char_classes_urls = char_classes_index["results"].map{ |char_class| char_class["url"]}

        char_classes_urls.each do |url|
            char_class = HTTParty.get("#{base_url}#{url}").with_indifferent_access 
            ## TODO: add  subclasses, starting equipment, spellcasting, spells, features, proficiencies, levels, levels features, levels spells to char_classes

            proficiency_names = char_class[:proficiencies].map{ |p| p["name"] }
            proficiency_ids = Proficiency.where(name: proficiency_names).ids
            CharClass.create(
                external_id: char_class[:_id],
                external_index: char_class[:index],
                name: char_class[:name],
                hit_die: char_class[:hit_die],
                proficiency_choices: char_class[:proficiency_choices].to_s + char_class[:proficiencies].to_s,
                saving_throws: char_class[:saving_throws].to_s,
                starting_equipment: char_class[:starting_equipment].to_s,
                class_levels: char_class[:class_levels].to_s,
                spellcasting: char_class[:spellcasting].to_s,
                url: char_class[:url]
            )
        end
    end
    task sub_char_classes: :environment do
        puts 'populating subclasses'
        sub_char_classes_index = HTTParty.get("#{base_url}/api/subclasses")
        sub_char_classes_index.delete("count")
        sub_char_classes_urls = sub_char_classes_index["results"].map{ |sub_char_class| sub_char_class["url"]}

        sub_char_classes_urls.each do |url|
            sub_char_class = HTTParty.get("#{base_url}#{url}").with_indifferent_access 
            ## TODO: add classes to subclasses
            char_class_name = sub_char_class[:class]["name"]
            char_class_id = CharClass.find_by(name: char_class_name).id
            puts "adding subclass #{sub_char_class[:name]}"

            sub_char_class_obj = SubCharClass.create(
                external_id: sub_char_class[:_id],
                external_index: sub_char_class[:index],
                name: sub_char_class[:name],
                sub_char_class_flavor: sub_char_class[:subclass_flavor],
                desc: sub_char_class[:desc].to_s,
                char_class_id: char_class_id
            )
            sub_char_class_obj.save!
        end
    end

    task races: :environment do 
        puts 'populating races'
        races_index = HTTParty.get("#{base_url}/api/races")
        races_index.delete("count")
        races_urls = races_index["results"].map{ |race| race["url"]}
        
        races_urls.each do |url|
            race = HTTParty.get("#{base_url}#{url}").with_indifferent_access 
            ## TODO: add classes to subclasses

            ## find ids for associations
            proficiency_names = race[:starting_proficiencies].map{ |p| p["name"] }
            proficiency_ids = Proficiency.where(name: proficiency_names).ids
            language_names = race[:languages].map{ |p| p["name"] }
            language_ids = Language.where(name: language_names).ids
            trait_names = race[:traits].map{ |p| p["name"] }
            trait_ids = Trait.where(name: trait_names).ids
            subrace_names = race[:subraces].map{ |p| p["name"] }
            subrace_ids = Subrace.where(name: subrace_names).ids

            puts "adding race #{race[:name]}"
            Race.create(
                external_id: race[:_id],
                external_index: race[:index],
                name: race[:name],
                speed: race[:speed],
                ability_bonuses: race[:ability_bonuses],
                alignment: race[:alignment],
                age: race[:age],
                size: race[:size],
                size_description: race[:size_description],
                language_desc: race[:language_desc],
                url: race[:url]
            )
        end
    end

    task subraces: :environment do 
        puts 'populating subraces'
        subraces_index = HTTParty.get("#{base_url}/api/subraces")
        subraces_index.delete("count")
        subraces_urls = subraces_index["results"].map{ |race| race["url"]}
        
        subraces_urls.each do |url|
            subrace = HTTParty.get("#{base_url}#{url}").with_indifferent_access 
            ## TODO: add classes to subclasses

            ## find ids for associations
            proficiency_names = subrace[:starting_proficiencies].map{ |p| p["name"] }
            proficiency_ids = Proficiency.where(name: proficiency_names).ids
            language_names = subrace[:languages].map{ |p| p["name"] }
            language_ids = Language.where(name: language_names).ids
            # language_option_names = subrace[:language_options].map{ |p| p["name"] }
            # language_option_ids = Language.where(name: language_option_names).ids
            trait_names = subrace[:racial_traits].map{ |p| p["name"] }
            trait_ids = Trait.where(name: trait_names).ids
            race_name = subrace[:race]["name"]
            race_id = Race.find_by(name: race_name).id

            puts "adding subrace #{subrace[:name]}"

            Subrace.create(
                external_id: subrace[:_id],
                external_index: subrace[:index],
                name: subrace[:name],
                desc: subrace[:desc],
                ability_bonus: subrace[:ability_bonuses],
                race_id: race_id,
                url: subrace[:url]
            )
        end
    end

    task traits: :environment do 
        puts 'populating traits'
        traits_index = HTTParty.get("#{base_url}/api/traits")
        traits_index.delete("count")
        traits_urls = traits_index["results"].map{ |trait| trait["url"]}
        
        traits_urls.each do |url|
            trait = HTTParty.get("#{base_url}#{url}").with_indifferent_access 
            ## TODO: add classes to subclasses

            ## find ids for associations
            race_name = trait[:races].map{ |p| p["name"] }
            race_ids = Race.where(name: race_name).ids

            puts "adding trait #{trait[:name]}"

            trait = Trait.create(
                external_id: trait[:_id],
                external_index: trait[:index],
                name: trait[:name],
                desc: trait[:desc],
                url: trait[:url]
            )
            trait.save!
        end
    end

    task equipment: :environment do 
        puts 'populating equipment'
        equipment_index = HTTParty.get("#{base_url}/api/equipment")
        equipment_index.delete("count")
        equipment_urls = equipment_index["results"].map{ |equipment| equipment["url"]}
        
        equipment_urls.each do |url|
            equipment = HTTParty.get("#{base_url}#{url}").with_indifferent_access 
            ## TODO: add classes to subclasses

            ## find ids for associations

            if equipment[:equipment_category]["name"] == "Armor"
                puts "adding Armor #{equipment[:name]}"

                armor = Armor.create(
                    external_id: equipment[:_id],
                    external_index: equipment[:index],
                    name: equipment[:name],
                    equipment_category: equipment[:equipment_category],
                    armor_category: equipment[:armor_category],
                    armor_class: equipment[:armor_class],
                    str_minimum: equipment[:str_minimum],
                    stealth_disadvantage: equipment[:stealth_disadvantage],
                    weight: equipment[:weight],
                    cost: equipment[:cost],
                    url: equipment[:url]
                )
                armor.save!
            elsif equipment[:equipment_category]["name"] == "Weapon"
                puts "adding weapon #{equipment[:name]}"

                weapon = Weapon.create(
                    external_id: equipment[:_id],
                    external_index: equipment[:index],
                    name: equipment[:name],
                    equipment_category: equipment[:equipment_category],
                    weapon_category: equipment[:weapon_category],
                    weapon_range: equipment[:weapon_range],
                    category_range: equipment[:category_range],
                    weight: equipment[:weight],
                    cost: equipment[:cost],
                    damage: equipment[:damage],
                    range: equipment[:range],
                    weapon_properties: equipment[:properties]
                )
                weapon.save!
            else
                puts "adding gear #{equipment[:name]}"

                gear = Gear.create(
                    external_id: equipment[:_id],
                    external_index: equipment[:index],
                    name: equipment[:name],
                    equipment_category: equipment[:equipment_category],
                    gear_category: equipment[:gear_category],
                    weight: equipment[:weight],
                    cost: equipment[:cost],
                    url: equipment[:url]
                )
                gear.save!
            end
        end
    end

    task magic_schools: :environment do 
        puts 'populating magic schools '
        school_index = HTTParty.get("#{base_url}/api/magic-schools")
        school_index.delete("count")
        school_urls = school_index["results"].map{ |school| school["url"]}
        
        school_urls.each do |url|
            school = HTTParty.get("#{base_url}#{url}").with_indifferent_access 
            ## TODO: add classes to subclasses

            ## find ids for associations
        

            puts "adding magic school #{school[:name]}"

            school = MagicSchool.create(
                external_id: school[:_id],
                external_index: school[:index],
                name: school[:name],
                desc: school[:desc],
                url: school[:url]
            )
            school.save!
        end
    end

    task spells: :environment do 
        puts 'populating spells'
        spells_index = HTTParty.get("#{base_url}/api/spells")
        spells_index.delete("count")
        spells_urls = spells_index["results"].map{ |spell| spell["url"]}
        
        spells_urls.each do |url|
            spell = HTTParty.get("#{base_url}#{url}").with_indifferent_access 
            ## TODO: add classes to subclasses

            ## find ids for associations
            school_name = spell[:school]["name"]
            school_id = MagicSchool.find_by(name: school_name).id
            char_class_names = spell[:classes].map{ |p| p["name"] }
            char_class_ids = CharClass.where(name: char_class_names)
            sub_char_class_names = spell[:subclasses].map{ |p| p["name"] }
            sub_char_class_ids = SubCharClass.where(name: sub_char_class_names).ids
        

            puts "adding spell #{spell[:name]}"

            spell = Spell.create(
                external_id: spell[:_id],
                external_index: spell[:index],
                name: spell[:name],
                desc: spell[:desc],
                url: spell[:url],
                higher_level: spell[:higher_level],
                range: spell[:range],
                components: spell[:components],
                material: spell[:material],
                ritual: spell[:ritual],
                duration: spell[:duration],
                concentration: spell[:concentration],
                casting_time: spell[:casting_time],
                level: spell[:level],
                school: spell[:school]
            )
            spell.save!
        end
    end
end