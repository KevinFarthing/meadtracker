defmodule Meadtracker.Repo.Migrations.AddNext3 do
  use Ecto.Migration

  def up do
    execute """
    INSERT INTO public.batches (recipe,name,description,target_abv,original_gravity,final_gravity,pitch_date) VALUES
      ('<a href=https://www.reddit.com/r/mead/wiki/userrecipes/melomel/ target="_blank"  rel="noopener noreferrer">Source</a><br>5 Gallon Batch, 1 lb dried hibiscus, 25 lbs of montmorency cherries picked in Michigan, 20.5 lbs of honey added in 3 batches<br>OG is theoretical due to staggered honey additions. EC1118 yeast.<br>after fermentation it will sit on oak cubes for 2 months','The Tower','A High ABV Cherry and Hibiscus mead',20.0,1.165,NULL,'2022-07-21 05:00:00.000'),
      ('No direct source! A 1.5 gallon batch of a no-water blueberry mead, made using 9 lbs of blueberries and 5.2 lbs of honey, a mix of michigan wildflower and blueberry blossom. 71b yeast. I used pectic enzyme and a paint mixer to macerate the berries<br>following the <a href=https://www.reddit.com/r/mead/wiki/process/staggered_nutrient_additions/ target="_blank"  rel="noopener noreferrer">SNA nutrient schedule</a>','Blueberry Bomb','A no water blueberry mead',14.0,1.151,NULL,'2022-07-30 05:00:00.000'),
      ('<a href=https://www.reddit.com/r/mead/wiki/userrecipes/traditional/#wiki_dwojniak_traditional target="_blank"  rel="noopener noreferrer">Source</a><br>24 lbs of the best honey I''ve ever had, in 3 batches. EC1118 yeast.<br>after fermentation it will sit on oak cubes for 2 months','The Wheel','A Dwojniak Traditional',20.0,1.172,NULL,'2022-07-30 05:00:00.000'); 
    """

    execute """
    INSERT INTO public.notes (batch_id,note,"date") VALUES
      (5,'gravity with first batch of honey is 1.085','2022-07-21 05:00:00.000'),
      (5,'gravity dropped to 1.030 already, outpacing the nutrient schedule. Adding second batch of honey. SG at 1.065','2022-07-23 05:00:00.000'),
      (5,'gravity is back to 1.030, still badly outpacing nutrient schedule. Suspect fermentation temp is too high. Adding last batch of honey and a double dose of Fermaid O','2022-07-24 05:00:00.000'),
      (5,'fermentation is slowing at 1.040, which puts it at about 16% abv. It has to sit for a while before I can add the oak, hoping it goes a little further. The flavor is great, but incredibly tart. 1.040 and it still needs more sugar.','2022-07-30 05:00:00.000'),
      (6,'Learned that at this quantity of fruit, Fermaid o may be redundant. Next no water batch will use Fermaid K and DAP instead of following the SNA.','2022-08-01 05:00:00.000'),
      (6,'Fruit content makes taking readings difficult. Still bubbling, but concerned about yeast performance with an OG this high.','2022-08-02 05:00:00.000'),
      (7,'Specific Gravity with first batch of honey measured at 1.082. Using a primitive swamp cooler, hopefully that will correct issues with batch 5','2022-07-30 05:00:00.000'),
      (7,'Specific Gravity at 1.050. Added second batch of honey and remeaining DAP and Fermaid K. Swamp cooler seems to have successfully slowed down batch, although batch 5''s speed may have been influenced by nutrition in the cherry skins.','2022-08-01 05:00:00.000'),
      (7,'Specific Gravity measured at 1.070. Next honey addition will be at 1.050.','2022-08-02 05:00:00.000'),
      (7,'Specific Gravity measured at 1.050. Adding honey and Fermaid O.','2022-08-02 05:00:00.000'); 
    """
  end

  def down do
  end 
end
