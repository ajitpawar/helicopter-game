module counterC (clk, resetn, enable, erase, color, x, y, plot, done);
input clk, resetn, enable, erase;
output reg plot;
output reg [7:0]x;
output reg [6:0]y;
wire [7:0] addr;
//wire [2:0] color_out;
output reg [2:0] color;
output reg done;

parameter width=10, height=10;	
parameter x_offset=120, y_offset=80;		// objectA is drawn at (60,60) at start

always @ (posedge clk or negedge resetn)
begin
	if (!resetn)
	begin
		x <= x_offset;
		y <= y_offset;
		plot <= 0;
		color <= 3'b000;
		done <= 0;
	end
	else if (!enable)
	begin
		x <= x;
		y <= y;
		plot <= 0;
		color <= 3'b000;
		done <= 0;
	end
	else
	begin
		if (erase)
		begin
			if (y < height+y_offset)
			begin
				if (x < width+x_offset)
				begin
					x <= x + 1;
					y <= y;
					plot <= 1;
					done <= 0;
					color <= 3'b000;
				end
				else
				begin
					x <= x_offset;
					y <= y + 1;
					plot <= 1;
					done <= 0;
					color <= 3'b000;
				end
			end
			else
			begin
				x <= x_offset;
				y <= y_offset;
				plot <= 0;
				color <= color;
				done <= 1;
			end
		end
		else
		begin
			if (y < height+y_offset)
			begin
				if (x < width+x_offset)
				begin
					x <= x + 1;
					y <= y;
					plot <= 1;
					done <=0;
					color <= 3'b001;
				end
				else
				begin
					x <= x_offset;
					y <= y + 1;
					plot <= 1;
					done <= 0;
					color <= 3'b001;
				end
			end
			else
			begin
				x <= x_offset;
				y <= y_offset;
				plot <= 0;
				color <= color;
				done <= 1;
			end
		end
	end
end

endmodule

