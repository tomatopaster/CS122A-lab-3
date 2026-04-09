`include "src/decoder.sv"
`include "src/adder4bit.sv"

module top (
    /** Input Ports */
    input wire [3:0] val1,
    input wire [3:0] val2,
    /** Output Ports */
    output logic [7:0] seg7
);

/** Logic */
wire [4:0] res;

adder4bit add(
  .val1(val1),
  .val2(val2),
  .res(res)
);

decoder decode(
  .bcd(res[3:0]),
  .seg7(seg7[6:0])
);

assign seg7[7] = res[4];

endmodule