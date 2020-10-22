module SimNot ;		// 1

wire b ;
reg a ;

NotGate NG(a,b) ;

initial 
begin
a = 1'b0 ;
#100 a = 1'b1 ;
#100 ;
end 

endmodule  

module SimAnd ;		// 2

wire c ;
reg a,b ;

AndGate AG_Out(a,b,c) ;

initial 
begin 
a = 1'b0  ; b = 1'b0 ;
#100 a = 1'b1 ; b = 1'b0 ;
#100 a = 1'b0 ; b = 1'b1 ;
#100 a = 1'b1 ; b = 1'b1 ; 
#100 ;
end

endmodule

module SimOr ;		// 3

wire c ;
reg a,b ;

OrGate OG_Out(a,b,c) ;

initial 
begin 
a = 1'b0 ; b = 1'b0 ;
#100 a = 1'b1 ; b = 1'b0 ;
#100 a = 1'b0 ; b = 1'b1 ;
#100 a = 1'b1 ; b = 1'b1 ; 
#100 ;
end

endmodule 

module SimNor ;		// 4

wire c ;
reg a,b ;

NorGate NG_Out(a,b,c) ;

initial 
begin 
a = 1'b0 ; b = 1'b0 ;
#100 a = 1'b1 ; b = 1'b0 ;
#100 a = 1'b0 ; b = 1'b1 ;
#100 a = 1'b1 ; b = 1'b1 ; 
#100 ;
end

endmodule 

module SimXor ;		// 5 

wire c ;
reg a,b ;

XorGate XG(a,b,c) ;

initial 
begin 
a = 1'b0 ; b = 1'b0 ;
#100 a = 1'b1 ; b = 1'b0 ;
#100 a = 1'b0 ; b = 1'b1 ;
#100 a = 1'b1 ; b = 1'b1 ; 
#100 ;
end

endmodule 

module SimXnor ;	// 6

wire c ;
reg a,b ;

XnorGate XnG_Out(a,b,c) ;

initial 
begin 
a = 1'b0 ; b = 1'b0 ;
#100 a = 1'b1 ; b = 1'b0 ;
#100 a = 1'b0 ; b = 1'b1 ;
#100 a = 1'b1 ; b = 1'b1 ; 
#100 ;
end

endmodule 

module SimNot16 ; 	// 7

wire [0:15] b ;
reg [0:15] a ;

NotGate16 NG16_Out(a,b) ;

initial 
begin 
for(a=0;a<256;a=a+1)
	#100 ;
end

endmodule

module SimAnd16 ;	// 8 

wire [0:15] c;
reg [0:15] a,b ;

AndGate16 AG16_Out(a,b,c) ;

initial 
begin 
for(a=0;a<256;a=a+1)
	for(b=0;b<256;b=b+1)
		#50 ;
end 

endmodule

module SimOr16 ;	// 9 

wire [0:15] c;
reg [0:15] a,b ;

OrGate16 OG16_Out(a,b,c) ;

initial 
begin 
for(a=0;a<256;a=a+1)
	for(b=0;b<256;b=b+1)
		#50 ;
end 

endmodule

module SimXor16 ;	// 10

wire [0:15] c;
reg [0:15] a,b ;

XorGate16 XG16_Out(a,b,c) ;

initial 
begin 
for(a=0;a<256;a=a+1)
	for(b=0;b<256;b=b+1)
		#50 ;
end 

endmodule

module Sim8Or ; 	// 11

wire o ;
reg [7:0] i ;

OrGate8In O(i[7],i[6],i[5],i[4],i[3],i[2],i[1],i[0],o) ;

initial 
begin 
for(i=0;i<255;i=i+1)
	#100 ;
#100 ;
end

endmodule 

module SimMux ;		// 12

wire c ;
reg a,b,s ;

Mux M_1(a,b,s,c) ;

initial 
begin 
s = 1'b0 ; a = 1'b0 ; b = 1'b0 ;
#100 s = 1'b0 ; a = 1'b0 ; b = 1'b1 ;
#100 s = 1'b0 ; a = 1'b1 ; b = 1'b0 ;
#100 s = 1'b0 ; a = 1'b1 ; b = 1'b1 ;
#100 s = 1'b1 ; a = 1'b0 ; b = 1'b0 ;
#100 s = 1'b1 ; a = 1'b0 ; b = 1'b1 ;
#100 s = 1'b1 ; a = 1'b1 ; b = 1'b0 ;
#100 s = 1'b1 ; a = 1'b1 ; b = 1'b1 ;
#100 ;
end

endmodule

module SimDMux ;	// 13

wire a,b ;
reg s,c;

DMux1x2 DM(c,s,a,b) ;

initial 
begin 
s = 1'b0 ; c = 1'b0 ;
#100 s = 1'b0 ; c = 1'b1 ;
#100 s = 1'b1 ; c = 1'b0 ;
#100 s = 1'b1 ; c = 1'b1 ;
#100 ;
end 

endmodule 

module Sim16Mux2x1 ;	// 14

wire [15:0] o ;
reg [15:0] a,b ;
reg s ;

Mux2x1_16 M(a,b,s,o) ;

initial 
begin
for(a=0;a<1023;a=a+1)
	for(b=0;b<1023;b=b+1)
		begin 
		s = 1'b0 ; #10 ;
		s = 1'b1 ; #10 ;
		end
s = 1'b0 ; #10 ;
s = 1'b1 ; #10 ;
end
endmodule 

module Sim16Mux4x1 ;	// 15

wire [15:0] o ;
reg [15:0] i0,i1,i2,i3 ;
reg [1:0] s ;

Mux4x1_16 M(i0,i1,i2,i3,s,o) ;

initial
begin
for(i3=0;i3<255;i3=i3+1)
	begin
	for(i2=0;i2<255;i2=i2+1)
		begin
		for(i1=0;i1<255;i1=i1+1)
			begin
			for(i0=0;i0<255;i0=i0+1)
				begin
				s = 2'b00 ; #50 ;
				s = 2'b01 ; #50 ;
				s = 2'b10 ; #50 ;
				s = 2'b11 ; #50 ;
				end 
			end
		end
	end
end
endmodule 

module Sim16Mux8x1 ;	// 16 

wire [15:0] o ;
reg [15:0] i1,i2,i3,i4,i5,i6,i7,i8 ;
reg [2:0] s ;

Mux8x1_16 M(i1,i2,i3,i4,i5,i6,i7,i8,s,o) ;

initial
begin 
for(i8=0;i8<4;i8=i8+1)
for(i7=0;i7<4;i7=i7+1)
for(i6=0;i6<4;i6=i6+1)
for(i5=0;i5<4;i5=i5+1)
for(i4=0;i4<4;i4=i4+1)
for(i3=0;i3<4;i3=i3+1)
for(i2=0;i2<4;i2=i2+1)
for(i1=0;i1<4;i1=i1+1)
	begin
	s=3'b000 ; #10 ;
	s=3'b001 ; #10 ;
	s=3'b010 ; #10 ;
	s=3'b011 ; #10 ;
	s=3'b100 ; #10 ;
	s=3'b101 ; #10 ;
	s=3'b110 ; #10 ;
	s=3'b111 ; #10 ;
	end
end
endmodule 

module SimDMux1x4; 	// 17

wire [3:0] i;
reg [1:0] s;
reg o ;

DMux1x4 D(o,s,i) ;

initial 
begin
s = 2'b00 ; o=1'b0 ; #100 ;
s = 2'b00 ; o=1'b1 ; #100 ;
s = 2'b01 ; o=1'b0 ; #100 ;
s = 2'b01 ; o=1'b1 ; #100 ;
s = 2'b10 ; o=1'b0 ; #100 ;
s = 2'b10 ; o=1'b1 ; #100 ;
s = 2'b11 ; o=1'b0 ; #100 ;
s = 2'b11 ; o=1'b1 ; #100 ;
end 

endmodule 

module SimDMux1x8 ;

wire [7:0] i ;
reg [2:0] s ;
reg o ;

DMux1x8 D(o,s,i) ;
initial 
begin 
for(s=0;s<7;s=s+1)
	begin
	o = 1'b0 ; #100 ;
	o = 1'b1 ; #100 ;
	end 
o = 1'b0 ; #100 ;
o = 1'b1 ; #100 ;
end 

endmodule 