

module ha(A,B,SUM,COUT);
		input  A, B;
		output SUM, COUT;
	
	
	assign SUM  = A^B;
	assign COUT = A&B;
endmodule

