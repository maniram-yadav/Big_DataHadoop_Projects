all_data = load '/gamedata/*EV{A,N}' using PigStorage(',') as (teams:chararray);           --  all team data
al_data =  load '/gamedata/*EVA' using PigStorage(',') as (team:chararray);       --  amerikan_league data
nl_data =  load '/gamedata/*EVN' using PigStorage(',') as (team:chararray);       --  national_league

all_data_ids = filter all_data by teams MATCHES 'id';
al_data_ids = filter al_data by team MATCHES 'id';
nl_data_ids = filter nl_data by team MATCHES 'id';

all_id_grp = group all_data_ids ALL;
al_id_grp = group al_data_ids ALL;
nl_id_grp = group nl_data_ids ALL;


allcount = foreach all_id_grp generate COUNT(all_data_ids) as tmatch;   -- tmatch total match played
alcount = foreach al_id_grp generate COUNT(al_data_ids) as talm;	-- talm  total amerikan league matches
nlcount = foreach nl_id_grp generate COUNT(nl_data_ids) as tnlm;        -- tnlm  total national league matches


matchcounttable = foreach allcount generate tmatch,alcount.talm,nlcount.tnlm;  --   total matches
store matchcounttable INTO '/gamedata/totalmatches' using PigStorage(',');    --   store data in HDFS
dump matchcounttable;                                                          --   dump data on console
