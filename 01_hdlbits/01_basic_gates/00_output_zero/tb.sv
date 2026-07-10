module tb;

  logic zero;
  int errors;

  top_module dut (
    .zero(zero)
  );

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);

    errors = 0;

    #1;

    if (zero !== 1'b0) begin
      $display("ERROR: expected zero=0, got zero=%0b", zero);
      errors++;
    end

    if (errors == 0)
      $display("PASS");
    else
      $display("FAIL: errors = %0d", errors);

    $finish;
  end

endmodule
