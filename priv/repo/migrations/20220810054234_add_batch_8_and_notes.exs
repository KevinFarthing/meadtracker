defmodule Meadtracker.Repo.Migrations.AddBatch8AndNotes do
  use Ecto.Migration

  def up do
    execute """
    INSERT INTO public.batches (recipe,name,description,target_abv,original_gravity,final_gravity,pitch_date) VALUES
	 ('Dry Traditional. An unforgiving style which should showcase the honey flavors. 2.5 lbs of honey per gallon with KV1116 yeast that should go dry. Using SNA. Intention is to test oaking with .4 oz/gallon med. toast american oak','Temperance','Dry Traditional',10.0,1.165,NULL,'2022-08-09 05:00:00.000'),
	 ('6lbs of Michigan Raspberries, 3.5 lbs of honey','Raspberry Bomb','A no water mead with raspberries',14.0,NULL,NULL,'2022-08-27 05:00:00.000'),
	 ('10 lbs spelt malt, 6 lbs honey, 3 bottles of date syrup. Additionally cumin, coriander, and pistachio. No nutrition, leaving it to the spelt. Collaboration with cool people from Forteza.','Sekhmet','Attempt to recreate recipe from analysis of egyptian artifacts',10.0,1.075,NULL,'2022-08-27 05:00:00.000');
    """

    execute """
    INSERT INTO public.notes (batch_id,note,"date") VALUES
    (8,'smells funky. What I''d associate with insufficient nutrition, but I''m adding significant nutrients. Sticking to schedule for now. It''s my first time using this yeast and it may be normal.','2022-08-12 05:00:00.000'),
    (8,'Racked and oaked','2022-08-16 05:00:00.000'),
    (9,'Seems to be going slowly, but it is going. Yield is going to be my big problem here. After racking off lees and fruit pulp 1.5 gallons of blueberry mead had less than 1 gallon left.','2022-07-30 05:00:00.000'),
    (10,'Going fast, SG at 1.050','2022-08-28 05:00:00.000'),
    (7,'SG 1.048 finished sweeter than intention despite cooling fermentation. Suspect chloramine in the water. Adding second pitch of 1118 to try and get SG to drop a few more points.','2022-08-16 05:00:00.000'),
    (7,'SG hit 1.042, actually makes a big difference but it''s still very sweet. Compensating by substituting french oak for american oak, for more tannins.','2022-08-20 05:00:00.000'),
    (7,'Racked and oaked.','2022-08-21 05:00:00.000'),
    (5,'Not getting the hibiscus flavors, and it''s developed a slight medicinal cherry flavor. Hoping that ages out. Considering using balantine cherries instead of montmorency next batch.','2022-08-21 05:00:00.000'),
    (5,'Racked and oaked','2022-08-21 05:00:00.000'),
    (6,'Racked. Had to use a hop strainer to rack without fruit pulp clogging the racking cane. Tastes great, lots of blueberry flavor, but the total yield for a 1.5 gallon batch was under a gallon.','2022-08-21 05:00:00.000'); 
    """
  end

  def down do
  end 
end
