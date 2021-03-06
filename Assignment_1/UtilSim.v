module SimMux8x1 ;

wire o ;
reg  [7:0] i ;
reg [2:0] s ;

Mux8x1 M(i[0],i[1],i[2],i[3],i[4],i[5],i[6],i[7],s[0],s[1],s[2],o) ;

initial
begin
for(i=0;i<255;i=i+1) 
	begin 
	for(s=0;s<7;s=s+1)
		#100;
	#100 ;
	end
for(s=0;s<7;s=s+1)
	#100;
#100 ;
end 

endmodule
/*
module Sim5And; 

wire o ;
reg [4:0] i ;

AndGate5In A(i[4],i[3],i[2],i[1],i[0],o) ;

initial 
begin 
for(i=0;i<31;i=i+1) 
#100 ;
#100 ;
end

endmodule*/

module SimMux4x1 ;

wire o ;
reg [3:0]i ;
reg [1:0]s ;

Mux4x1 M(i,s,o) ;

initial 
begin 
for(i=0;i<15;i=i+1)
	begin 
	s = 2'b00 ;
	#100 s = 2'b01 ;
	#100 s = 2'b10 ;
	#100 s = 2'b11 ;
	#100 ;
	end
s = 2'b00 ;
#100 s = 2'b01 ;
#100 s = 2'b10 ;
#100 s = 2'b11 ;
#100 ;
end 

endmodule 
/*
module SimMux16x1 ;

wire o ;
reg [15:0] i ;
reg [3:0] s ;

Mux16x1 M(i,s,o) ;

initial 
begin 
for(i=0;i<65535;i=i+1)
	begin
	s = 4'b0000 ;
	#100 s = 4'b0001 ;
	#100 s = 4'b0010 ;
	#100 s = 4'b0011 ;
	#100 s = 4'b0100 ;
	#100 s = 4'b0101 ;
	#100 s = 4'b0110 ;
	#100 s = 4'b0111 ;
	#100 s = 4'b1000 ;
	#100 s = 4'b1001 ;
	#100 s = 4'b1010 ;
	#100 s = 4'b1011 ;
	#100 s = 4'b1100 ;
	#100 s = 4'b1101 ;
	#100 s = 4'b1110 ;
	#100 s = 4'b1111 ;
	#100 ;
	end
end
initial
begin
#100 ;
end

endmodule

module SimMux16x1by4 ;

wire o ;
reg [15:0] i ;
reg [3:0] s ;

Mux16x1by4 M(i,s,o) ;

initial 
begin 
for(i=0;i<65535;i=i+1)
	begin
	s = 4'b0000 ;
	#100 s = 4'b0001 ;
	#100 s = 4'b0010 ;
	#100 s = 4'b0011 ;
	#100 s = 4'b0100 ;
	#100 s = 4'b0101 ;
	#100 s = 4'b0110 ;
	#100 s = 4'b0111 ;
	#100 s = 4'b1000 ;
	#100 s = 4'b1001 ;
	#100 s = 4'b1010 ;
	#100 s = 4'b1011 ;
	#100 s = 4'b1100 ;
	#100 s = 4'b1101 ;
	#100 s = 4'b1110 ;
	#100 s = 4'b1111 ;
	#100 ;
	end
end
initial
begin
#100 ;
end

endmodule

module SimMux16x1by8 ;

wire o ;
reg [15:0] i ;
reg [3:0] s ;

Mux16x1by8 M(i,s,o) ;

initial 
begin 
for(i=0;i<65535;i=i+1)
	begin
	s = 4'b0000 ;
	#100 s = 4'b0001 ;
	#100 s = 4'b0010 ;
	#100 s = 4'b0011 ;
	#100 s = 4'b0100 ;
	#100 s = 4'b0101 ;
	#100 s = 4'b0110 ;
	#100 s = 4'b0111 ;
	#100 s = 4'b1000 ;
	#100 s = 4'b1001 ;
	#100 s = 4'b1010 ;
	#100 s = 4'b1011 ;
	#100 s = 4'b1100 ;
	#100 s = 4'b1101 ;
	#100 s = 4'b1110 ;
	#100 s = 4'b1111 ;
	#100 ;
	end
end
initial
begin
#100 ;
end

endmodule*/

module Diff ;

reg [7:0] i1 ;
reg [0:7] i2 ;

initial 
begin
i2 = 8'b11111111 ;
for(i1=0;i1<255;i1=i1+1)
	begin
	i2 = i2 + 1 ;
	#100 ;
	end 
end

endmodule 