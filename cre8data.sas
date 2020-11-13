/*************************************************************
 Note: This program is designed to run in SAS Studio. 
 
 STEP 1: Right-click on the Census Data Analysis folder in the 
         Files and Folders section and select Properties.

 STEP 2: Highlight the path provided in the Location field and
         press Ctrl+C to copy the text. Click Close.

 STEP 3: In the %LET statement below, highlight insertpath. 
         Press Ctrl+V to paste the path.

 STEP 4: Click Run or press F3.
 
 STEP 5: Confirm that 9 tables are listed in the generated 
 		 report. In addition to the 9 tables, verify that 3 
 		 Excel files are listed under the Census Data Analysis 
 		 folder.

*************************************************************/

%let path=insertpath;

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 WARNING: DO NOT ALTER CODE BELOW THIS LINE UNLESS DIRECTED 
          TO DO SO BY YOUR INSTRUCTOR.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

libname temp "&path";

options validvarname=any;

/* Educational Attainment_s.xlsx */
data temp.EDUCATIONAL_ATTAINMENT_S;
  infile datalines dsd truncover;
  input Educational_Attainment:$43. Mountain:COMMA15. "West South Central"n:COMMA15. "East North Central"n:COMMA15. "West North Central"n:COMMA15. "Middle Atlantic"n:COMMA15. "New England"n:COMMA15. "South Atlantic"n:COMMA15. "East South Central"n:COMMA15. Pacific:COMMA15.;
  format Educational_Attainment:$43. Mountain:COMMA15. "West South Central"n:COMMA15. "East North Central"n:COMMA15. "West North Central"n:COMMA15. "Middle Atlantic"n:COMMA15. "New England"n:COMMA15. "South Atlantic"n:COMMA15. "East South Central"n:COMMA15. Pacific:COMMA15.;
  label Educational_Attainment="Educational_Attainment" Mountain="Mountain" "West South Central"n="West South Central" "East North Central"n="East North Central" "West North Central"n="West North Central" "Middle Atlantic"n="Middle Atlantic" "New England"n="New England" "South Atlantic"n="South Atlantic" "East South Central"n="East South Central" Pacific="Pacific";
datalines4;
Less than high school graduate,"1,721,131","3,966,774","3,080,659","1,177,875","3,176,958","917,018","5,116,012","1,702,787","5,184,949"
High school graduate (includes equivalency),"3,984,069","7,203,429","9,570,626","3,962,962","8,290,185","2,712,566","12,400,658","4,084,382","7,753,016"
Some college or associate's degree,"5,407,709","7,563,313","9,592,558","4,597,023","6,910,130","2,603,070","12,901,313","3,867,874","10,959,340"
Bachelor's degree,"3,333,351","4,854,673","6,051,275","2,989,848","6,105,317","2,388,242","8,989,974","2,064,493","7,822,013"
Graduate or professional degree,"1,951,932","2,644,193","3,768,054","1,630,595","4,373,623","1,845,877","5,916,842","1,275,448","4,744,711"
;;;;

proc export data=temp.Educational_Attainment_s outfile="&path/Educational Attainment_s.xlsx" dbms=xlsx replace;
run;

proc delete data=temp.Educational_Attainment_s;
run;


/* Median Home Value_s.xlsx */
libname temp2 xlsx "&path/Median Home Value_s.xlsx";
data temp.MEDIAN_HOME_VALUE_S;
  infile datalines dsd truncover;
  input GEO_ID:$11. State:$20. MedianHome:NLMNY15. MedianHomeMOE:NLMNY15.;
  format MedianHome nlmny15. MedianHomeMOE nlmny15.;
  label GEO_ID="GEO_ID" State="State" MedianHome="MedianHome" MedianHomeMOE="MedianHomeMOE";
datalines4;
0400000US08,Colorado,"$373,300","$2,652"
0400000US18,Indiana,"$147,300","$1,112"
0400000US21,Kentucky,"$148,100","$1,710"
0400000US22,Louisiana,"$167,300","$1,737"
0400000US17,Illinois,"$203,400","$1,452"
0400000US19,Iowa,"$152,000","$1,552"
0400000US33,New Hampshire,"$270,000","$3,971"
0400000US05,Arkansas,"$133,100","$2,166"
0400000US10,Delaware,"$255,300","$5,345"
0400000US27,Minnesota,"$235,400","$1,474"
0400000US30,Montana,"$249,200","$3,832"
0400000US23,Maine,"$197,500","$3,603"
0400000US37,North Carolina,"$180,600","$1,360"
0400000US13,Georgia,"$189,900","$1,427"
0400000US02,Alaska,"$276,100","$4,365"
0400000US01,Alabama,"$147,900","$2,304"
0400000US50,Vermont,"$233,100","$4,924"
0400000US32,Nevada,"$292,200","$3,090"
0400000US54,West Virginia,"$121,300","$2,213"
0400000US40,Oklahoma,"$140,000","$1,621"
0400000US55,Wisconsin,"$188,500","$1,266"
0400000US72,Puerto Rico,"$110,800","$1,053"
0400000US51,Virginia,"$281,700","$1,804"
0400000US38,North Dakota,"$198,700","$4,472"
0400000US45,South Carolina,"$170,800","$1,570"
0400000US41,Oregon,"$341,800","$2,876"
0400000US56,Wyoming,"$230,500","$4,260"
0400000US06,California,"$546,800","$2,008"
0400000US28,Mississippi,"$123,300","$2,586"
0400000US09,Connecticut,"$277,400","$2,057"
0400000US48,Texas,"$186,000","$1,168"
0400000US24,Maryland,"$324,800","$2,183"
0400000US12,Florida,"$230,600","$1,248"
0400000US25,Massachusetts,"$400,700","$2,804"
0400000US11,District of Columbia,"$617,900","$17,497"
0400000US49,Utah,"$303,300","$3,085"
0400000US36,New York,"$325,500","$2,465"
0400000US34,New Jersey,"$344,000","$2,091"
0400000US39,Ohio,"$151,100",$792
0400000US29,Missouri,"$162,600","$1,170"
0400000US42,Pennsylvania,"$186,000","$1,108"
0400000US26,Michigan,"$162,500",$780
0400000US31,Nebraska,"$161,800","$1,688"
0400000US16,Idaho,"$233,100","$3,293"
0400000US35,New Mexico,"$174,700","$2,990"
0400000US15,Hawaii,"$631,700","$7,721"
0400000US46,South Dakota,"$171,500","$3,010"
0400000US53,Washington,"$373,100","$2,028"
0400000US44,Rhode Island,"$273,800","$4,578"
0400000US04,Arizona,"$241,100","$1,921"
0400000US47,Tennessee,"$177,500","$1,856"
0400000US20,Kansas,"$159,400","$1,838"
;;;;

ods exclude all;
ods excel file="&path/Median Home Value_s.xlsx" style=pearl;
ods excel select report;
proc report data=temp.median_home_value_s;
  columns _all_;
run;
ods excel close;
ods exclude none;
/* proc export data=temp.Median_Home_Value_s outfile="&path/Median Home Value_s.xlsx" dbms=xlsx replace; */
/* run; */

proc delete data=temp.Median_Home_Value_s;
run;


/* Total Population_s.xlsx */
data temp.TOTAL_POPULATION_S;
  infile datalines dsd truncover;
  input GEO_ID:$11. State:$20. TotalPopulation:COMMA15.;
  format TotalPopulation COMMA15.;
  label GEO_ID="GEO_ID" State="State" TotalPopulation="TotalPopulation";
datalines4;
0400000US08,Colorado,"5,695,564"
0400000US18,Indiana,"6,691,878"
0400000US21,Kentucky,"4,468,402"
0400000US22,Louisiana,"4,659,978"
0400000US17,Illinois,"12,741,080"
0400000US19,Iowa,"3,156,145"
0400000US33,New Hampshire,"1,356,458"
0400000US05,Arkansas,"3,013,825"
0400000US10,Delaware,"967,171"
0400000US27,Minnesota,"5,611,179"
0400000US30,Montana,"1,062,305"
0400000US23,Maine,"1,338,404"
0400000US37,North Carolina,"10,383,620"
0400000US13,Georgia,"10,519,475"
0400000US02,Alaska,"737,438"
0400000US01,Alabama,"4,887,871"
0400000US50,Vermont,"626,299"
0400000US32,Nevada,"3,034,392"
0400000US54,West Virginia,"1,805,832"
0400000US40,Oklahoma,"3,943,079"
0400000US55,Wisconsin,"5,813,568"
0400000US72,Puerto Rico,"3,195,153"
0400000US51,Virginia,"8,517,685"
0400000US38,North Dakota,"760,077"
0400000US45,South Carolina,"5,084,127"
0400000US41,Oregon,"4,190,713"
0400000US56,Wyoming,"577,737"
0400000US06,California,"39,557,045"
0400000US28,Mississippi,"2,986,530"
0400000US09,Connecticut,"3,572,665"
0400000US48,Texas,"28,701,845"
0400000US24,Maryland,"6,042,718"
0400000US12,Florida,"21,299,325"
0400000US25,Massachusetts,"6,902,149"
0400000US11,District of Columbia,"702,455"
0400000US49,Utah,"3,161,105"
0400000US36,New York,"19,542,209"
0400000US34,New Jersey,"8,908,520"
0400000US39,Ohio,"11,689,442"
0400000US29,Missouri,"6,126,452"
0400000US42,Pennsylvania,"12,807,060"
0400000US26,Michigan,"9,995,915"
0400000US31,Nebraska,"1,929,268"
0400000US16,Idaho,"1,754,208"
0400000US35,New Mexico,"2,095,428"
0400000US15,Hawaii,"1,420,491"
0400000US46,South Dakota,"882,235"
0400000US53,Washington,"7,535,591"
0400000US44,Rhode Island,"1,057,315"
0400000US04,Arizona,"7,171,646"
0400000US47,Tennessee,"6,770,010"
0400000US20,Kansas,"2,911,510"
;;;;

proc export data=temp.Total_Population_s outfile="&path/Total Population_s.xlsx" dbms=xlsx replace;
run;

proc delete data=temp.Total_Population_s;
run;


/* Delete Backup XLSX Files */
%macro xlsx_bak_delete(file=) / des='Delete backup spreadsheets';
option mprint notes;
data _null_;
fname = 'todelete';
rc = filename(fname, "&file..xlsx.bak");
rc = fdelete(fname);
rc = filename(fname);
run;
%mend xlsx_bak_delete;

%xlsx_bak_delete(file=&path/Educational Attainment_s)
%xlsx_bak_delete(file=&path/Median Home Value_s)
%xlsx_bak_delete(file=&path/Total Population_s)


/* education_stacked_s.sas7bdat */
data temp.EDUCATION_STACKED_S;
  infile datalines dsd truncover;
  input Educational_Attainment:$43. Division:$18. Count:COMMA15.;
  format Count COMMA15.;
  label Educational_Attainment="Educational_Attainment" Division="NAME OF FORMER VARIABLE";
datalines4;
Less than high school graduate,Mountain,"1,721,131"
Less than high school graduate,West South Central,"3,966,774"
Less than high school graduate,East North Central,"3,080,659"
Less than high school graduate,West North Central,"1,177,875"
Less than high school graduate,Middle Atlantic,"3,176,958"
Less than high school graduate,New England,"917,018"
Less than high school graduate,South Atlantic,"5,116,012"
Less than high school graduate,East South Central,"1,702,787"
Less than high school graduate,Pacific,"5,184,949"
High school graduate (includes equivalency),Mountain,"3,984,069"
High school graduate (includes equivalency),West South Central,"7,203,429"
High school graduate (includes equivalency),East North Central,"9,570,626"
High school graduate (includes equivalency),West North Central,"3,962,962"
High school graduate (includes equivalency),Middle Atlantic,"8,290,185"
High school graduate (includes equivalency),New England,"2,712,566"
High school graduate (includes equivalency),South Atlantic,"12,400,658"
High school graduate (includes equivalency),East South Central,"4,084,382"
High school graduate (includes equivalency),Pacific,"7,753,016"
Some college or associate's degree,Mountain,"5,407,709"
Some college or associate's degree,West South Central,"7,563,313"
Some college or associate's degree,East North Central,"9,592,558"
Some college or associate's degree,West North Central,"4,597,023"
Some college or associate's degree,Middle Atlantic,"6,910,130"
Some college or associate's degree,New England,"2,603,070"
Some college or associate's degree,South Atlantic,"12,901,313"
Some college or associate's degree,East South Central,"3,867,874"
Some college or associate's degree,Pacific,"10,959,340"
Bachelor's degree,Mountain,"3,333,351"
Bachelor's degree,West South Central,"4,854,673"
Bachelor's degree,East North Central,"6,051,275"
Bachelor's degree,West North Central,"2,989,848"
Bachelor's degree,Middle Atlantic,"6,105,317"
Bachelor's degree,New England,"2,388,242"
Bachelor's degree,South Atlantic,"8,989,974"
Bachelor's degree,East South Central,"2,064,493"
Bachelor's degree,Pacific,"7,822,013"
Graduate or professional degree,Mountain,"1,951,932"
Graduate or professional degree,West South Central,"2,644,193"
Graduate or professional degree,East North Central,"3,768,054"
Graduate or professional degree,West North Central,"1,630,595"
Graduate or professional degree,Middle Atlantic,"4,373,623"
Graduate or professional degree,New England,"1,845,877"
Graduate or professional degree,South Atlantic,"5,916,842"
Graduate or professional degree,East South Central,"1,275,448"
Graduate or professional degree,Pacific,"4,744,711"
;;;;


/* geo_lookup.sas7bdat */
data temp.GEO_LOOKUP;
  infile datalines dsd truncover;
  input RegionNum:BEST12. Region:$16. DivisionNum:BEST12. Division:$27. StateNum_FIPS:$2. State:$20.;
  format RegionNum BEST12. DivisionNum BEST12.;
  label RegionNum="Region Number" DivisionNum="Division Number" StateNum_FIPS="State FIPS Codes";
datalines4;
1,Northeast,1,New England,09,Connecticut
1,Northeast,1,New England,23,Maine
1,Northeast,1,New England,25,Massachusetts
1,Northeast,1,New England,33,New Hampshire
1,Northeast,1,New England,44,Rhode Island
1,Northeast,1,New England,50,Vermont
1,Northeast,2,Middle Atlantic,34,New Jersey
1,Northeast,2,Middle Atlantic,36,New York
1,Northeast,2,Middle Atlantic,42,Pennsylvania
2,Midwest,3,East North Central,17,Illinois
2,Midwest,3,East North Central,18,Indiana
2,Midwest,3,East North Central,26,Michigan
2,Midwest,3,East North Central,39,Ohio
2,Midwest,3,East North Central,55,Wisconsin
2,Midwest,4,West North Central,19,Iowa
2,Midwest,4,West North Central,20,Kansas
2,Midwest,4,West North Central,27,Minnesota
2,Midwest,4,West North Central,29,Missouri
2,Midwest,4,West North Central,31,Nebraska
2,Midwest,4,West North Central,38,North Dakota
2,Midwest,4,West North Central,46,South Dakota
3,South,5,South Atlantic,10,Delaware
3,South,5,South Atlantic,11,District of Columbia
3,South,5,South Atlantic,12,Florida
3,South,5,South Atlantic,13,Georgia
3,South,5,South Atlantic,24,Maryland
3,South,5,South Atlantic,37,North Carolina
3,South,5,South Atlantic,45,South Carolina
3,South,5,South Atlantic,51,Virginia
3,South,5,South Atlantic,54,West Virginia
3,South,6,East South Central,01,Alabama
3,South,6,East South Central,21,Kentucky
3,South,6,East South Central,28,Mississippi
3,South,6,East South Central,47,Tennessee
3,South,7,West South Central,05,Arkansas
3,South,7,West South Central,22,Louisiana
3,South,7,West South Central,40,Oklahoma
3,South,7,West South Central,48,Texas
4,West,8,Mountain,04,Arizona
4,West,8,Mountain,08,Colorado
4,West,8,Mountain,16,Idaho
4,West,8,Mountain,30,Montana
4,West,8,Mountain,32,Nevada
4,West,8,Mountain,35,New Mexico
4,West,8,Mountain,49,Utah
4,West,8,Mountain,56,Wyoming
4,West,9,Pacific,02,Alaska
4,West,9,Pacific,06,California
4,West,9,Pacific,15,Hawaii
4,West,9,Pacific,41,Oregon
4,West,9,Pacific,53,Washington
;;;;



/* medianage.sas7bdat */
data temp.MEDIANAGE;
  infile datalines dsd truncover;
  input GEO_ID:$11. State:$20. MedianAge:BEST. MedianAgeMOE:BEST.;
  format MedianAge BEST. MedianAgeMOE BEST.;
  label GEO_ID="GEO_ID" State="State" MedianAge="Median Age" MedianAgeMOE="MedianAgeMOE";
datalines4;
0400000US23,Maine,45.1,0.2
0400000US37,North Carolina,38.9,0.2
0400000US13,Georgia,36.8,0.3
0400000US02,Alaska,34.9,0.2
0400000US01,Alabama,39.3,0.2
0400000US50,Vermont,43.1,0.3
0400000US32,Nevada,38.2,0.2
0400000US54,West Virginia,42.8,0.2
0400000US40,Oklahoma,36.7,0.2
0400000US55,Wisconsin,39.6,0.2
0400000US72,Puerto Rico,42.9,0.2
0400000US51,Virginia,38.3,0.1
0400000US38,North Dakota,35.4,0.3
0400000US45,South Carolina,39.7,0.2
0400000US41,Oregon,39.6,0.2
0400000US56,Wyoming,38.5,0.3
0400000US06,California,36.7,0.1
0400000US28,Mississippi,37.7,0.2
0400000US09,Connecticut,41.1,0.2
0400000US48,Texas,34.9,0.1
0400000US24,Maryland,38.8,0.1
0400000US12,Florida,42.2,0.2
0400000US25,Massachusetts,39.5,0.2
0400000US11,District of Columbia,33.9,0.2
0400000US49,Utah,31,0.2
0400000US36,New York,39,0.1
0400000US34,New Jersey,40,0.1
0400000US39,Ohio,39.5,0.1
0400000US29,Missouri,38.8,0.1
0400000US42,Pennsylvania,40.8,0.1
0400000US26,Michigan,39.8,0.1
0400000US31,Nebraska,36.7,0.2
0400000US16,Idaho,36.8,0.2
0400000US35,New Mexico,38.1,0.3
0400000US15,Hawaii,39.3,0.3
0400000US46,South Dakota,37.2,0.3
0400000US53,Washington,37.7,0.2
0400000US44,Rhode Island,40,0.4
0400000US04,Arizona,38,0.2
0400000US47,Tennessee,38.9,0.2
0400000US20,Kansas,37.1,0.2
0400000US08,Colorado,36.9,0.1
0400000US18,Indiana,37.8,0.2
0400000US21,Kentucky,39.1,0.2
0400000US22,Louisiana,37.3,0.2
0400000US17,Illinois,38.3,0.1
0400000US19,Iowa,38.1,0.2
0400000US33,New Hampshire,43.1,0.2
0400000US05,Arkansas,38.1,0.3
0400000US10,Delaware,41.1,0.5
0400000US27,Minnesota,38.2,0.2
0400000US30,Montana,40.1,0.3
;;;;


/* medianhomevalue_s.sas7bdat */
data temp.MEDIANHOMEVALUE_S;
  infile datalines dsd truncover;
  input GEO_ID:$11. State:$20. MedianHome:NLMNY15. MedianHomeMOE:NLMNY15.;
  format MedianHome NLMNY15. MedianHomeMOE NLMNY15.;
  label GEO_ID="GEO_ID" State="State" MedianHome="MedianHome" MedianHomeMOE="MedianHomeMOE";
datalines4;
0400000US08,Colorado,"$373,300","$2,652"
0400000US18,Indiana,"$147,300","$1,112"
0400000US21,Kentucky,"$148,100","$1,710"
0400000US22,Louisiana,"$167,300","$1,737"
0400000US17,Illinois,"$203,400","$1,452"
0400000US19,Iowa,"$152,000","$1,552"
0400000US33,New Hampshire,"$270,000","$3,971"
0400000US05,Arkansas,"$133,100","$2,166"
0400000US10,Delaware,"$255,300","$5,345"
0400000US27,Minnesota,"$235,400","$1,474"
0400000US30,Montana,"$249,200","$3,832"
0400000US23,Maine,"$197,500","$3,603"
0400000US37,North Carolina,"$180,600","$1,360"
0400000US13,Georgia,"$189,900","$1,427"
0400000US02,Alaska,"$276,100","$4,365"
0400000US01,Alabama,"$147,900","$2,304"
0400000US50,Vermont,"$233,100","$4,924"
0400000US32,Nevada,"$292,200","$3,090"
0400000US54,West Virginia,"$121,300","$2,213"
0400000US40,Oklahoma,"$140,000","$1,621"
0400000US55,Wisconsin,"$188,500","$1,266"
0400000US72,Puerto Rico,"$110,800","$1,053"
0400000US51,Virginia,"$281,700","$1,804"
0400000US38,North Dakota,"$198,700","$4,472"
0400000US45,South Carolina,"$170,800","$1,570"
0400000US41,Oregon,"$341,800","$2,876"
0400000US56,Wyoming,"$230,500","$4,260"
0400000US06,California,"$546,800","$2,008"
0400000US28,Mississippi,"$123,300","$2,586"
0400000US09,Connecticut,"$277,400","$2,057"
0400000US48,Texas,"$186,000","$1,168"
0400000US24,Maryland,"$324,800","$2,183"
0400000US12,Florida,"$230,600","$1,248"
0400000US25,Massachusetts,"$400,700","$2,804"
0400000US11,District of Columbia,"$617,900","$17,497"
0400000US49,Utah,"$303,300","$3,085"
0400000US36,New York,"$325,500","$2,465"
0400000US34,New Jersey,"$344,000","$2,091"
0400000US39,Ohio,"$151,100",$792
0400000US29,Missouri,"$162,600","$1,170"
0400000US42,Pennsylvania,"$186,000","$1,108"
0400000US26,Michigan,"$162,500",$780
0400000US31,Nebraska,"$161,800","$1,688"
0400000US16,Idaho,"$233,100","$3,293"
0400000US35,New Mexico,"$174,700","$2,990"
0400000US15,Hawaii,"$631,700","$7,721"
0400000US46,South Dakota,"$171,500","$3,010"
0400000US53,Washington,"$373,100","$2,028"
0400000US44,Rhode Island,"$273,800","$4,578"
0400000US04,Arizona,"$241,100","$1,921"
0400000US47,Tennessee,"$177,500","$1,856"
0400000US20,Kansas,"$159,400","$1,838"
;;;;


/* medianincome.sas7bdat */
data temp.MEDIANINCOME;
  infile datalines dsd truncover;
  input GEO_ID:$11. State:$20. MedianIncome:DOLLAR8. MedianIncomeMOE:DOLLAR7.;
  format MedianIncome DOLLAR8. MedianIncomeMOE DOLLAR7.;
  label MedianIncome="Median Household Income" MedianIncomeMOE="Median Household Income (MOE)";
datalines4;
0400000US23,Maine,"$55,602","$1,326"
0400000US37,North Carolina,"$53,855",$573
0400000US13,Georgia,"$58,756",$711
0400000US02,Alaska,"$74,346","$2,288"
0400000US01,Alabama,"$49,861",$783
0400000US50,Vermont,"$60,782","$1,551"
0400000US32,Nevada,"$58,646","$1,133"
0400000US54,West Virginia,"$44,097","$1,016"
0400000US40,Oklahoma,"$51,924",$450
0400000US55,Wisconsin,"$60,773",$391
0400000US72,Puerto Rico,"$20,296",$426
0400000US51,Virginia,"$72,577",$686
0400000US38,North Dakota,"$63,837","$2,324"
0400000US45,South Carolina,"$52,306",$631
0400000US41,Oregon,"$63,426","$1,056"
0400000US56,Wyoming,"$61,584","$1,401"
0400000US06,California,"$75,277",$317
0400000US28,Mississippi,"$44,717",$793
0400000US09,Connecticut,"$76,348",$921
0400000US48,Texas,"$60,629",$279
0400000US24,Maryland,"$83,242","$1,022"
0400000US12,Florida,"$55,462",$384
0400000US25,Massachusetts,"$79,835",$970
0400000US11,District of Columbia,"$85,203","$3,414"
0400000US49,Utah,"$71,414",$741
0400000US36,New York,"$67,844",$637
0400000US34,New Jersey,"$81,740",$687
0400000US39,Ohio,"$56,111",$425
0400000US29,Missouri,"$54,478",$751
0400000US42,Pennsylvania,"$60,905",$315
0400000US26,Michigan,"$56,697",$406
0400000US31,Nebraska,"$59,566","$1,072"
0400000US16,Idaho,"$55,583",$915
0400000US35,New Mexico,"$47,169",$900
0400000US15,Hawaii,"$80,212","$2,020"
0400000US46,South Dakota,"$56,274","$1,454"
0400000US53,Washington,"$74,073",$697
0400000US44,Rhode Island,"$64,340","$2,058"
0400000US04,Arizona,"$59,246",$732
0400000US47,Tennessee,"$52,375",$489
0400000US20,Kansas,"$58,218",$773
0400000US08,Colorado,"$71,953",$655
0400000US18,Indiana,"$55,746",$522
0400000US21,Kentucky,"$50,247",$567
0400000US22,Louisiana,"$47,905",$740
0400000US17,Illinois,"$65,030",$500
0400000US19,Iowa,"$59,955",$877
0400000US33,New Hampshire,"$74,991","$1,555"
0400000US05,Arkansas,"$47,062",$713
0400000US10,Delaware,"$64,805","$1,570"
0400000US27,Minnesota,"$70,315",$539
0400000US30,Montana,"$55,328","$1,172"
;;;;


/* population2010.sas7bdat */
data temp.POPULATION2010;
  infile datalines dsd truncover;
  input GEO_ID:$11. State:$20. TotalPop2010:COMMA15.;
  format TotalPop2010 COMMA15.;
  label GEO_ID="GEO_ID" State="State" TotalPop2010="Population2010";
datalines4;
0400000US01,Alabama,"4,785,298"
0400000US02,Alaska,"713,985"
0400000US04,Arizona,"6,413,737"
0400000US05,Arkansas,"2,921,606"
0400000US06,California,"37,349,363"
0400000US08,Colorado,"5,049,071"
0400000US09,Connecticut,"3,577,073"
0400000US10,Delaware,"899,769"
0400000US11,District of Columbia,"604,453"
0400000US12,Florida,"18,843,326"
0400000US13,Georgia,"9,712,587"
0400000US15,Hawaii,"1,363,621"
0400000US16,Idaho,"1,571,450"
0400000US17,Illinois,"12,843,166"
0400000US22,Louisiana,"4,544,228"
0400000US18,Indiana,"6,490,621"
0400000US19,Iowa,"3,049,883"
0400000US20,Kansas,"2,859,169"
0400000US21,Kentucky,"4,346,266"
0400000US23,Maine,"1,327,567"
0400000US24,Maryland,"5,785,982"
0400000US25,Massachusetts,"6,557,254"
0400000US26,Michigan,"9,877,574"
0400000US27,Minnesota,"5,310,584"
0400000US28,Mississippi,"2,970,036"
0400000US29,Missouri,"5,996,231"
0400000US30,Montana,"990,898"
0400000US31,Nebraska,"1,830,429"
0400000US32,Nevada,"2,704,642"
0400000US33,New Hampshire,"1,316,759"
0400000US34,New Jersey,"8,801,624"
0400000US35,New Mexico,"2,065,932"
0400000US36,New York,"19,392,283"
0400000US37,North Carolina,"9,561,558"
0400000US38,North Dakota,"674,499"
0400000US39,Ohio,"11,536,182"
0400000US40,Oklahoma,"3,761,702"
0400000US41,Oregon,"3,838,957"
0400000US42,Pennsylvania,"12,709,630"
0400000US44,Rhode Island,"1,052,886"
0400000US45,South Carolina,"4,636,312"
0400000US46,South Dakota,"816,463"
0400000US47,Tennessee,"6,356,897"
0400000US48,Texas,"25,257,114"
0400000US49,Utah,"2,776,469"
0400000US50,Vermont,"625,960"
0400000US51,Virginia,"8,024,617"
0400000US53,Washington,"6,744,496"
0400000US54,West Virginia,"1,853,973"
0400000US55,Wisconsin,"5,691,047"
0400000US56,Wyoming,"564,460"
0400000US72,Puerto Rico,"3,722,133"
;;;;


/* population2018.sas7bdat */
data temp.POPULATION2018;
  infile datalines dsd truncover;
  input GEO_ID:$11. State:$20. TotalPop2018:COMMA15.;
  format TotalPop2018 COMMA15.;
  label GEO_ID="GEO_ID" State="State" TotalPop2018="Population2018";
datalines4;
0400000US23,Maine,"1,338,404"
0400000US37,North Carolina,"10,383,620"
0400000US13,Georgia,"10,519,475"
0400000US02,Alaska,"737,438"
0400000US01,Alabama,"4,887,871"
0400000US50,Vermont,"626,299"
0400000US32,Nevada,"3,034,392"
0400000US54,West Virginia,"1,805,832"
0400000US40,Oklahoma,"3,943,079"
0400000US55,Wisconsin,"5,813,568"
0400000US72,Puerto Rico,"3,195,153"
0400000US51,Virginia,"8,517,685"
0400000US38,North Dakota,"760,077"
0400000US45,South Carolina,"5,084,127"
0400000US41,Oregon,"4,190,713"
0400000US56,Wyoming,"577,737"
0400000US06,California,"39,557,045"
0400000US28,Mississippi,"2,986,530"
0400000US09,Connecticut,"3,572,665"
0400000US48,Texas,"28,701,845"
0400000US24,Maryland,"6,042,718"
0400000US12,Florida,"21,299,325"
0400000US25,Massachusetts,"6,902,149"
0400000US11,District of Columbia,"702,455"
0400000US49,Utah,"3,161,105"
0400000US36,New York,"19,542,209"
0400000US34,New Jersey,"8,908,520"
0400000US39,Ohio,"11,689,442"
0400000US29,Missouri,"6,126,452"
0400000US42,Pennsylvania,"12,807,060"
0400000US26,Michigan,"9,995,915"
0400000US31,Nebraska,"1,929,268"
0400000US16,Idaho,"1,754,208"
0400000US35,New Mexico,"2,095,428"
0400000US15,Hawaii,"1,420,491"
0400000US46,South Dakota,"882,235"
0400000US53,Washington,"7,535,591"
0400000US44,Rhode Island,"1,057,315"
0400000US04,Arizona,"7,171,646"
0400000US47,Tennessee,"6,770,010"
0400000US20,Kansas,"2,911,510"
0400000US08,Colorado,"5,695,564"
0400000US18,Indiana,"6,691,878"
0400000US21,Kentucky,"4,468,402"
0400000US22,Louisiana,"4,659,978"
0400000US17,Illinois,"12,741,080"
0400000US19,Iowa,"3,156,145"
0400000US33,New Hampshire,"1,356,458"
0400000US05,Arkansas,"3,013,825"
0400000US10,Delaware,"967,171"
0400000US27,Minnesota,"5,611,179"
0400000US30,Montana,"1,062,305"
;;;;


/* population_s.sas7bdat */
data temp.POPULATION_S;
  infile datalines dsd truncover;
  input GEO_ID:$11. State:$20. TotalPopulation:COMMA15.;
  format TotalPopulation COMMA15.;
  label GEO_ID="GEO_ID" State="State" TotalPopulation="TotalPopulation";
datalines4;
0400000US08,Colorado,"5,695,564"
0400000US18,Indiana,"6,691,878"
0400000US21,Kentucky,"4,468,402"
0400000US22,Louisiana,"4,659,978"
0400000US17,Illinois,"12,741,080"
0400000US19,Iowa,"3,156,145"
0400000US33,New Hampshire,"1,356,458"
0400000US05,Arkansas,"3,013,825"
0400000US10,Delaware,"967,171"
0400000US27,Minnesota,"5,611,179"
0400000US30,Montana,"1,062,305"
0400000US23,Maine,"1,338,404"
0400000US37,North Carolina,"10,383,620"
0400000US13,Georgia,"10,519,475"
0400000US02,Alaska,"737,438"
0400000US01,Alabama,"4,887,871"
0400000US50,Vermont,"626,299"
0400000US32,Nevada,"3,034,392"
0400000US54,West Virginia,"1,805,832"
0400000US40,Oklahoma,"3,943,079"
0400000US55,Wisconsin,"5,813,568"
0400000US72,Puerto Rico,"3,195,153"
0400000US51,Virginia,"8,517,685"
0400000US38,North Dakota,"760,077"
0400000US45,South Carolina,"5,084,127"
0400000US41,Oregon,"4,190,713"
0400000US56,Wyoming,"577,737"
0400000US06,California,"39,557,045"
0400000US28,Mississippi,"2,986,530"
0400000US09,Connecticut,"3,572,665"
0400000US48,Texas,"28,701,845"
0400000US24,Maryland,"6,042,718"
0400000US12,Florida,"21,299,325"
0400000US25,Massachusetts,"6,902,149"
0400000US11,District of Columbia,"702,455"
0400000US49,Utah,"3,161,105"
0400000US36,New York,"19,542,209"
0400000US34,New Jersey,"8,908,520"
0400000US39,Ohio,"11,689,442"
0400000US29,Missouri,"6,126,452"
0400000US42,Pennsylvania,"12,807,060"
0400000US26,Michigan,"9,995,915"
0400000US31,Nebraska,"1,929,268"
0400000US16,Idaho,"1,754,208"
0400000US35,New Mexico,"2,095,428"
0400000US15,Hawaii,"1,420,491"
0400000US46,South Dakota,"882,235"
0400000US53,Washington,"7,535,591"
0400000US44,Rhode Island,"1,057,315"
0400000US04,Arizona,"7,171,646"
0400000US47,Tennessee,"6,770,010"
0400000US20,Kansas,"2,911,510"
;;;;


/* stateinfo_combined.sas7bdat */
data temp.STATEINFO_COMBINED;
  infile datalines dsd truncover;
  input GEO_ID:$11. State:$20. Division:$27. Region:$16. MedianIncome:DOLLAR12. MeanHoursWorked:BEST4. TotalPopulation:COMMA12. MedianAge:BEST4. MedianCurrentMarriageDuration:BEST4. MedianMonthlyHousingCosts:DOLLAR10.;
  format MedianIncome DOLLAR12. MeanHoursWorked BEST4. TotalPopulation COMMA12. MedianAge BEST4. MedianCurrentMarriageDuration BEST4. MedianMonthlyHousingCosts DOLLAR10.;
  label MedianIncome="Median Household Income" MeanHoursWorked="Mean Hours Worked per Week" TotalPopulation="Total Population" MedianAge="Median Age" MedianCurrentMarriageDuration="Median Duration of Current Marriage" MedianMonthlyHousingCosts="Median Monthly Housing Costs";
datalines4;
0400000US08,Colorado,Mountain,West,"$71,953",39.2,"5,695,564",36.9,17.7,"$1,335"
0400000US18,Indiana,East North Central,Midwest,"$55,746",39,"6,691,878",37.8,19.8,$838
0400000US21,Kentucky,East South Central,South,"$50,247",38.9,"4,468,402",39.1,19.8,$776
0400000US22,Louisiana,West South Central,South,"$47,905",39.7,"4,659,978",37.3,19.7,$806
0400000US17,Illinois,East North Central,Midwest,"$65,030",38.6,"12,741,080",38.3,20.5,"$1,109"
0400000US19,Iowa,West North Central,Midwest,"$59,955",38.9,"3,156,145",38.1,21.8,$839
0400000US33,New Hampshire,New England,Northeast,"$74,991",38.6,"1,356,458",43.1,22.2,"$1,314"
0400000US05,Arkansas,West South Central,South,"$47,062",39.6,"3,013,825",38.1,19.4,$707
0400000US10,Delaware,South Atlantic,South,"$64,805",38.8,"967,171",41.1,22,"$1,134"
0400000US27,Minnesota,West North Central,Midwest,"$70,315",38.3,"5,611,179",38.2,21.2,"$1,091"
0400000US30,Montana,Mountain,West,"$55,328",38.1,"1,062,305",40.1,21.4,$847
0400000US23,Maine,New England,Northeast,"$55,602",38.3,"1,338,404",45.1,22.5,$908
0400000US37,North Carolina,South Atlantic,South,"$53,855",39.3,"10,383,620",38.9,19.8,$909
0400000US13,Georgia,South Atlantic,South,"$58,756",39.4,"10,519,475",36.8,18.7,"$1,016"
0400000US02,Alaska,Pacific,West,"$74,346",41.7,"737,438",34.9,16.8,"$1,267"
0400000US01,Alabama,East South Central,South,"$49,861",39,"4,887,871",39.3,20.4,$761
0400000US50,Vermont,New England,Northeast,"$60,782",37.9,"626,299",43.1,22.3,"$1,103"
0400000US32,Nevada,Mountain,West,"$58,646",38.8,"3,034,392",38.2,17.4,"$1,143"
0400000US54,West Virginia,South Atlantic,South,"$44,097",39.2,"1,805,832",42.8,23.1,$624
0400000US40,Oklahoma,West South Central,South,"$51,924",39.8,"3,943,079",36.7,18.6,$793
0400000US55,Wisconsin,East North Central,Midwest,"$60,773",38.8,"5,813,568",39.6,22.1,$934
0400000US51,Virginia,South Atlantic,South,"$72,577",39.2,"8,517,685",38.3,19,"$1,256"
0400000US38,North Dakota,West North Central,Midwest,"$63,837",40.4,"760,077",35.4,19.2,$827
0400000US45,South Carolina,South Atlantic,South,"$52,306",39,"5,084,127",39.7,20.9,$857
0400000US41,Oregon,Pacific,West,"$63,426",37.9,"4,190,713",39.6,19.4,"$1,198"
0400000US56,Wyoming,Mountain,West,"$61,584",40.3,"577,737",38.5,20.3,$883
0400000US06,California,Pacific,West,"$75,277",38.3,"39,557,045",36.7,19,"$1,626"
0400000US28,Mississippi,East South Central,South,"$44,717",39.4,"2,986,530",37.7,19.1,$697
0400000US09,Connecticut,New England,Northeast,"$76,348",38.2,"3,572,665",41.1,21,"$1,429"
0400000US48,Texas,West South Central,South,"$60,629",40,"28,701,845",34.9,17.8,"$1,059"
0400000US24,Maryland,South Atlantic,South,"$83,242",38.9,"6,042,718",38.8,19.3,"$1,489"
0400000US12,Florida,South Atlantic,South,"$55,462",38.9,"21,299,325",42.2,20.5,"$1,084"
0400000US25,Massachusetts,New England,Northeast,"$79,835",38.1,"6,902,149",39.5,20.6,"$1,531"
0400000US11,District of Columbia,South Atlantic,South,"$85,203",40.3,"702,455",33.9,10.7,"$1,695"
0400000US49,Utah,Mountain,West,"$71,414",37.1,"3,161,105",31,17.4,"$1,160"
0400000US36,New York,Middle Atlantic,Northeast,"$67,844",38.4,"19,542,209",39,20.3,"$1,336"
0400000US34,New Jersey,Middle Atlantic,Northeast,"$81,740",38.7,"8,908,520",40,20.6,"$1,588"
0400000US39,Ohio,East North Central,Midwest,"$56,111",38.6,"11,689,442",39.5,21.3,$864
0400000US29,Missouri,West North Central,Midwest,"$54,478",38.9,"6,126,452",38.8,20,$860
0400000US42,Pennsylvania,Middle Atlantic,Northeast,"$60,905",38.7,"12,807,060",40.8,22.2,$973
0400000US26,Michigan,East North Central,Midwest,"$56,697",38.3,"9,995,915",39.8,21.5,$881
0400000US31,Nebraska,West North Central,Midwest,"$59,566",39.5,"1,929,268",36.7,20,$901
0400000US16,Idaho,Mountain,West,"$55,583",38.5,"1,754,208",36.8,19.6,$904
0400000US35,New Mexico,Mountain,West,"$47,169",38.3,"2,095,428",38.1,20.7,$795
0400000US15,Hawaii,Pacific,West,"$80,212",38.6,"1,420,491",39.3,18.5,"$1,628"
0400000US46,South Dakota,West North Central,Midwest,"$56,274",39.6,"882,235",37.2,22.4,$804
0400000US53,Washington,Pacific,West,"$74,073",38.7,"7,535,591",37.7,18,"$1,381"
0400000US44,Rhode Island,New England,Northeast,"$64,340",38,"1,057,315",40,20,"$1,220"
0400000US04,Arizona,Mountain,West,"$59,246",38.8,"7,171,646",38,19.8,"$1,029"
0400000US47,Tennessee,East South Central,South,"$52,375",39.3,"6,770,010",38.9,19.7,$851
0400000US20,Kansas,West North Central,Midwest,"$58,218",39.2,"2,911,510",37.1,20.2,$893
;;;;



proc contents data=temp._all_ nods;
run;

libname temp clear;