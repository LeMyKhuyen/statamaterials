/*******************************************************************************
  ____  _   _ ____ ____ _____ ___   ___ ____  
 | __ )| | | / ___/ ___|___  / _ \ / _ \___ \ 
 |  _ \| | | \___ \___ \  / / (_) | | | |__) |
 | |_) | |_| |___) |__) |/ / \__, | |_| / __/ 
 |____/ \___/|____/____//_/    /_/ \___/_____|
 
 Welcome to BUSS7902 Quantitative Business Research Methods

 This material is prepared by Dr. Mingze Gao (mingze.gao@sydney.edu.au).
 Course coordinator:
 - Dr. Claire Liu (claire.liu@sydney.edu.au) 2023 Semester 1
 - Dr. Boris Choy (boris.choy@sydney.edu.au) 2023 Semester 2
 
 ******************************************************************************/   
 

/* Hint:
   You can execute this file by either of the following:
	1) Click on the "Execute (do)" button
	2) "Ctrl+D" on Windows or "CMD+SHIFT+D" on Mac
 */
display "BUSS7902 Chapter 4A - Statistical Inference I"



/*******************************************************************************
 Import data from Excel spreadsheet
 ******************************************************************************/                    

local spreadsheet "${input}/spreadsheets/BUSS7902 Chapter 4A Lecture (Data).xlsx"

// Describe contents of an Excel file
import excel using "`spreadsheet'", describe

// Import the sheet "Magic Box"
import excel using "`spreadsheet'", ///
	firstrow sheet("Magic Box") cellrange(A1:A101) clear
save "${temp}/magicbox.dta", replace

// Import the sheet "Assembly"
import excel using "`spreadsheet'", ///
	firstrow sheet("Assembly") cellrange(A1:A76) clear case(lower)
save "${temp}/assembly.dta", replace

// Import the sheet "Distance"
import excel using "`spreadsheet'", ///
	firstrow sheet("Distance") cellrange(A1:A42) clear case(lower)
save "${temp}/distance.dta", replace

// Import the sheet "Insurance+Survey"
import excel using "`spreadsheet'", ///
	firstrow sheet("Insurance+Survey") cellrange(A1:A1501) clear case(lower)
save "${temp}/insurance.dta", replace



/*******************************************************************************
 Run do files and solve questions
 ******************************************************************************/                    

foreach sheet in magicbox assembly distance insurance {
	do "${code}/statistical_inference_`sheet'.do"
}
