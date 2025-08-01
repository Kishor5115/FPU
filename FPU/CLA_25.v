

module cla_25(A,B,CIN,OUT,OF);
		input  [24:0] A,B;
		input   CIN;
		output [24:0] OUT;
		output  OF;
	
	
	wire COUT0, COUT1, COUT2, COUT3, COUT4,COUT5;
	
	cla claalu_0(.A(A[3:0]), .B(B[3:0]), .CIN(CIN),   .COUT(COUT0), .S(OUT[3:0]));
	cla claalu_1(.A(A[7:4]), .B(B[7:4]), .CIN(COUT0), .COUT(COUT1), .S(OUT[7:4]));
	cla claalu_2(.A(A[11:8]), .B(B[11:8]), .CIN(COUT1), .COUT(COUT2), .S(OUT[11:8]));
	cla claalu_3(.A(A[15:12]), .B(B[15:12]), .CIN(COUT2), .COUT(COUT3), .S(OUT[15:12]));
	cla claalu_4(.A(A[19:16]),	.B(B[19:16]), .CIN(COUT3), .COUT(COUT4), .S(OUT[19:16]));
	cla claalu_5(.A(A[23:20]),	.B(B[23:20]), .CIN(COUT4), .COUT(COUT5), .S(OUT[23:20]));
	
	assign OUT[24] = A[24] ^ B[24] ^ COUT5;	
	assign OF = (A[24] & B[24]) | (B[24] & COUT5) | (COUT5 & A[24]);
	
endmodule 

