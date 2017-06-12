#pragma rtGlobals=3		// Use modern global access method and strict wave access.

//Procedure to plot 2-D waves on plot with some offset //
// TO USE- Select a 2D wave in browser and then run the command in Command window. //
// NO OFFSET //

function plotall_nooffset()

wave twave
string name23
name23=GetBrowserSelection(0)

wavestats /q $name23
variable MaxValue=V_max
variable ofst = V_max * 0.075
printf "Offset:%g\r",ofst 
		wave twave=$name23
		variable p1,p2,p3
		p1=dimsize(twave,1)
		p2=dimsize(twave,0)

		print p1,p2
		printf "columns : %g\r", p1
		
			if (p1==0)
			Abort "1D Wave selected. Choose right wave and try again. \r Column number 0 causes no ending loop ! \r Choose multi-dimensional wave."
			endif
				
		p3=p1-1
		string n1= NameOfWave (twave)
		string tracename=n1+"#"
					
		variable q1,q2
		q1=0
		display /w=(350,230,720,420) /k=1 $name23
		string fullname
		
		//print fullname

		for (q1=1 ; q1!=p1  ; q1=q1+1)
		AppendToGraph $name23[][(q1)]
		
		
		variable q4=q1*ofst
		sprintf fullname, "%s%g",tracename,q1
		//print fullname
		
		ModifyGraph rgb($fullname)=(8738,8738,8738)
		

		endfor
		// Annotation in the text box
		string annot2
		sprintf annot2, " %g traces\r Wave name :%s \r V_Max: %g ",p1,name23,MaxValue
		TextBox/C/N=text0/A=LT annot2
		print "Plotted successfully"
	killvariables /a/z
end

//**********************************************************************************************************************

//FUNCTION TO PLOT MULTIDIMENSIONAL (2D) WAVES WITH SPECIFIED OFFSET
//OFFSET VALUE IS DETERMINED BY THE MAXIMUM VALUE OF THE WAVE 
//OFFSET IS 0.075 OF THE MAXIMUM VALUE // Change by changing number in the procedure 
// 0.075 is a good number by the way ! Check yourself.

// TO USE- Select a 2D wave in browser and then run the command in Command window. //

function plotall_withoffset()

wave twave
string name23
name23=GetBrowserSelection(0)

wavestats $name23
variable MaxValue=V_max
variable ofst = V_max * 0.075
printf "Offset:%g\r",ofst 
		wave twave=$name23
		variable p1,p2,p3
		p1=dimsize(twave,1)
		p2=dimsize(twave,0)

		print p1,p2
		printf "columns : %g\r", p1
		
			if (p1==0)
			Abort "1D Wave selected. Choose right wave and try again. \r Column number 0 causes no ending loop ! \r Choose multi-dimensional wave."
			endif
				
		p3=p1-1
		string n1= NameOfWave (twave)
		string tracename=n1+"#"
					
		variable q1,q2
		q1=0
		display /w=(350,230,720,420) /k=1 $name23
		string fullname
		
		//print fullname

		for (q1=1 ; q1!=p1  ; q1=q1+1)
		AppendToGraph $name23[][(q1)]
		
		
		variable q4=q1*ofst
		sprintf fullname, "%s%g",tracename,q1
		//print fullname
		ModifyGraph offset ($fullname)={0,(q4)}
		ModifyGraph rgb($fullname)=(8738,8738,8738)
		

		endfor
		// Annotation in the text box
		string annot2
		sprintf annot2, " %g traces\r Wave name :%s \r V_Max: %g ",p1,name23,MaxValue
		TextBox/C/N=text0/A=LT annot2
		print "Plotted successfully"
	killvariables /a/z
end

////**********************************************************************************************************