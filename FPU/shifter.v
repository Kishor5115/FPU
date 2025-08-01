

module shifter(IN,BY,OUT);
		input  [23:0] IN;
		input  [7:0]  BY;
		output reg [23:0] OUT;
	
	wire COUT_INT;
	wire [3:0] BY_COMPL_L0WER,BY_COMP_UPPER;
	wire [7:0] BY_COMPL;

	assign BY_COMPL = {BY_COMP_UPPER,BY_COMPL_L0WER} ;	
	// Calculating the absolute
	
	twos_cla t_shft0(
		.B(~BY[3:0]), 
		.CIN(1'b1),   
		.COUT(COUT_INT), 
		.S(BY_COMPL_L0WER)
	);
	
	twos_cla t_shft1(
		.B(~BY[7:4]), 
		.CIN(COUT_INT),   
		.COUT(), 
		.S(BY_COMP_UPPER)
	);
		
	always@(*) 
    begin
		if (BY[7] == 1'b0) 
            begin	// When BY is > 0
			    OUT = IN >> BY;
		    end 
        else 
            begin					// When BY is < 0
			    OUT = IN >> BY_COMPL;
		    end
	end
endmodule 

