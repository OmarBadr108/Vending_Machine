module vending_machine_tb ();
reg clk,rstn,din,qin ;
wire dispense , change ;

	initial begin 
 		clk = 0; 
 		forever begin 
 		#2 clk = ~clk;
 		end
	end


	vending_machine  m1 (clk,dispense,change,din,qin,rstn);

	
	initial begin 
	rstn = 0 ;
	qin = 0 ;
	din = 0 ;
	#50
	rstn = 1 ;
	#100;
	din = 1 ;qin = 0 ;
	#100 din = 0 ;qin = 1;
	#100 ;
	$stop ;	 


	end
endmodule
