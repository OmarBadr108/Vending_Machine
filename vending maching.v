module vending_machine (clk,dispense,change,din,qin,rstn);
parameter  WAIT = 2'b00 ;
parameter  Q_50 = 2'b01 ;
parameter  Q_25 = 2'b10 ;

input clk,rstn,din,qin ;
output dispense , change ;
reg [1:0] cs , ns ;
//next state logic

	always @(*) begin
		case (cs)
			WAIT : 
			if (qin)
				ns = Q_25 ;
			else 
				ns = WAIT ;
			Q_25 :
			if (qin)
				ns = Q_50 ;
			else 
				ns = Q_25 ;
			Q_50 :
			if (qin)
				ns = WAIT ;
				//dispense = 1 ;
				//change = 0 ;
			else 
				ns = Q_50 ;
			default : ns = WAIT ;
		endcase 
	end 




// state memory 
always @(posedge clk or negedge rstn) begin
	if (~rstn) 
		cs <= WAIT ;
	else 
		cs <= ns ;
end


//output logic 

assign dispense =((cs==Q_50 && ns==WAIT)||(din==1&&cs==Q_50))? 1'b1 : 1'b0 ;
assign change = (cs== WAIT && din==1)? 1'b1 : 1'b0 ;
endmodule



