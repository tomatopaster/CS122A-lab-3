module halfadder (
  /** Input Ports */
  input wire val1,
  input wire val2,
  /** Output Ports */
  output logic res,
  output logic carryout
);

/** Logic */
assign res = val1 ^ val2;
assign carryout  = val1 & val2;

endmodule