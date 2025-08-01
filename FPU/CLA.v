

module cla(A,B,CIN,COUT,S);

input [3:0] A,B ;
input CIN ;
output COUT ;
output [3:0] S ;

wire [3:0] P,G ;

assign P = A^B ;
assign G = A&B ;

wire [3:0] Carry ;

assign Carry[0] = G[0] | (P[0]&CIN) ;
assign Carry[1] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&CIN) ;
assign Carry[2] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&CIN) ;
assign Carry[3] = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&CIN) ;

assign COUT = Carry[3] ;

assign S = P ^ {Carry[2:0],CIN} ;

endmodule 

