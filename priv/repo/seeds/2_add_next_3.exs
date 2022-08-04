# Script for populating the database. You can run it as:
#
#     mix run .\priv\repo\seeds\02_add_next_3.exs
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
            id: 5,
            recipe: "<a href=https:\/\/www.reddit.com\/r\/mead\/wiki\/userrecipes\/melomel\/ target=\"_blank\"  rel=\"noopener noreferrer\">Source</a><br>5 Gallon Batch, 1 lb dried hibiscus, 25 lbs of montmorency cherries picked in Michigan, 20.5 lbs of honey added in 3 batches<br>OG is theoretical due to staggered honey additions. EC1118 yeast.<br>after fermentation it will sit on oak cubes for 2 months",
            name: "The Tower",
            description: "A High ABV Cherry and Hibiscus mead",
            target_abv: 20.0,
            original_gravity: 1.165,
            final_gravity: nil,
            pitch_date: "2022-07-21T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [
                %Note{
                    batch_id: 5,
                    note: "gravity with first batch of honey is 1.085",
                    date: "2022-07-21T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 5,
                    note: "gravity dropped to 1.030 already, outpacing the nutrient schedule. Adding second batch of honey. SG at 1.065",
                    date: "2022-07-23T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 5,
                    note: "gravity is back to 1.030, still badly outpacing nutrient schedule. Suspect fermentation temp is too high. Adding last batch of honey and a double dose of Fermaid O",
                    date: "2022-07-24T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 5,
                    note: "fermentation is slowing at 1.040, which puts it at about 16% abv. It has to sit for a while before I can add the oak, hoping it goes a little further. The flavor is great, but incredibly tart. 1.040 and it still needs more sugar.",
                    date: "2022-07-30T05:00:00.000Z" |> Seed.create_datetime_from_string
                }]
        },
        %Batch{
            id: 6,
            recipe: "No direct source! A 1.5 gallon batch of a no-water blueberry mead, made using 9 lbs of blueberries and 5.2 lbs of honey, a mix of michigan wildflower and blueberry blossom. 71b yeast. I used pectic enzyme and a paint mixer to macerate the berries<br>following the <a href=#{sna} target=\"_blank\"  rel=\"noopener noreferrer\">SNA nutrient schedule</a>",
            name: "Blueberry Bomb",
            description: "A no water blueberry mead",
            target_abv: 14.0,
            original_gravity: 1.151,
            final_gravity: nil,
            pitch_date: "2022-07-30T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [
                %Note{
                    batch_id: 6,
                    note: "Learned that at this quantity of fruit, Fermaid o may be redundant. Next no water batch will use Fermaid K and DAP instead of following the SNA.",
                    date: "2022-08-01T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 6,
                    note: "Fruit content makes taking readings difficult. Still bubbling, but concerned about yeast performance with an OG this high.",
                    date: "2022-08-02T05:00:00.000Z" |> Seed.create_datetime_from_string
                }                  
            ]
        },
        %Batch{
            id: 7,
            recipe: "<a href=https:\/\/www.reddit.com\/r\/mead\/wiki\/userrecipes\/traditional\/#wiki_dwojniak_traditional target=\"_blank\"  rel=\"noopener noreferrer\">Source</a><br>24 lbs of the best honey I've ever had, in 3 batches. EC1118 yeast.<br>after fermentation it will sit on oak cubes for 2 months",
            name: "The Wheel",
            description: "A Dwojniak Traditional",
            target_abv: 20.0,
            original_gravity: 1.172,
            final_gravity: nil,
            pitch_date: "2022-07-30T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [
                %Note{
                    batch_id: 7,
                    note: "Specific Gravity with first batch of honey measured at 1.082. Using a primitive swamp cooler, hopefully that will correct issues with batch 5",
                    date: "2022-07-30T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 7,
                    note: "Specific Gravity at 1.050. Added second batch of honey and remeaining DAP and Fermaid K. Swamp cooler seems to have successfully slowed down batch, although batch 5's speed may have been influenced by nutrition in the cherry skins.",
                    date: "2022-08-01T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 7,
                    note: "Specific Gravity measured at 1.070. Next honey addition will be at 1.050.",
                    date: "2022-08-02T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 7,
                    note: "Specific Gravity measured at 1.050. Adding honey and Fermaid O.",
                    date: "2022-08-02T05:00:00.000Z" |> Seed.create_datetime_from_string
                }
            ]
        }
    ]
    |> Enum.map(fn batch ->
        Meadtracker.Repo.insert!(batch)
    end)
    