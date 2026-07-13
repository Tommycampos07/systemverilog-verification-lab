module tb;

	logic in;
	logic out;
	int errors;

	top_module dut (

	  .in(in),
	  .out(out)

);

task check(input logic value, input logic expected);
	begin

	  in = value;

	  #1;

	  if (out !== expected) begin

	     $display("FAIL: in = %0b expected = %0b got = %0b", in, expected, out);
	     errors++;
	  end
	end
endtask

initial begin

   $dumpfile("wave.vcd");
   $dumpvars(0, tb);

   errors = 0;

   check(1'b0, 1'b0);
   check(1'b1, 1'b1);

   if (errors == 0)

      $display("PASS");

   else
   
      $display("FAIL: errors = %0d", errors);

   $finish;
end

endmodule
