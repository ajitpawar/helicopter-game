module offsetBlocks(clk, resetn, enable, out, up, down, level);

	input clk, resetn, enable, up, down;
	input [2:0] level;
	output reg [n:0] out;
	
	parameter n = 6;

	always @ (posedge clk or negedge resetn)
	begin
		if (!resetn)
		begin
			out <= 0;
		end
		else if (!enable)
		begin
			out <= out;
		end
		else
		begin
			if (up)
			begin
				out <= out + level;		// Increment x-y coord by level
			end
			else if (down)
			begin
				out <= out - level;		// Decrement x-y coord by level
			end
			else
			begin
				out <= out;
			end
		end
	end

endmodule

