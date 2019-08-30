/*change engines lib paths and file names depending on files*/

proc import file = "H:\files from nick\lookup\ACS_1yr_Seq_Table_Number_Lookup.csv" out = file1 dbms = csv replace;
proc import file = "H:\files from nick\lookup\docs\Seq_Num_and_Table_Num_Lookup.csv" out = file2 dbms = csv replace;

/*uncomment and run one at a time (redundancy)*/

/*proc sql ;*/
/*	create table differences as select * from file1 */
/*	except select * from file2;*/
/*quit;*/

/*proc print data = differences; run;*/

proc compare data=file1
	compare=file2
	list;
run;
