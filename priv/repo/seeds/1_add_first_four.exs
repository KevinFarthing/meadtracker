# Script for populating the database. You can run it as:
#
#     mix run .\priv\repo\seeds\add_first_four.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Meadtracker.Repo.insert!(%Meadtracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Meadtracker.Batches.{Batch, Note}
defmodule Seed do
    def create_datetime_from_string(datetime) do
        {:ok, datetime, _} = DateTime.from_iso8601(datetime)
        datetime
        |> DateTime.truncate(:second)
    end
end

sna = "https:\/\/www.reddit.com\/r\/mead\/wiki\/process\/staggered_nutrient_additions\/"

 [
        %Batch{
            id: 1,
            recipe: "<a href=https:\/\/www.reddit.com\/r\/mead\/wiki\/recipes\/traditionals\/0001\/ target=\"_blank\"  rel=\"noopener noreferrer\">Source</a><br>1 Gallon Batch, 2.5 lbs honey, Safale US-05.",
            name: "Beginner Traditional",
            description: "A basic semi-sweet mead",
            target_abv: 10.0,
            original_gravity: 1.075,
            final_gravity: 1.013,
            pitch_date: "2022-04-09T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [
                        %Note{
                            batch_id: 1,
                            note: "didn't have a hydrometer so OG is an approximation. Specific gravity was measured at 1.070 day after pitch",
                            date: "2022-04-10T05:00:00.000Z" |> Seed.create_datetime_from_string
                        },
                        %Note{
                            batch_id: 1,
                            note: "SG measured at 1.060, added Fermaid K and DAP",
                            date: "2022-04-14T05:00:00.000Z" |> Seed.create_datetime_from_string
                        },
                        %Note{
                            batch_id: 1,
                            note: "SG stable at 1.013. Racked",
                            date: "2022-05-07T05:00:00.000Z" |> Seed.create_datetime_from_string
                        }
            ]
        },
        %Batch{
            id: 2,
            recipe: "<a href=https:\/\/www.homebrewtalk.com\/threads\/joes-ancient-orange-mead.49106\/ target=\"_blank\"  rel=\"noopener noreferrer\">Source</a><br>Replaced bread yeast with Safale US-05, used juice and zest of 1 orange instead of slices to remove the pith, and included nutrition. Raisins were kept from original recipe. I meant to include some black tea for tannins, notes for next time.",
            name: "JOAM-ish",
            description: "The first rule of JOAM is don't change the recipe. Experiment to change the recipe.",
            target_abv: 12.0,
            original_gravity: 1.12,
            final_gravity: 1.02,
            pitch_date: "2022-04-26T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [
                        %Note{
                            batch_id: 2,
                            note: "slowing at 1.030. adding a bit of Fermaid O",
                            date: "2022-05-23T05:00:00.000Z" |> Seed.create_datetime_from_string
                        },
                        %Note{
                            batch_id: 2,
                            note: "Stable at 1.020, racking",
                            date: "2022-06-03T05:00:00.000Z" |> Seed.create_datetime_from_string
                        }                    
            ]
        },
        %Batch{
            id: 3,
            recipe: "<a href=https:\/\/www.reddit.com\/r\/mead\/wiki\/recipes\/metheglins\/0002\/ target=\"_blank\"  rel=\"noopener noreferrer\">Source</a><br>3 lbs of honey, D47 yeast, and 5 bags of chai tea. I made a tea from the teabags, mixed the honey into that, added water to 1 gallon, and pitched the yeast<br>following the <a href=#{sna} target=\"_blank\"  rel=\"noopener noreferrer\">SNA nutrient schedule</a>",
            name: "Chai Metheglin",
            description: "A dry mead with chai spices",
            target_abv: 14.0,
            original_gravity: 1.108,
            final_gravity: 1.000,
            pitch_date: "2022-05-23T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [

                %Note{
                    batch_id: 2,
                    note: "SG measured at 1.065. Moving fast.",
                    date: "2022-05-27T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 2,
                    note: "SG measured at 1.020",
                    date: "2022-05-30T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 2,
                    note: "SG measured at 0.970, due to hydrometer damage. The cap on top isn't sealed and water got in and disrupted my readings.",
                    date: "2022-05-30T05:00:00.000Z" |> Seed.create_datetime_from_string
                } ,
                %Note{
                    batch_id: 2,
                    note: "Measured final gravity at 1.000 with corrected hydrometer",
                    date: "2022-06-15T05:00:00.000Z" |> Seed.create_datetime_from_string
                } 
            ]
        },
        %Batch{
            id: 4,
            recipe: "<a href=https:\/\/www.reddit.com\/r\/mead\/comments\/hq2e4r\/july_challenge_root_beer_mead\/ target=\"_blank\"  rel=\"noopener noreferrer\">Source</a><br>Safale US-05 yeast, 2 TB Sarsaparilla Bark, 1 TB Birch Bark, 1 Star Anise Pod, 1/2 tb Wintergreen, 1 Cinnamon Stick<br>Used spices to make a strong tea prior to pitch, added 3 lbs honey and pitched yeast<br>following the <a href=#{sna} target=\"_blank\"  rel=\"noopener noreferrer\">SNA nutrient schedule</a>",
            name: "Root Beer Metheglin",
            description: "A mead that should invoke root beer flavors",
            target_abv: 10.0,
            original_gravity: 1.108,
            final_gravity: 1.012,
            pitch_date: "2022-06-20T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [
                        %Note{
                            batch_id: 4,
                            note: "it hit 1.030 and it's delicious",
                            date: "2022-06-28T05:00:00.000Z" |> Seed.create_datetime_from_string
                        },
                        %Note{
                            batch_id: 4,
                            note: "continued to 1.012 and it's lost most of the root beer flavor. Sweetening samples has not changed it. Not sure what happened.",
                            date: "2022-06-30T05:00:00.000Z" |> Seed.create_datetime_from_string
                        },
                        %Note{
                            batch_id: 4,
                            note: "let sit on .5 oz of Sarsparilla root for 2 days.",
                            date: "2022-07-13T05:00:00.000Z" |> Seed.create_datetime_from_string
                        }                    
            ]
        }
    ]
    |> Enum.map(fn batch ->
        Meadtracker.Repo.insert!(batch)
    end)
    