module SimNot16 ; 	// 7

wire [0:15] b ;
reg [0:15] a ;

NotGate16 NG16_Out(a,b) ;

initial 
begin 
a = 16'b0000000000000000 ; #100 ;
a = 16'b1111111111111111 ; #100 ;
a = 16'b1010101010101010 ; #100 ;
a = 16'b0101010101010101 ; #100 ;
a = 16'b1100110011001100 ; #100 ;
a = 16'b0011001100110011 ; #100 ;
a = 3205 ; #100 ;
a = 35971 ; #100 ;
a = 9273 ; #100 ;
a = 23987 ; #100 ;
end

endmodule