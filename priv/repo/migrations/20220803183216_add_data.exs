defmodule Meadtracker.Repo.Migrations.AddData do
  use Ecto.Migration

  def up do
    execute """
    INSERT INTO public.batches (recipe,name,description,target_abv,original_gravity,final_gravity,pitch_date) VALUES
      ('<a href=https://www.reddit.com/r/mead/wiki/recipes/traditionals/0001/>Source</a><br>1 Gallon Batch, 2.5 lbs honey, Safale US-05.','Beginner Traditional','A basic semi-sweet mead',10.0,1.075,1.013,'2022-04-09 05:00:00.000'),
      ('<a href=https://www.homebrewtalk.com/threads/joes-ancient-orange-mead.49106/>Source</a><br>Replaced bread yeast with Safale US-05, used juice and zest of 1 orange instead of slices to remove the pith, and included nutrition. Raisins were kept from original recipe. I meant to include some black tea for tannins, notes for next time.','JOAM-ish','The first rule of JOAM is don''t change the recipe. Experiment to change the recipe.',12.0,1.12,1.02,'2022-04-26 05:00:00.000'),
      ('<a href=https://www.reddit.com/r/mead/wiki/recipes/metheglins/0002/>Source</a><br>3 lbs of honey, D47 yeast, and 5 bags of chai tea. I made a tea from the teabags, mixed the honey into that, added water to 1 gallon, and pitched the yeast<br>following the <a href=https://www.reddit.com/r/mead/wiki/process/staggered_nutrient_additions/>SNA nutrient schedule</a>','Chai Metheglin','A dry mead with chai spices',14.0,1.108,1.0,'2022-05-23 05:00:00.000'),
      ('<a href=https://www.reddit.com/r/mead/comments/hq2e4r/july_challenge_root_beer_mead/>Source</a><br>Safale US-05 yeast, 2 TB Sarsaparilla Bark, 1 TB Birch Bark, 1 Star Anise Pod, 1/2 tb Wintergreen, 1 Cinnamon Stick<br>Used spices to make a strong tea prior to pitch, added 3 lbs honey and pitched yeast<br>following the <a href=https://www.reddit.com/r/mead/wiki/process/staggered_nutrient_additions/>SNA nutrient schedule</a>','Root Beer Metheglin','A mead that should invoke root beer flavors',10.0,1.108,1.012,'2022-06-20 05:00:00.000');
    """

    execute """
    INSERT INTO public.notes (batch_id,note,"date") VALUES
      (1,'didn''t have a hydrometer so OG is an approximation. Specific gravity was measured at 1.070 day after pitch','2022-04-10 05:00:00.000'),
      (1,'SG measured at 1.060, added Fermaid K and DAP','2022-04-14 05:00:00.000'),
      (1,'SG stable at 1.013. Racked','2022-05-07 05:00:00.000'),
      (2,'slowing at 1.030. adding a bit of Fermaid O','2022-05-23 05:00:00.000'),
      (2,'Stable at 1.020, racking','2022-06-03 05:00:00.000'),
      (3,'SG measured at 1.065. Moving fast.','2022-05-27 05:00:00.000'),
      (3,'SG measured at 1.020','2022-05-30 05:00:00.000'),
      (3,'SG measured at 0.970, due to hydrometer damage. The cap on top isn''t sealed and water got in and disrupted my readings.','2022-05-30 05:00:00.000'),
      (3,'Measured final gravity at 1.000 with corrected hydrometer','2022-06-15 05:00:00.000'),
      (4,'it hit 1.030 and it''s delicious','2022-06-28 05:00:00.000'),
      (4,'continued to 1.012 and it''s lost most of the root beer flavor. Sweetening samples has not changed it. Not sure what happened.','2022-06-30 05:00:00.000'),
      (4,'let sit on .5 oz of Sarsparilla root for 2 days.','2022-07-13 05:00:00.000');
    """
  end

  def down do
  end
end
