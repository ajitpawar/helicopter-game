//comparator
module comparator (in, outhigh, outlow);
	parameter n = 7;
	parameter upper = 0;
	parameter lower = 7'd119;
	input [n:0] in;
	output outhigh;
	output outlow;
	
	assign outhigh = (in == upper);
	assign outlow = (in == lower);
	
endmodule
