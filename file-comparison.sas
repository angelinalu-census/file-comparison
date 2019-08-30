/*change lib paths and file names depending on files*/

libname path1 base "S:\dataproducts\SummaryFileDocs\2018-1-Year";
libname path2 base "S:\dataproducts\SummaryFileDocs\2018-1-Year\docs";

%let file1 = ACS_1yr_Seq_Table_Number_Lookup;
%let file2 = SequenceNumberTableNumberLookup;

/*uncomment and run one at a time (redundancy)*/

proc sql ;
	create table differences as select * from path1.&file1 
	except select * from path2.&file2;
quit;

proc print data = differences; run;

/*proc compare data=path1.&file1*/
/*	compare=path2.&file2*/
/*	list;*/
/*run;*/
