module freq_div_1hz(clock, reset, out);
    input clock, reset;
    output reg out;
 
    reg [25:0] count;
     
    always @ (posedge clock)
    begin 
       if (~reset) begin
           if(count==50000000) begin
              count <= 0;
				  out <= 1;
           end else begin
              count <= count + 1;
				  out <= 0;
           end
       end else begin
          count <=0;
          out <= 0;
       end
    end
endmodule