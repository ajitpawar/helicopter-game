//offset adder
module offsetadder (offset, in, out);
	input [n:0] offset, in;
	output [n:0] out;
	
	parameter n = 6;
	parameter speed = 3;
	
	assign out = in + offset + speed;

endmodule
