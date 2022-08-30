# Script for populating the database. You can run it as:
#
#     mix run .\priv\repo\seeds\3_add_8_and_notes.exs
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
            id: 8,
            recipe: "Dry Traditional. An unforgiving style which should showcase the honey flavors. 2.5 lbs of honey per gallon with KV1116 yeast that should go dry. Using SNA. Intention is to test oaking with .4 oz/gallon med. toast american oak",
            name: "Temperance",
            description: "Dry Traditional",
            target_abv: 10.0,
            original_gravity: 1.165,
            final_gravity: nil,
            pitch_date: "2022-08-09T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [
                %Note{
                    batch_id: 8,
                    note: "smells funky. What I'd associate with insufficient nutrition, but I'm adding significant nutrients. Sticking to schedule for now. It's my first time using this yeast and it may be normal.",
                    date: "2022-08-12T05:00:00.000Z" |> Seed.create_datetime_from_string
                },
                %Note{
                    batch_id: 8,
                    note: "Racked and oaked",
                    date: "2022-08-16T05:00:00.000Z" |> Seed.create_datetime_from_string
                }]
        },
        %Batch{
            id: 9,
            recipe: "6lbs of Michigan Raspberries, 3.5 lbs of honey",
            name: "Raspberry Bomb",
            description: "A no water mead with raspberries",
            target_abv: 14.0,
            original_gravity: nil,
            final_gravity: nil,
            pitch_date: "2022-08-27T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [
                %Note{
                    batch_id: 9,
                    note: "Seems to be going slowly, but it is going. Yield is going to be my big problem here. After racking off lees and fruit pulp 1.5 gallons of blueberry mead had less than 1 gallon left.",
                    date: "2022-07-30T05:00:00.000Z" |> Seed.create_datetime_from_string
                }
            ]
        },
        %Batch{
            id: 10,
            recipe: "10 lbs spelt malt, 6 lbs honey, 3 bottles of date syrup. Additionally cumin, coriander, and pistachio. No nutrition, leaving it to the spelt. Collaboration with cool people from Forteza.",
            name: "Sekhmet",
            description: "Attempt to recreate recipe from analysis of egyptian artifacts",
            target_abv: 10.0,
            original_gravity: 1.075,
            final_gravity: nil,
            pitch_date: "2022-08-27T05:00:00.000Z" |> Seed.create_datetime_from_string,
            notes: [
                %Note{
                    batch_id: 10,
                    note: "Going fast, SG at 1.050",
                    date: "2022-08-28T05:00:00.000Z" |> Seed.create_datetime_from_string
                }
            ]
        },
        %Note{
            batch_id: 7,
            note: "SG 1.048 finished sweeter than intention despite cooling fermentation. Suspect chloramine in the water. Adding second pitch of 1118 to try and get SG to drop a few more points.",
            date: "2022-08-16T05:00:00.000Z" |> Seed.create_datetime_from_string
        },
        %Note{
            batch_id: 7,
            note: "SG hit 1.042, actually makes a big difference but it's still very sweet. Compensating by substituting french oak for american oak, for more tannins.",
            date: "2022-08-20T05:00:00.000Z" |> Seed.create_datetime_from_string
        },
        %Note{
            batch_id: 7,
            note: "Racked and oaked.",
            date: "2022-08-21T05:00:00.000Z" |> Seed.create_datetime_from_string
        },
        %Note{
            batch_id: 5,
            note: "Not getting the hibiscus flavors, and it's developed a slight medicinal cherry flavor. Hoping that ages out. Considering using balantine cherries instead of montmorency next batch.",
            date: "2022-08-21T05:00:00.000Z" |> Seed.create_datetime_from_string
        },
        %Note{
            batch_id: 5,
            note: "Racked and oaked",
            date: "2022-08-21T05:00:00.000Z" |> Seed.create_datetime_from_string
        },
        %Note{
            batch_id: 6,
            note: "Racked. Had to use a hop strainer to rack without fruit pulp clogging the racking cane. Tastes great, lots of blueberry flavor, but the total yield for a 1.5 gallon batch was under a gallon.",
            date: "2022-08-21T05:00:00.000Z" |> Seed.create_datetime_from_string
        }
    ]
    |> Enum.map(fn batch ->
        Meadtracker.Repo.insert!(batch)
    end)
    