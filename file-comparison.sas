/*change engines lib paths and file names depending on files*/

/*proc import file = "H:\files from nick\lookup\ACS_1yr_Seq_Table_Number_Lookup.csv" out = file1 dbms = csv replace;*/

data work.file1    ;
	infile 'H:\files from nick\lookup\ACS_1yr_Seq_Table_Number_Lookup.csv' delimiter = ',' 
		MISSOVER DSD lrecl=32767 firstobs=2 ;
run;

data work.file2    ;
	infile 'H:\files from nick\lookup\docs\Seq_Num_and_Table_Num_Lookup.csv' delimiter = ',' 
		MISSOVER DSD lrecl=32767 firstobs=2 ;
run;
/*filename file1 "H:\files from nick\lookup\ACS_1yr_Seq_Table_Number_Lookup.csv";*/
/*filename file2 "H:\files from nick\lookup\Seq_Num_and_Table_Num_Lookup.csv";*/

/*libname path1 "H:\files from nick\lookup";*/
/*libname path2 "H:\files from nick\lookup\docs";*/
/**/
/*%let file1 = ACS_1yr_Seq_Table_Number_Lookup;*/
/*%let file2 = Seq_Num_and_Table_Num_Lookup;*/

data set1;
   infile file1;
   input name $ score;
run;

/*uncomment and run one at a time (redundancy)*/

proc sql ;
	create table differences as select * from file1 
	except select * from file2;
quit;

proc print data = differences; run;

/*proc compare data=file1*/
/*	compare=file2*/
/*	list;*/
/*run;*/
