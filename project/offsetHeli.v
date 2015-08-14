module offsetHeli (clk, resetn, enable, out, up, down);
	
	input clk, resetn, enable, up, down;
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
				out <= out + 1;
			end
			else if (down)
			begin
				out <= out - 1;
			end
			else
			begin
				out <= out;
			end
		end
	end

endmodule

